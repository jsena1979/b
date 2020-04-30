
select 
concat(marca,'-Art:',codigo) as product_name, 
SKUCode as product_sku,
'' as product_parent_sku,
concat(marca,'-Art ',codigo,'-',SKUCode) as slug,
 talle as  VM_MULTIVARIANT_FIELD_LABEL1,
 color as Color,
 'COM_VIRTUEMART_FIELD_MULTIVARIANT_LABEL' as multi_variant_title,
 'VM_MULTIVARIANT_FIELD_LABEL1~Color' as multi_variant_fields,
 '1.0' as product_price,Disabled,
 (case when (Disabled = '0') then 'Y' else 'N' end) as published,
 'Lenceria de Mujer/Belen' as category_path ,
 concat(concat(AdditionalDescription,' ',marca,'-Art:',codigo),'<br />',talle,' - ',color) as product_desc
from ernes_articulos_tango t where marca ='SIGRY'
and AdditionalDescription = ''

order by marca,codigo,cast((extrae_numeros(talle)) as unsigned);


/*
select distinct virtuemart_product_id,codigo
from ernes_virtuemart_products p,ernes_articulos_tango t
where 
t.codigo=p.product_sku and t.marca='SIGRY'
and AdditionalDescription = ''

virtuemart_product_id is not null order by virtuemart_product_id*/


