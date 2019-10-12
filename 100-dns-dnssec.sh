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
	echo -n check dns sec: $1 >> $out_file
	delv $1 2>/dev/null | grep -v "negative response" | grep "fully validated" > /dev/null && echo ", dnssec ok" >> $out_file && exit 0
	echo " "no dnssec >> $out_file
done

exit 1
