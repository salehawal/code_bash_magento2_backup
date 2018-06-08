#!/bin/bash
. config.sh

######################
# database backup | table | orders
######################

# backup database tables
table_names="gift_message quote quote_address quote_address_item quote_id_mask quote_item quote_item_option quote_payment quote_shipping_rate reporting_orders sales_bestsellers_aggregated_daily sales_bestsellers_aggregated_monthly sales_bestsellers_aggregated_yearly sales_creditmemo sales_creditmemo_comment sales_creditmemo_grid sales_creditmemo_item sales_invoice sales_invoiced_aggregated sales_invoiced_aggregated_order sales_invoice_comment sales_invoice_grid sales_invoice_item sales_order sales_order_address sales_order_aggregated_created sales_order_aggregated_updated sales_order_grid sales_order_item sales_order_payment sales_order_status_history sales_order_tax sales_order_tax_item sales_payment_transaction sales_refunded_aggregated sales_refunded_aggregated_order sales_shipment sales_shipment_comment sales_shipment_grid sales_shipment_item sales_shipment_track sales_shipping_aggregated sales_shipping_aggregated_order tax_order_aggregated_created tax_order_aggregated_updated"
# backup database - tables
mysqldump --user=$database_user --password=$database_pass $database_name $table_names > $database_table_backup_to/${database_table_order_export_file}_`date +%y%m%d%h`.sql
# remove old backups every 3 days
find $database_table_backup_to -name ${database_table_order_export_file}_* -type f -mmin +7200 -delete
# send notification email
#wget -qo- "https://jomlah.com/email.php?subject=table-order&email[]=saleh.awal@gmail.com&email[]=admin@jomlah.com" &> /dev/null
echo "backup | table | order done..."