#!/bin/bash
#
SOURCE='/home/ec2-user/shellscripts/shell-scripts/source'
DESTINATION='/home/ec2-user/shellscripts/shell-scripts/destination'
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p $DESTINATION/$DATE
cp -r $SOURCE $DESTINATION/$DATE
echo "Backup completed on $DATE"

