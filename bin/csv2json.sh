#!/bin/bash

# csv=$(cat "$@")

columns=$(cat $1 | sed 1!d | tr -d " ")

cat $1 | sed 1d | tr -d " " | column -s , --json --table-name data --table-columns "$columns"

