DROP procedure IF EXISTS crea_texto_custom_params;
DELIMITER $$
CREATE procedure  `crea_texto_custom_params`( id_vm int,codigo varchar(500))
BEGIN 
declare conca,texto,desc_deriv,desc_deriv1,desc_deriv2,desc_deriv3,desc_deriv4,desc_deriv5,desc_deriv6,desc_deriv7 varchar(500);
declare ttalle,tcolor,colores,talles,tarticulo varchar(300);
declare combinaciones varchar(3000);
declare existe int;
declare not_found int default 0;
DECLARE no_more_rows BOOLEAN DEFAULT false;
DECLARE ctalle CURSOR FOR SELECT distinct (case when length(tt.talle)=0 then 'unico' else tt.talle end) as talle  FROM ernes_articulos_tango tt where codigo=trim(codigo);
DECLARE ccolor CURSOR FOR SELECT distinct (case when length(tc.color)=0 then 'unico' else tc.color end) as color FROM ernes_articulos_tango tc where codigo=trim(codigo);
DECLARE carticulo CURSOR FOR SELECT p.virtuemart_product_id from ernes_virtuemart_products p where p.virtuemart_product_id=id_vm or p.product_parent_id=id_vm;
declare continue handler for not found set not_found:=1;
open carticulo;
set texto = '';
set talles = '';
set colores = '';
set desc_deriv= '';
set desc_deriv1= '';
set desc_deriv2= '';
set desc_deriv3= '';
set desc_deriv4= '';
set desc_deriv5= '';
set desc_deriv6= '';
set desc_deriv7= '';
set combinaciones= '';
set ttalle= '';
  loop1:loop
    fetch carticulo into tarticulo;   
    if not_found=1 then
      close carticulo;
      leave loop1;
    end if;
	end loop loop1;
    open ctalle;
    loop2:loop
      fetch ctalle into ttalle;
      if not_found=1 then
        set not_found:=0;
       close ctalle;
       leave loop2;
	 else	
		 set talles = concat(talles,ttalle,'\\r\\n') ;
      end if;
	end loop loop2; 
	 open ccolor;
      loop3:loop
        fetch ccolor into tcolor;
        if not_found=1 then
          set not_found:=0;
          close ccolor;
          leave loop3;
          else
			set colores = concat(colores,tcolor,'\\r\\n');
        end if; 
        	/*set combinaciones=concat(combinaciones,'
	"',tarticulo,'": [','
    "',ttalle,'",','
    "',tcolor,'"
    ],');*/
      end loop loop3;


set desc_deriv = 'selectoptions=[
    {
        "voption": "clabels",
        "clabel": "VM_MULTIVARIANT_FIELD_LABEL1",
        "values": 
        ';
set desc_deriv3 ='
    },
    {
        "voption": "clabels",
        "clabel": "VM_MULTIVARIANT_FIELD_LABEL2",
        "values": ';
set desc_deriv5='
    }
]|options={';
set desc_deriv7='
    ]
}|';
select concat(desc_deriv,talles,desc_deriv3,colores,desc_deriv5,desc_deriv6,desc_deriv7);
#select concat(desc_deriv,talles,desc_deriv3,colores,desc_deriv5,desc_deriv6,desc_deriv7);
#select concat(desc_deriv,desc_deriv,desc_deriv5,desc_deriv6,desc_deriv7);
select talles;
/*return colores;*/
END$$
call crea_texto_custom_params( 1598,'5416MK');

