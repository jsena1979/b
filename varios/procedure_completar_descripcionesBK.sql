DROP PROCEDURE IF EXISTS completar_descripciones;
DELIMITER $$
CREATE PROCEDURE `completar_descripciones`( in marca varchar(500), in categoria varchar(500))
begin
declare existe,no_hay_registros,id_vm,padre,categ,id_marca int default 0;
DECLARE sku,cod,marc,descrip,desc_adic varchar(500);
DECLARE micursor CURSOR FOR SELECT t.SKUCode,t.codigo,t.marca,t.Description,t.AdditionalDescription  FROM ernes_articulos_tango t where  t.marca=trim(Marca)completar_descripciones;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET no_hay_registros=1;
OPEN micursor;
set id_marca = (select virtuemart_category_id from 
ernes_virtuemart_categories_es_es cd, ernes_virtuemart_category_categories cc
where cc.id=cd.virtuemart_category_id
and cd.category_name=trim(marca) and category_parent_id in (select virtuemart_category_id from  ernes_virtuemart_categories_es_es where category_name=trim(categoria)));
 bucle:loop
fetch micursor into sku,cod,marc,descrip,desc_adic;
	 if (no_hay_registros = 1) then
	  leave bucle; 
	end if;
		#Verifico si el articulo ya tiene una descripcion
        set id_vm = (select v.virtuemart_product_id from ernes_virtuemart_products v where trim(v.product_sku)=trim(sku));
        set existe =  (select count(*) from ernes_virtuemart_products_es_es where virtuemart_product_id=id_vm);
		if(existe>0) then
			#Actualizo descripcion
			update ernes_virtuemart_products_es_es 
			set 
				product_desc=concat(cod,'<br />',desc_adic,' ',marca,'<br />',descrip ),
				product_name=concat(cod,' ',desc_adic),
				slug = concat(marca,'-',replace(replace(replace(replace(descrip,'.','-'),'/','-'),'+','-'),',','-'),'-',sku)
			where 
				virtuemart_product_id=id_vm;
		else 
			#Creo nuevas descripciones
            select id_vm;
			insert into ernes_virtuemart_products_es_es (virtuemart_product_id,product_desc,product_name,slug) 
			values(
				id_vm,
				concat(cod,'<br />',desc_adic,' ',marca,'<br />',descrip ),
				concat(cod,' ',desc_adic),
				concat(marca,'-',replace(replace(replace(replace(descrip,'.','-'),'/','-'),'+','-'),',','-'),'-',sku)
                );
		end if;
        #Pregunto si no esta categorizado. Si no lo esta lo pongo bajo la marca en cuestion
        set padre = (select v.virtuemart_product_id from ernes_virtuemart_products v where trim(v.product_sku)=trim(sku) and product_parent_id=0);/*Pregunto si es un producto padre*/
		if(padre>0) then
			set categ = (select count(virtuemart_product_id) from ernes_virtuemart_product_categories where virtuemart_product_id=id_vm);
			if (categ=0) then
					insert into ernes_virtuemart_product_categories (virtuemart_product_id,virtuemart_category_id,ordering) values(
						id_vm,
						id_marca,
						'0'
					);
			end if;
		end if;
end loop bucle;
end$$