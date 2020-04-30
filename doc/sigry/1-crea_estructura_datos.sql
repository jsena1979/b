insert nuevos_articulos_web 
select * from ( select
	0 as virtuemart_product_id,
    '' as product_name,
    cod_articu as 'product_sku',	
    '' as product_parent_sku,
    '' as slug,
	split(descrip,' ',1) as codigo_anterior,
	split(descrip,' ',2) as VM_MULTIVARIANT_FIELD_LABEL1 ,/*talle*/
	split(descrip,' ',3 )as VM_MULTIVARIANT_FIELD_LABEL2,/*Color*/
    '' as multi_variant_title,
    '' as multi_variant_fields,
    '' as category_path,
    'SIGRY' as marca,
    cod_prove,
	nom_prove,
    descrip 
    ,cast(extrae_numeros(split(trim(descrip),' ',2)) as unsigned) as extrae
from articulos_proveedores_tango 
where nom_prove like'BAKH%' and substring(descrip,1,1)!='B') as sel
where locate('PANTY',descrip)=0
order by codigo_anterior,sel.extrae;



