
delete from ernes_virtuemart_product_customfields where 
(virtuemart_custom_id=10 or virtuemart_custom_id=11)
and 
virtuemart_product_id = (
SELECT 
	#vp.product_sku,
	#ce.category_name,
	#cf.customfield_value,
	#cf.virtuemart_custom_id,
	pc.virtuemart_product_id
	#cf.customfield_params
FROM 
ernes_virtuemart_product_categories pc,
ernes_virtuemart_product_customfields cf,
ernes_virtuemart_products vp,
 ernes_virtuemart_categories_es_es ce
where
vp.virtuemart_product_id=pc.virtuemart_product_id
and 
cf.virtuemart_product_id = pc.virtuemart_product_id
and ce.virtuemart_category_id=pc.virtuemart_category_id

and  ce.category_name='BELEN'
#and cf.virtuemart_product_id=6891
)
