DROP PROCEDURE IF EXISTS completa_parent_sku_deriv;
DELIMITER $$
CREATE PROCEDURE `completa_parent_sku_deriv`( IN categoria varchar(500), IN Marca  varchar(500) )
 BEGIN 
 DECLARE codigo,anterior,variante  varchar(500);
 DECLARE codigo_ant_aux,id_vm varchar(500);
 DECLARE codigo_padre,nombre_producto varchar(500);
 DECLARE aux int;
 declare no_hay_registros int default 0;
 DECLARE micursor CURSOR FOR SELECT product_sku,codigo_anterior,VM_MULTIVARIANT_FIELD_LABEL1  FROM nuevos_articulos_web where  marca=Marca group by codigo_anterior,product_sku ;
 DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET no_hay_registros=1;      
 set codigo_ant_aux = (select codigo_anterior from nuevos_articulos_web where  marca= Marca limit 1);
 set nombre_producto = (select product_name from datos_web_actual where product_sku=trim(codigo_ant_aux));
 set aux = 1;
 OPEN micursor;
 bucle:loop
fetch micursor into codigo,anterior,variante;
 if (no_hay_registros = 1) then
  leave bucle; end if;  
	 if ( anterior = codigo_ant_aux) then
			if(aux = 1) then
				set codigo_padre=codigo;
                set id_vm = (select virtuemart_product_id from datos_web_actual where product_sku=trim(codigo_ant_aux));
				set nombre_producto = (select product_name from datos_web_actual where product_sku=trim(codigo_ant_aux));
				update 
                    nuevos_articulos_web set product_parent_sku=null,
                    product_name = nombre_producto,
					virtuemart_product_id=ifnull(id_vm,0),
                    multi_variant_title='COM_VIRTUEMART_FIELD_MULTIVARIANT_LABEL',
					multi_variant_fields='VM_MULTIVARIANT_FIELD_LABEL1~VM_MULTIVARIANT_FIELD_LABEL2',
                    category_path = categoria
				WHERE 
					product_sku=codigo;
		   else	
				set id_vm = (select virtuemart_product_id from datos_web_actual where product_sku=trim(codigo_ant_aux));
                update nuevos_articulos_web 
                set product_parent_sku=codigo_padre,
					product_name= nombre_producto

                WHERE 
					product_sku=codigo;
		  end if;
	else
		set aux = 1; 
				set codigo_padre=codigo;
                set nombre_producto = (select product_name from datos_web_actual where product_sku=trim(codigo_ant_aux));
                set id_vm = (select virtuemart_product_id from datos_web_actual where product_sku=trim(anterior));                
				update nuevos_articulos_web set product_parent_sku='',
					virtuemart_product_id=ifnull(id_vm,0),
					  product_name = nombre_producto,
                    multi_variant_title='COM_VIRTUEMART_FIELD_MULTIVARIANT_LABEL',
					multi_variant_fields='VM_MULTIVARIANT_FIELD_LABEL1~VM_MULTIVARIANT_FIELD_LABEL2',
                     category_path = categoria
				WHERE 
					product_sku=codigo;
    end if;
    set aux = aux + 1;
    set codigo_ant_aux = anterior;
end loop bucle;
close micursor;
END$$
call  completa_parent_sku_deriv('Pijamas/Lencatex','LENCATEX');