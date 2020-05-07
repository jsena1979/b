DROP FUNCTION IF EXISTS `vm_description`;
DELIMITER $$
CREATE FUNCTION vm_description ( id_vm INT,sku varchar(150) )
RETURNS varchar (500)
BEGIN
   DECLARE descrip_art varchar(500);
   set descrip_art = 	(select 
		d.product_desc 
    from
		ljul_virtuemart_products p,
        ljul_virtuemart_products_es_es d
	where 
    p.virtuemart_product_id=d.virtuemart_product_id
    and (p.product_sku=sku or d.virtuemart_product_id=id_vm)
    and p.product_parent_id=0);
   return  descrip_art;
END;

select vm_description(0,'1001T');