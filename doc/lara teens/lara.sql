#BAKHOU
update ernes_articulos_tango 
set marca='BAKHOU',
    codigo=trim(split(Description,' ',1)),
    talle=(CASE WHEN trim(split(Description,' ',2)) <> '' then trim(split(Description,' ',2)) else 'UNICO' END),
    color=(CASE WHEN trim(split(Description,' ',3)) <> '' then trim(split(Description,' ',3)) else 'VARIOS' END)
where Description
    REGEXP '^B[0-9]+ ';

select * from (select
	marca,trim(split(Description,' ',1)) as codigo,
	talle,
	color,
    Description,
    AdditionalDescription,BarCode,
        (CASE 
		WHEN trim(talle)='TS' then 1
		WHEN trim(talle)='TM' then 2
        WHEN trim(talle)='TL' then 3
        WHEN trim(talle)='TXL' then 4
        WHEN trim(talle)='TXL' then 5
       ELSE 6
        END) as peso
    from ernes_articulos_tango       
	where 
    #Description  REGEXP '^B[0-9]+ '
	marca='BAKHOU') as B
    order by codigo,peso
    

	#and AdditionalDescription REGEXP 'CONJUNTO') ;

