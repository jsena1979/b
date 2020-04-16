create table articulos_web asarticulos_web
select *
 from (
 select
	cod_articulo as 'product_sku',	
    '' as product_parent_sku,
	split(descrip,' ',1) as codigo_anterior,
	split(descrip,' ',2) as VM_MULTIVARIANT_FIELD_LABEL1 ,/*talle*/
	split(descrip,' ',3 )as VM_MULTIVARIANT_FIELD_LABEL2,/*Color*/
    '' as multi_variant_title,
    '' as multi_variant_fields,
    cod_prove,
	nom_prove,
    descrip    
from articulos_proveedores_tango
where 
	nom_prove='SIGRY WOMAN S R L') as p

