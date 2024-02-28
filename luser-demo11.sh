#!/bin/bash
#
# Display the top three visited URLs for a given web server log file.

LOG_FILE="${1}"

if [[ ! -e "${LOG_FILE}" ]]
then
        echo "Can not open ${LOG_FILE}." >&2
        exit
fi

cut -d '"' -f 2 ${LOG_FILE} | cut -d ' ' -f 2  | sort | uniq -c  | sort -n | tail -3
