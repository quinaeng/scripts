#!/bin/bash

HOSTLIST="./hostlist.txt"
LOG="./fail.log"

while read IP
do
	for PORT in 80 22 8080
	do
		nc -w 5 -n -z $IP $PORT
		if [ $? -ne 0 ]; then
			echo "Failed at port: $IP":"$PORT" >> "$LOG"
		fi
	done
done < $HOSTLIST

