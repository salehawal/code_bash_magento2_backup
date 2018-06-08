#!/bin/bash
. config.sh

######################
# database backup | table | customers
######################

# backup database tables
table_names="customer_address_entity customer_address_entity_datetime customer_address_entity_decimal customer_address_entity_int customer_address_entity_text customer_address_entity_varchar customer_entity customer_entity_datetime customer_entity_decimal customer_entity_int customer_entity_text customer_entity_varchar customer_grid_flat customer_log customer_visitor persistent_session wishlist wishlist_item wishlist_item_option"
# backup database - tables
mysqldump --user=$database_user --password=$database_pass $database_name $table_names > $database_table_backup_to/${database_table_customer_export_file}_`date +%y%m%d%h`.sql
# remove old backups every 3 days
find $database_table_backup_to -name ${database_table_customer_export_file}_* -type f -mmin +7200 -delete
# send notification email
#wget -qo- "https://jomlah.com/email.php?subject=table-customer&email[]=saleh.awal@gmail.com&email[]=admin@jomlah.com" &> /dev/null
echo "backup | table | customer done..."