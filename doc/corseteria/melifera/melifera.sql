delete from 
ljul_virtuemart_product_customfields 
where 
virtuemart_custom_id = '10' OR virtuemart_custom_id='11';
#MELIFERA
#update ernes_articulos_tango set Description = replace(Description,'  ',' ');
update ernes_articulos_tango 
set marca='MELIFERA',
    codigo=trim(split(Description,' ',1)),
    talle=(CASE WHEN trim(split(Description,' ',2)) <> '' then trim(split(Description,' ',2)) else 'UNICO' END),
    color=(CASE WHEN trim(split(Description,' ',3)) <> '' then trim(split(Description,' ',3)) else 'VARIOS' END)
where 
#Description  REGEXP '^[0-9]+M ' OR
Description  REGEXP '^[0-9]+/1M '
#and AdditionalDescription !='BEBES' ;

select * from (select
	marca,
    trim(split(Description,' ',1)) as codigo,
	talle,
	color,
    Description,
    AdditionalDescription,BarCode,
        (CASE 
		WHEN trim(talle)='T80' then 1
		WHEN trim(talle)='T85' or trim(talle)='T1' then 2
        WHEN trim(talle)='T90' or trim(talle)='T2' then 3
        WHEN trim(talle)='T95' or trim(talle)='T3' then 4
        WHEN trim(talle)='T100' or trim(talle)='T4'then 5
        WHEN trim(talle)='T105' or trim(talle)='T5'then 5
       ELSE 6
        END) as peso
    from ernes_articulos_tango       
	where 
    #Description  REGEXP '^[0-9]+M '
	marca='MELIFERA'
    ) as L
    order by codigo,peso
    

	#and AdditionalDescription REGEXP 'CONJUNTO') ;
    
select
	trim(split(Description,' ',1)) as codigo,
	(CASE WHEN trim(split(Description,' ',2)) != '' then trim(split(Description,' ',2)) else 'UNICO' END) as talle,
	(CASE WHEN trim(split(Description,' ',3)) != '' then trim(split(Description,' ',3)) else 'VARIOS' END) as color,
    Description,
    AdditionalDescription,BarCode
    from ernes_articulos_tango
where 
Description  REGEXP '^[0-9]+/1M '
and AdditionalDescription !='CONJUNTO' ;


