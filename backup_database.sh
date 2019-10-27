#!/bin/bash
. config.sh

######################
# database backup
######################

# backup database
mysqldump --add-drop-table --force --opt $database_name > ${database_backup_to}/${database_export_file}_`date +%y-%m-%d_%H-%M`.sql
# Compress Files
tar -czvf ${database_backup_to}/${database_export_file}_`date +%y-%m-%d_%H-%M`.tar.bz2 ${database_backup_to}/${database_export_file}_`date +%y-%m-%d_%H-%M`.sql
rm ${database_backup_to}/${database_export_file}_`date +%y-%m-%d_%H-%M`.sql
# remove old backups
find $backup_to -name ${database_export_file}_* -type f -mmin +7200 -delete
# send notification email
# wget -qo- "https://jomlah.com/email.php?subject=database&email[]=saleh.awal@gmail.com&email[]=admin@jomlah.com" &> /dev/null
#script end
echo "backup | database done..."
