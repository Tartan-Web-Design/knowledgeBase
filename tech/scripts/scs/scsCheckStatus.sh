#!/usr/bin/env bash
cd ./checkout

if [[ $(ls | egrep -v '.+\..+' ) ]]; then
    	echo 'The following sites are checked out'
	ls | egrep -v '.+\..+' 
else
    echo "No files checked out"
fi

