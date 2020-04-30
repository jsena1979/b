DROP PROCEDURE IF EXISTS completar_derivados_articulos;
DELIMITER $$
CREATE PROCEDURE `completar_derivados_articulos`( in marca varchar(500),in usuario int)
begin
declare existe,no_hay_registros,id_vm,padre,categ,id_marca int default 0;
DECLARE sku,cod,marc,talle,color,adesc varchar(500);
declare derivados varchar(5000);
DECLARE micursor CURSOR FOR SELECT t.SKUCode,t.codigo,t.marca,t.talle,t.color,tAdditionalDescription  FROM ernes_articulos_tango t where  t.marca=trim(Marca);
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET no_hay_registros=1;
OPEN micursor;
bucle:loop
fetch micursor into sku,cod,marc,talle,color,adesc;
	 if (no_hay_registros = 1) then
	  leave bucle; 
	end if;
        #Obtengo el id del padre
        set id_vm = (select v.virtuemart_product_id from ernes_virtuemart_products v where trim(v.product_sku)=trim(sku) and product_parent_id=0);
        #Verifico si el articulo ya tiene creados los derivados
        set existe =  (select count(*) from ernes_virtuemart_product_customfields where virtuemart_product_id=id_vm);
		if(existe>0) then
			#Actualizo campo personalizado
			update ernes_virtuemart_product_customfields 
			set 
				customfield_params=derivados
			where 
				virtuemart_product_id=id_vm;
		else 
			#Creo nuevo campo personaizado
				INSERT INTO ernes_virtuemart_product_customfields 
					(
					  `virtuemart_product_id`,
					  `virtuemart_custom_id`,
					  `disabler`,
					  `override`,
					  `customfield_params`,
					  `published`,
					  `created_on`,
					  `created_by`,
					  `modified_on`,
					  `modified_by`,
					  `locked_on`,
					  `locked_by`,
					  `ordering`
					  )
					  values
					  (
						id_vm,
						'1',
						'0',
						'0',
						derivados,#Texto con los derivados Talles/colores
						'1',
						now(),
						usuario,
						now(),
						usuario,
						now(),
						'0',
						'0'
					  );
		end if;

end loop bucle;
end$$
call completar_descripciones('MARCELA KOURY','Lenceria de Mujer');






