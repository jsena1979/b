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
where cn.category_name='lencatex'
#and product_parent_id=10900


