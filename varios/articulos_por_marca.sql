 select 
					p.virtuemart_product_id
					,p.product_parent_id
					,cn.category_name,
					p.product_sku,
                    cn.virtuemart_category_id
				from 
					ljul_virtuemart_categories_es_es cn inner join
					ljul_virtuemart_product_categories cp 
				on 
					cp.virtuemart_category_id= cn.virtuemart_category_id 
				inner join
					ljul_virtuemart_products p on  cp.virtuemart_product_id=p.virtuemart_product_id
				where 
					#cn.category_name='Marcela Koury' 
                    #and 
                    cp.virtuemart_category_id='21' 