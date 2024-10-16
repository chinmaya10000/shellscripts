#!/bin/bash

DB_NAME='mydb'
BACKUP_DIR='/home/ec2-user/shellscripts/scripts/db_backup'
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mysqldump -u root -p $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql
echo 'Database backup completed!'

