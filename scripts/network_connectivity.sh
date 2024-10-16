#!/bin/bash

HOST=$1

OUTPUT_FILE=/home/ec2-user/output.txt

if ping -c 1 $HOST
then
	echo "$HOST is reachable" >> $OUTPUT_FILE
else
	echo "$HOST is not reachable" >> $OUTPUT_FILE
fi

