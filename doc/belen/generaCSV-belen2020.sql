select 
(select virtuemart_product_id from ernes_virtuemart_products where product_sku=t.codigo and product_parent_id=0) as virtuemart_product_id,
concat(marca,'-Art:',codigo) as product_name, 
SKUCode as product_sku,
'' as product_parent_sku,
concat(marca,'-Art ',codigo,'-',SKUCode) as slug,
 talle as  VM_MULTIVARIANT_FIELD_LABEL1,
 color as VM_MULTIVARIANT_FIELD_LABEL2,
 'COM_VIRTUEMART_FIELD_MULTIVARIANT_LABEL
' as multi_variant_title,
 'VM_MULTIVARIANT_FIELD_LABEL1~VM_MULTIVARIANT_FIELD_LABEL2
' as multi_variant_fields,
 '1.0' as product_price,Disabled,
 (case when (Disabled = '0') then 'Y' else 'N' end) as published,
 'Lenceria de Mujer/Belen' as category_path ,
 concat(concat(AdditionalDescription,' ',marca,'-Art:',codigo),'<br />',talle,' - ',color) as product_desc
from ernes_articulos_tango t where marca ='BELEN'
order by marca,codigo,cast((extrae_numeros(talle)) as unsigned);




