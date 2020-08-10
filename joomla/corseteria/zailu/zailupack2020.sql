
update ljul_articulos_tango_exp set Description = replace(Description,'  ',' ') where marca='ZAILU-PACK';
update ljul_articulos_tango_exp 
set codigo=trim(split(Description,' ',1)),
    talle=(CASE WHEN trim(split(Description,' ',2)) <> '' then trim(split(Description,' ',2)) else 'UNICO' END),
    color=(CASE WHEN trim(split(Description,' ',3)) <> '' then trim(split(Description,' ',3)) else 'VARIOS' END)
where 
marca='ZAILU-PACK';
    

select distinct(talle) from ljul_articulos_tango_exp 
where marca='ZAILU-PACK'

order by talle