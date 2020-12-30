#!/bin/bash

if [ $# -lt 1 ]; then
	echo $0 "target [ time_out msg_file ]"
	exit 255
fi

if [ $# -eq 3 ]; then
	out_file=$3
else
	out_file=/dev/stdout
fi

if [ $# -gt 1 ]; then
	TIMEOUT=$2
else
	TIMEOUT=4
fi

cnt=1
while [ $cnt -le 3 ]; do
	let cnt++
	echo -n check http2 v4: $1 >> $out_file
	x=$(curl -m $TIMEOUT -4 -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36" --http2 -i $1 2>/dev/null | awk '/^HTTP\/2/ {print $1}')
	if [ ! -z "$x" ]; then
		echo ", get http2 response header" $x >> $out_file
		exit 0
	else
		echo ", "failed to get http2 response header >> $out_file
	fi
done

exit 1
