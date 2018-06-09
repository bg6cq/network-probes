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
	echo -n check dns ipv6 ns: $1 >> $out_file
	x=$(dig +nssearch $1 | awk '/^SOA .*server .*:.*/ {print $11}')
	if [ ! -z "$x" ]; then
		echo ", dns ns ipv6 is" $x >> $out_file
		exit 0
	else
		echo " "has no dns ipv6 ns >> $out_file
	fi
done

exit 1
