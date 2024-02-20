#!/bin/bash
#
# This script demonstrates I/O redirection.

# Rdirect STDOUT to a file.
FILE='/tmp/data'
head -n1 /etc/passwd > ${FILE}

# Redirect STDIN to a program.
read LINE < ${FILE}
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file, overwriting the file.
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}"
cat ${FILE}

