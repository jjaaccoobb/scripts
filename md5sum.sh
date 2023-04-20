#!/usr/bin/env bash

find * -type f -exec md5sum '{}' ';' \
| tee /tmp/index_file.txt            \
| gawk '{print $1}'                  \
| sort | uniq -c                     \
| gawk '/^ *1 /{ print $2 }'          \
> /tmp/duplicates.txt

for m in $( cat /tmp/duplicates.txt )
  do
    grep $m /tmp/index_file.txt
    echo ========
    done \
 | less
