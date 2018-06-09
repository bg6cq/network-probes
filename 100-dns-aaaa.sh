#!/bin/bash

if [ $# -lt 1 ]; then
	echo $0 "target [ msg_file ]"
	exit 255
fi

if [ $# -eq 2 ]; then
	out_file=$2
else
	out_file=/dev/stdout
fi

cnt=1
while [ $cnt -le 3 ]; do
	let cnt++
	echo -n check dns aaaa: $1 >> $out_file
	x=$(host -t aaaa $1 | awk '/has IPv6 address/ {print $5}')
	if [ ! -z "$x" ]; then
		echo ", ipv6 is" $x >> $out_file
		exit 0
	else
		echo " "has no dns aaaa >> $out_file
	fi
done

exit 1
