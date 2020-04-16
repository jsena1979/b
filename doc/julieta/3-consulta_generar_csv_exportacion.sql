 select 
	a.virtuemart_product_id,
    ifnull(a.product_name,t.Descripción) as product_name,
	a.product_sku,
	a.product_parent_sku,
    lcase(replace(concat(  ifnull(a.product_name,t.Descripción),'-',a.product_sku),' ','-')) as slug,
	(CASE
    WHEN a.VM_MULTIVARIANT_FIELD_LABEL1 = '' THEN 
   'unico'
    ELSE a.VM_MULTIVARIANT_FIELD_LABEL1
END) as VM_MULTIVARIANT_FIELD_LABEL1,
		(CASE
    WHEN a.VM_MULTIVARIANT_FIELD_LABEL2 = '' THEN 
   'unico'
    ELSE a.VM_MULTIVARIANT_FIELD_LABEL2
END) as VM_MULTIVARIANT_FIELD_LABEL2,
	a.multi_variant_title,
	a.multi_variant_fields,
	t.Precio  as product_price,
	'Y' as published,
	category_path,
 ifnull(concat('ART:',a.codigo_anterior,'<br />', (select product_desc from datos_web_actual where virtuemart_product_id=a.virtuemart_product_id or product_sku=codigo_anterior)),codigo_anterior) as product_desc,
   codigo_anterior
 from 
	nuevos_articulos_web a,
	articulos_tango t
 where 
	a.marca='SIGRY' 
 and a.product_sku=t.`Cód._Artículo`;