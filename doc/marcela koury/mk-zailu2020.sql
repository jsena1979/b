delete from 
ljul_virtuemart_product_customfields 
where 
virtuemart_custom_id = '10' OR virtuemart_custom_id='11';
#MARCELA KOURY ZAILU
#update ljul_articulos_tango set Description = replace(Description,'  ',' ');
update ljul_articulos_tango 
set marca='MARCELA KOURY',
    codigo=trim(split(Description,' ',1)),
    talle=(CASE WHEN trim(split(Description,' ',2)) <> '' then trim(split(Description,' ',2)) else 'UNICO' END),
    color=(CASE WHEN trim(split(Description,' ',3)) <> '' then trim(split(Description,' ',3)) else 'VARIOS' END)
where 
Description  REGEXP '^[0-9]+MK '

select * from (select
	marca,
    trim(split(Description,' ',1)) as codigo,
	talle,
	color,
    Description,
    AdditionalDescription,BarCode,
  (CASE 
		WHEN trim(talle)='T80' or trim(talle)='80' then 1
		WHEN trim(talle)='T85' or trim(talle)='85' or trim(talle)='T1' or trim(talle)='T.85' then 2
        WHEN trim(talle)='T90' or trim(talle)='90' or trim(talle)='T2' or trim(talle)='T.90' then 3
        WHEN trim(talle)='T95' or trim(talle)='95' or trim(talle)='T3' or trim(talle)='T.95' then 4
        WHEN trim(talle)='T100' or trim(talle)='100'or trim(talle)='T4' or trim(talle)='T.100' then 5
        WHEN trim(talle)='T105' or trim(talle)='105' or trim(talle)='T5' or trim(talle)='T.105'then 6
		WHEN trim(talle)='T110' or trim(talle)='110' or trim(talle)='T6' or trim(talle)='T.110'then 7
        WHEN trim(talle)='T115' or trim(talle)='115' or trim(talle)='T7' or trim(talle)='T.115'then 8
        WHEN trim(talle)='T120' or trim(talle)='120' or trim(talle)='T8' or trim(talle)='T.120'then 9
       ELSE 6
        END) as peso
    from ljul_articulos_tango       
	where 
    #Description  REGEXP '^[0-9]+MK '
	marca='MARCELA KOURY'
    ) as L
    order by codigo,peso
    

	#and AdditionalDescription REGEXP 'CONJUNTO') ;
    
select
	trim(split(Description,' ',1)) as codigo,
	(CASE WHEN trim(split(Description,' ',2)) != '' then trim(split(Description,' ',2)) else 'UNICO' END) as talle,
	(CASE WHEN trim(split(Description,' ',3)) != '' then trim(split(Description,' ',3)) else 'VARIOS' END) as color,
    Description,
    AdditionalDescription,BarCode
    from ljul_articulos_tango
where 
Description  REGEXP '^[0-9]+MK '
#and AdditionalDescription !='CONJUNTO' ;


