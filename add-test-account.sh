#!/bin/bash
#
# Add some account to test with.
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or root.' >&2
	exit 1
fi

for U in chinmaya rupali
do
	useradd ${U}
	echo 'pass123' | passwd --stdin ${U}
done
