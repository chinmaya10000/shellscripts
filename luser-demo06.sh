#!/bin/bash

FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

read LINE < ${FILE}
echo "LINE contains: ${LINE}"

head -n3 /etc/passwd > ${FILE}
echo 
echo "Contains of ${FILE}:"
cat ${FILE}

echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "Contains of ${FILE}:"
cat ${FILE}

# Redirect STDIN to a program, using FD 0.
read LINE 0< ${FILE}
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file using FD 1, overwriting the file.
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contains of ${FILE}:"
cat ${FILE}

# Redirect STDERR to a file using 2.
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

# Redirect STDOUT and STDERR to a file.
head -n3 /etc/passwd /fakefile &> ${FILE}
echo
echo "Cntains of ${FILE}:"
cat ${FILE}

# Redirect STDOUT and STDERR through a pipe.
head -n3 /etc/passwd /fakefile |& cat -n

# Discard STDOUT.
echp
echo "Descarding STDOUT:"
head -n3 /etc/passwd /fakefile > /dev/null

# Descard STDERR.
echo 
echo "Descarding STDERR:"
head -n3 /etc/passwd /fakefile 2> /dev/null

# Descaed STDOUT and STDERR.
echo
echo "Descarding STDOUT and STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null

# Clean up.
rm ${FILE} ${ERR_FILE} &> /dev/null


# head -n1 /etc/passwd /etc/hosts /fakefile
# head -n1 /etc/passwd /etc/hosts /fakefile > head.out
# cat head.out
# head -n1 /etc/passwd /etc/hosts /fakefile 2> head.err
# cat head.err 
# rm head.out head.err
# head -n1 /etc/passwd /etc/hosts /fakefile > head.out 2> head.err
# cat head.out 
# cat head.err 
# head -n1 /etc/passwd /etc/hosts /fakefile > head.out 2>> head.err
# cat head.err 
# head -n1 /etc/passwd /etc/hosts /fakefile > head.both 2>&1
# cat head.both 
# rm head.both
# head -n1 /etc/passwd /etc/hosts /fakefile &> head.both
# cat head.both 
# head -n1 /etc/passwd /etc/hosts /fakefile &>> head.both
# cat head.both 
# rm head.both 
# head -n1 /etc/passwd /etc/hosts /fakefile 
# head -n1 /etc/passwd /etc/hosts /fakefile | cat -n
# head -n1 /etc/passwd /etc/hosts /fakefile 2>&1 | cat -n
# head -n1 /etc/passwd /etc/hosts /fakefile |& cat -n
# head -n1 /etc/passwd /etc/hosts /fakefile > /dev/null
# head -n1 /etc/passwd /etc/hosts /fakefile 2> /dev/null
# head -n1 /etc/passwd /etc/hosts /fakefile &> /dev/null
