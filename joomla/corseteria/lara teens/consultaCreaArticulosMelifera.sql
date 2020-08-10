
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
 'Lenceria de Mujer/Melifera' as category_path ,
 concat(concat(AdditionalDescription,' ',marca,'-Art:',codigo),'<br />',talle,' - ',color) as product_desc,
   (CASE 
		WHEN trim(talle)='T80' then 1
		WHEN trim(talle)='T85' or trim(talle)='T1' or trim(talle)='T.85' then 2
        WHEN trim(talle)='T90' or trim(talle)='T2' or trim(talle)='T.90' then 3
        WHEN trim(talle)='T95' or trim(talle)='T3' or trim(talle)='T.95' then 4
        WHEN trim(talle)='T100' or trim(talle)='T4' or trim(talle)='T.100' then 5
        WHEN trim(talle)='T105' or trim(talle)='T5' or trim(talle)='T.105'then 6
		WHEN trim(talle)='T110' or trim(talle)='T6' or trim(talle)='T.110'then 7
        WHEN trim(talle)='T115' or trim(talle)='T7' or trim(talle)='T.115'then 8
        WHEN trim(talle)='T120' or trim(talle)='T8' or trim(talle)='T.120'then 9
       ELSE 6
        END) as peso
from ernes_articulos_tango t where marca ='MELIFERA' and codigo REGEXP '^[0-9]+/1M'
order by codigo, peso,color;



