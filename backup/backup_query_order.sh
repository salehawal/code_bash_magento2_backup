#!/bin/bash
. config.sh

######################
# database backup | query | orders
######################

# orders query
query="select concat(address.firstname,' ', address.lastname) as name, address.email as email,items.created_at as date,items.name as description,items.store_id as logon,items.name as category,items.store_id as feedbackdate,items.sku as productsearchcode,items.order_id as orderref from sales_order as orders join sales_order_item as items on items.order_id = orders.entity_id left join sales_order_address as address on orders.entity_id = address.parent_id where items .created_at='`date +%y-%m-%d` 00:00:00' and orders.status = 'complete'"
# backup database - tables
mysql -u $database_user -p${database_pass} $database_name -e "$query" > $database_query_backup_to/${database_query_order_export_file}_`date +%y%m%d%h%m`.sql
# remove old backups every 3 days
find $database_query_backup_to -name ${database_query_order_export_file}_* -type f -mmin +7200 -delete
# send notification email
#wget -qo- "https://jomlah.com/email.php?subject=query-order&email[]=saleh.awal@gmail.com&email[]=admin@jomlah.com" &> /dev/null
# update files permissions
echo "backup | query order done..."