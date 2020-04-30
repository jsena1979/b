select 
p.virtuemart_product_id,p.product_parent_id, product_sku,published 
from  ernes_virtuemart_products p 
where 
product_sku  REGEXP '^[0-9]$B';
and 
 (virtuemart_product_id='7938'
or product_parent_id='7938');#Producto y sus derivados

select * from ernes_virtuemart_products_es_es where virtuemart_product_id='7938';#Datos del producto

select virtuemart_product_price_id,virtuemart_product_id,product_price 
from ernes_virtuemart_product_prices where virtuemart_product_id='7938';#Precios
select * from ernes_virtuemart_product_customfields  where virtuemart_product_id='7938';
select * from ernes_virtuemart_categories_es_es;
select * from ernes_virtuemart_category_categories;
select * from ernes_virtuemart_userfields;
select * from ernes_virtuemart_userfield_values ;

select virtuemart_product_id,product_desc,product_name,slug from ernes_virtuemart_products_es_es where 
virtuemart_product_id in (select virtuemart_product_id from ernes_virtuemart_products where product_parent_id='7938') ;#Datos del producto

select * from ernes_articulos_tango where Description  
#REGEXP '^[0-9]+B ' and AdditionalDescription REGEXP 'PACK|CONJUNTO';
 REGEXP '^[0-9]+MK';
select * from ernes_virtuemart_products where product_sku  REGEXP '^[0-9]+MK';

SELECT SKUCode,codigo,marca  FROM ernes_articulos_tango where  marca='MARCELA KOURY' limit 1
select * from ernes_virtuemart_products where product_sku=trim('5323MK') and product_parent_id=0
select * from ernes_virtuemart_products where virtuemart_product_id='4945'
SELECT t.SKUCode,t.codigo,t.marca  FROM ernes_articulos_tango t where  t.marca='MARCELA KOURY' limit 20

SELECT *  FROM ernes_articulos_tango t where  t.marca=trim('MARCELA KOURY') limit 4;

select * from ernes_virtuemart_products where product_sku like '5223MK';
select * from ernes_virtuemart_products where product_sku like '0101077890';
select * from ernes_virtuemart_products where product_sku like '0101077910';

select v.virtuemart_product_id,product_sku from ernes_virtuemart_products v where v.product_sku = '0602040890' and v.product_parent_id=0;

select * from ernes_virtuemart_products