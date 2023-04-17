#!/bin/sh

DATABASE='sakila'

echo 'Pulling Database: This may take a few minutes'

backupfolder=/home/theia/backups

keep_day=30

sqlfile=$backupfolder/all-database-$(date +%d-%m-%Y_%H-%M-%S).sql
zipfile=$backupfolder/all-database-$(date +%d-%m-%Y_%H-%M-%S).gz

if  mysqldump --host=127.0.0.1 --port=3306 --user=root --password=Nzg2Ny1hZGVseTcw $DATABASE > $sqlfile.sql ; then
    echo "Sql dump ceated"
    # Compress backup
    if gzip -c $sqlfile > $zipfile; then
        echo 'The backup was successfully compressed' 
    else
        echo 'Error conpressing backupBackup was not created!'
        exit
    fi
    rm $sqlfile

else
    echo 'pg_dump return non-zero code No backup was created!'
    exit
 fi 

 find  $backupfolder -mtime +$keep_day -delete 


