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
	dig +dnssec +multi $1 > /tmp/tmp.$$
#	cat /tmp/tmp.$pid
	grep NOERROR /tmp/tmp.$$ > /dev/null && grep flags /tmp/tmp.$$ | grep ad > /dev/null && grep RRSIG /tmp/tmp.$$ > /dev/null && echo ", dnssec ok" >> $out_file && rm -f /tmp/tmp.$$ && exit 0
	echo " "no dnssec >> $out_file
	rm -f /tmp/tmp.$$
done

exit 1
