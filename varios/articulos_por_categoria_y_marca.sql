 select 
					p.virtuemart_product_id,
                    cc.category_parent_id,
					p.product_parent_id
					,cn.category_name,
					p.product_sku,
                    cn.virtuemart_category_id
				from 
					ljul_virtuemart_categories_es_es cn,
					ljul_virtuemart_category_categories cc,
					ljul_virtuemart_product_categories cp,
                    ljul_virtuemart_products p

				where
				cp.virtuemart_category_id= cn.virtuemart_category_id
                and cc.id=cn.virtuemart_category_id    
				and cp.virtuemart_product_id=p.virtuemart_product_id
				#and cn.category_name ='BIANCA SECRETA'
				and cp.virtuemart_category_id='21'
                and cc.category_parent_id='1' 