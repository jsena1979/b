drop table if exists nuevos_articulos_web;
create table nuevos_articulos_web as 
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
    'BELEN' as marca,
    cod_prove,
	nom_prove,
    descrip 
    ,cast(extrae_numeros(split(descrip,' ',2)) as unsigned) as extrae
from articulos_proveedores_tango 
where nom_prove='SIGRY WOMAN S R L' ) as sel
order by codigo_anterior,sel.extrae;

alter table nuevos_articulos_web ADD CONSTRAINT pk_sku PRIMARY KEY (product_sku);
ALTER TABLE nuevos_articulos_web MODIFY product_parent_sku varchar(255);
ALTER TABLE nuevos_articulos_web MODIFY multi_variant_title varchar(255);
ALTER TABLE nuevos_articulos_web MODIFY multi_variant_fields varchar(255);
ALTER TABLE nuevos_articulos_web MODIFY  marca varchar(255);
ALTER TABLE nuevos_articulos_web MODIFY slug varchar(500);
ALTER TABLE nuevos_articulos_web MODIFY product_name varchar(500);
ALTER TABLE nuevos_articulos_web MODIFY category_path varchar(500);
ALTER TABLE nuevos_articulos_web MODIFY virtuemart_product_id int(20);
ALTER TABLE nuevos_articulos_web MODIFY extrae bigint(255);


