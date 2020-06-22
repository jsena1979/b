
select 
ifnull(vm_id(codigo),'') as virtuemart_product_id, 
concat(marca,'-Art:',replace(codigo,'/E','')) as product_name, 
SKUCode as product_sku,
'' as product_parent_sku,AdditionalDescription as codigo,
replace(concat(marca,'-Art-',codigo,'-',SKUCode),'/','-') as slug,
 talle as  VM_MULTIVARIANT_FIELD_LABEL1,
 color as Color,
 'COM_VIRTUEMART_FIELD_MULTIVARIANT_LABEL' as multi_variant_title,
 'VM_MULTIVARIANT_FIELD_LABEL1~Color' as multi_variant_fields,
 '1.0' as product_price,
 'Y' as published,
 'Blanqueria/Fantasía' as category_path ,
 concat(concat('Art:',AdditionalDescription),'<br />',coalesce(vm_description(0,codigo),concat(talle,' - ',color))) as product_desc,Description,
 AdditionalDescription,
 agrupacion
from ljul_articulos_tango_exp t where marca ='fantasia'
order by Description;



