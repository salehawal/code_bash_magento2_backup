#!/bin/bash

# database backup
database_backup_to="/home/user/backup/database"
database_table_backup_to="/home/user/backup/database_table"
database_query_backup_to="/home/user/backup/database_record"
database_name="db_name"
database_user="db_user"
database_pass="Pa$$word"
database_export_file="db_export_filename"
# - table customers
database_table_customer_export_file="db_export_filename_table_customer"
# - table orders
database_table_order_export_file="db_export_filename_table_order"
# - query orders
database_query_order_export_file="db_export_filename_record_order"

# files backup
files_backup_from="/home/user/www"
files_backup_to="/home/user/backup/file"
files_export_file="jomlah_app_backup"