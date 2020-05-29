#select * from ljul_virtuemart_products where product_parent_id=10831 or virtuemart_product_id=10831;
select 
p.virtuemart_product_id
,p.product_parent_id
,cn.category_name,
p.product_sku
from 
ljul_virtuemart_categories_es_es cn inner join
ljul_virtuemart_product_categories cp 
on cp.virtuemart_category_id= cn.virtuemart_category_id 
right join
ljul_virtuemart_products p
on  cp.virtuemart_product_id=p.product_parent_id
where cn.category_name='XY'
#and product_parent_id=10900
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_derivados_articulos`( in marca varchar(500),in parent_id int)
begin
declare product_id,pparent_id,no_hay_registros int default 0;
DECLARE categ_nombre,sku varchar(500);
DECLARE micursor CURSOR 
				FOR select 
					p.virtuemart_product_id
					,p.product_parent_id
					,cn.category_name,
					p.product_sku
				from 
					ljul_virtuemart_categories_es_es cn inner join
					ljul_virtuemart_product_categories cp 
				on 
					cp.virtuemart_category_id= cn.virtuemart_category_id 
				right join
					ljul_virtuemart_products p on  cp.virtuemart_product_id=p.product_parent_id
				where 
					cn.category_name=marca;
				#and product_parent_id=10900;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET no_hay_registros=1;
OPEN micursor;
bucle:loop
fetch micursor into product_id,pparent_id,categ_nombre,sku;
	 if (no_hay_registros = 1) then
	  leave bucle; 
	end if;
        #Obtengo el id del padre
		delete from ljul_virtuemart_products where virtuemart_product_id = product_id;
end loop bucle;
end$$
DELIMITER ;
CALL `catalogos2020`.`eliminar_derivados_articulos`('XY', 0);


