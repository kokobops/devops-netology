#!/usr/bin/env bash
pull=(192.168.0.1 173.194.222.113 87.250.250.242)
status=0

while (($status == 0))
do
    for y in ${pull[@]}
    do
	curl -Is $y:80 > /dev/null
	status=$?
	    if (($status != 0))
	    then
	    echo "host $y status - $status" >> /var/log/status.log
	    exit
	    fi
    done
done