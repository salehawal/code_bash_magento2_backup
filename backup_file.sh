#!/bin/bash
. config.sh

######################
# files backup
######################

# files backup
tar --exclude='*.tar' --exclude='*.tar.bz2' --exclude='*.zip' -cvjsf $files_backup_to/${files_export_file}_`date +%y%m%d`.tar.bz2 $files_backup_from/*
# remove old backups
find $files_backup_to -name ${files_export_file}_* -type f -mmin +7200 -delete
# send notification email
# wget -qo- "https://jomlah.com/email.php?subject=file&email[]=saleh.awal@gmail.com&email[]=admin@jomlah.com" &> /dev/null
#script end
echo "backup | file done..."