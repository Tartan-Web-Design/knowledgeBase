#!/usr/bin/env bash
cd /root/checkout
if test -f $1; then
	rm $1
	echo "$1 is now checked in."
else
	if grep -Fxq "$1" sitelist.txt
	then
		echo "$1 is already checked in: "
	else
	# Site not listed, 

		echo "$1 is not on the list of sites you can check in."

	fi


	
fi