insert nuevos_articulos_web 
select * from ( select
	0 as virtuemart_product_id,
    '' as product_name,
    cod_articu as 'product_sku',	
    '' as product_parent_sku,
    '' as slug,
	replace(replace(split(descrip,' ',1),'/E',''),'/G','') as codigo_anterior,
	split(descrip,' ',2) as VM_MULTIVARIANT_FIELD_LABEL1 ,/*talle*/
	split(descrip,' ',3 )as VM_MULTIVARIANT_FIELD_LABEL2,/*Color*/
    '' as multi_variant_title,
    '' as multi_variant_fields,
    '' as category_path,
    'LENCATEX' as marca,
    cod_prove,
	nom_prove,
    descrip 
    ,cast(extrae_numeros(split(trim(descrip),' ',2)) as unsigned) as extrae
from articulos_proveedores_tango
where nom_prove ='LOHE SRL' 
order by cast(extrae_numeros(split(trim(descrip),' ',2)) as unsigned)) as sel
group by sel.codigo_anterior,sel.extrae,sel.product_sku;

