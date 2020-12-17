#!/usr/bin/env bash
cd /root/checkout

if grep -Fxq "$1" sitelist.txt
then
	echo $1 already exists on the site list.
else
	# Site not listed, go ahead and add it to the list

    echo $1 >> sitelist.txt
    echo Site: $1 added to the list
fi

