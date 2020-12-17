#!/usr/bin/env bash
cd /root/checkout

if grep -Fxq "$1" sitelist.txt
then
    if test -f $1; then
    	echo "$1 is already checked out by " 
    	cat $1
	else
		echo $2 "on" $(date '+%d/%m/%Y %H:%M:%S') > $1
		echo $1 is now checked out
fi
else
    echo Site not listed.  Run:
    echo \"check.sh list\" for full list or
    echo \"check.sh create \<sitename\>\" to add a new site.
fi

