
select 
ifnull(vm_id(concat('OK',replace(codigo,'OK',''))),'') as virtuemart_product_id, 
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
 'Indumentaria/Okey' as category_path ,
 concat(concat(AdditionalDescription,' ',marca,'-Art:',codigo),'<br />',coalesce(vm_description(0,codigo),concat(talle,' - ',color))) as product_desc,Description,
   (CASE 
		WHEN trim(talle)='T80' or trim(talle)='80' or trim(talle)='T.80' then 1 
        WHEN trim(talle)='T85' or trim(talle)='85' or trim(talle)='T1' or trim(talle)='T01'  or trim(talle)='T.1' or trim(talle)='T.85' then 2 
        WHEN trim(talle)='T90' or trim(talle)='90' or trim(talle)='T2' or trim(talle)='T02'  or trim(talle)='T.2' or trim(talle)='T.90' then 3
        WHEN trim(talle)='T95' or trim(talle)='95' or trim(talle)='T3' or trim(talle)='T03'  or trim(talle)='T.3' or trim(talle)='T.95' then 4  
        WHEN trim(talle)='T100' or trim(talle)='100'or trim(talle)='T4' or trim(talle)='T04'  or trim(talle)='T.4' or trim(talle)='T.100' then 5
		WHEN trim(talle)='T105' or trim(talle)='105' or trim(talle)='T5' or trim(talle)='T05'  or trim(talle)='T.5' or trim(talle)='T.105' then 6

		WHEN trim(talle)='T110' or trim(talle)='110' or trim(talle)='T6' or trim(talle)='T06'  or trim(talle)='T.6' or trim(talle)='T.110' then 7
		WHEN trim(talle)='115' or trim(talle)='T115' or trim(talle)='T7' or  trim(talle)='T07'  or trim(talle)='T.7' or trim(talle)='7' or trim(talle)='T.115'then 8
        WHEN trim(talle)='120' or trim(talle)='T120' or trim(talle)='T8' or  trim(talle)='8' or trim(talle)='T08'  or trim(talle)='T.8' or trim(talle)='T.120'then 9
		WHEN trim(talle)='9' or trim(talle)='T9' or trim(talle)='T.9' then 9
        WHEN trim(talle)='10' or trim(talle)='T10' or trim(talle)='T.10' then 10
        WHEN trim(talle)='12' or trim(talle)='T12' or trim(talle)='T.12' then 12
        WHEN trim(talle)='14' or trim(talle)='T14' or trim(talle)='T.14' then 14
        WHEN trim(talle)='14' or trim(talle)='T14' or trim(talle)='T.14' then 14
        WHEN trim(talle)='16' or trim(talle)='T16' or trim(talle)='T.16'then 16
        WHEN trim(talle)='18' or trim(talle)='T18' or trim(talle)='T.16'then 18
        WHEN trim(talle)='42' or trim(talle)='T42' or trim(talle)='T.42'then 50
		WHEN trim(talle)='50' or trim(talle)='T50' or trim(talle)='T.50'then 51
		WHEN trim(talle)='52' or trim(talle)='T52' or trim(talle)='T.52'then 52
		WHEN trim(talle)='54' or trim(talle)='T54' or trim(talle)='T.54'then 54
        WHEN trim(talle)='55' or trim(talle)='T55' or trim(talle)='T.55'then 55
		WHEN trim(talle)='56' or trim(talle)='T56' or trim(talle)='T.56'then 56
		WHEN trim(talle)='58' or trim(talle)='T58' or trim(talle)='T.58'then 58
        WHEN trim(talle)='75' or trim(talle)='T75' or trim(talle)='T.75'then 75
		WHEN trim(talle)='TS' or  trim(talle)='S' or  trim(talle)='T.S' then 100
        WHEN  trim(talle)='TM' or  trim(talle)='M' or  trim(talle)='T.M' then 105
        WHEN trim(talle)='TL' or  trim(talle)='L' or   trim(talle)='T.L' then 110
        WHEN trim(talle)='TXL' or  trim(talle)='XL' or  trim(talle)='T.XL' then 115
        WHEN trim(talle)='TXXL' or  trim(talle)='XXL' or  trim(talle)='T.XXL' then 120
        WHEN trim(talle)='TXXXL' or  trim(talle)='XXXL' or  trim(talle)='T.XXXL' then 125
       ELSE 1000
        END) as peso, Description
from ljul_articulos_tango_exp t where marca ='OKEY'
order by codigo, peso,color;



