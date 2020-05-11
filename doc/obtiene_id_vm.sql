SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS `vm_id`;
DELIMITER $$
CREATE FUNCTION vm_id ( sku varchar(150) )
RETURNS int
BEGIN
   DECLARE id_vm varchar(500);
   set id_vm = 	(select 
		virtuemart_product_id 
    from
		ljul_virtuemart_products p
	where 
    p.product_sku=trim(sku));
   return  id_vm;
END;
