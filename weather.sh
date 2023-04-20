#!/bin/bash
alias python=$(which python3)
# dumb json "parsing", could be better with jshon or similar
city="san francisco, ca" # city="$1"
cityid=$(wget -q -O - "https://openweathermap.org/data/2.1/find/name?q=$city" \
  | python3 -mjson.tool \
  | sed -n -e 's/.*\<id.: *\([0-9]*\).*/\1/p' \
  | head -n 1)


wget -q -O - "https://openweathermap.org/data/2.1/history/city/?id=$cityid&cnt=80" \
  | python3 -mjson.tool \
  | sed -n -e "s/.*\<temp.: *\\(([0-9.]*\)).*/\1/p" \
  | spark
