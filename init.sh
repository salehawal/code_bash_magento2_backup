#!/bin/bash
. config.sh

# Create Backup Folders
if [ ! -d ./db ]; then mkdir -p ./db; else echo 'folder "db" exists'; fi
if [ ! -d ./file ]; then mkdir -p ./file; else echo 'folder "file" exists'; fi

# Save Database Access Info
printf '%s\n' "[mysqldump]" "user=${database_user}" "password=$database_pass" > ~/.my.cnf
