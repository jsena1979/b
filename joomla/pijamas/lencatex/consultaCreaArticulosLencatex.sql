
select 
ifnull(vm_id(codigo),'') as virtuemart_product_id, 
concat(marca,'-Art:',replace(codigo,'/E','')) as product_name, 
SKUCode as product_sku,
'' as product_parent_sku,
replace(concat(marca,'-Art-',codigo,'-',SKUCode),'/','-') as slug,
 talle as  VM_MULTIVARIANT_FIELD_LABEL1,
 color as Color,
 'COM_VIRTUEMART_FIELD_MULTIVARIANT_LABEL' as multi_variant_title,
 'VM_MULTIVARIANT_FIELD_LABEL1~Color' as multi_variant_fields,
 '1.0' as product_price,
 'Y' as published,
 'Pijamas/Lencatex' as category_path ,
 concat(concat(AdditionalDescription,' ',marca,'-Art:',codigo),'<br />',coalesce(vm_description(0,codigo),concat(talle,' - ',color))) as product_desc,
   (CASE 
		WHEN trim(talle)='80' or trim(talle)='T80' or trim(talle)='T.80'then 1
		WHEN trim(talle)='85' or trim(talle)='T85' or trim(talle)='T1' or  trim(talle)='1' or trim(talle)='T.85' then 2
        WHEN trim(talle)='90' or trim(talle)='T90' or trim(talle)='T2' or  trim(talle)='2' or trim(talle)='T.90' then 3
        WHEN trim(talle)='95' or trim(talle)='T95' or trim(talle)='T3' or  trim(talle)='3' or trim(talle)='T.95' then 4
        WHEN trim(talle)='100' or trim(talle)='T100' or trim(talle)='T4' or  trim(talle)='4' or trim(talle)='T.100' then 5
        WHEN trim(talle)='105' or trim(talle)='T105' or trim(talle)='T5' or  trim(talle)='5' or trim(talle)='T.105'then 6
		WHEN trim(talle)='110' or trim(talle)='T110' or trim(talle)='T6' or  trim(talle)='6' or trim(talle)='T.110'then 7
        WHEN trim(talle)='115' or trim(talle)='T115' or trim(talle)='T7' or  trim(talle)='7' or trim(talle)='T.115'then 8
        WHEN trim(talle)='120' or trim(talle)='T120' or trim(talle)='T8' or  trim(talle)='8' or trim(talle)='T.120'then 9
		WHEN trim(talle)='10' or trim(talle)='T10' or trim(talle)='T.10'then 10
        WHEN trim(talle)='12' or trim(talle)='T12' or trim(talle)='T.12'then 12
        WHEN trim(talle)='14' or trim(talle)='T14' or trim(talle)='T.14'then 14
        WHEN trim(talle)='14' or trim(talle)='T14' or trim(talle)='T.14'then 14
        WHEN trim(talle)='16' or trim(talle)='T16' or trim(talle)='T.16'then 16
        WHEN trim(talle)='18' or trim(talle)='T18' or trim(talle)='T.16'then 18
		WHEN trim(talle)='50' or trim(talle)='T50' or trim(talle)='T.50'then 50
		WHEN trim(talle)='52' or trim(talle)='T52' or trim(talle)='T.52'then 52
		WHEN trim(talle)='54' or trim(talle)='T54' or trim(talle)='T.54'then 54
		WHEN trim(talle)='56' or trim(talle)='T56' or trim(talle)='T.56'then 56
		WHEN trim(talle)='58' or trim(talle)='T58' or trim(talle)='T.58'then 58
       ELSE 6
        END) as peso
from ljul_articulos_tango_exp t where marca ='LENCATEX'
order by codigo, peso,color;



