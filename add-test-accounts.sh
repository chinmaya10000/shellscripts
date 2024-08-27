#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
        echo 'Please run with sudo or as root.' >&2
        exit 1
fi

for U in chinu pallavi sreelela mahesh
do
        useradd ${U}
        echo passwd 'pass123' | passwd --stdin ${U}
done
