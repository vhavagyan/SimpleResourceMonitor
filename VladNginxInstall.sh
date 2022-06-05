#!/bin/bash 

set -e

if [ -z $(which nginx) ] 
then
	sudo apt install -y nginx
fi

sudo nginx -t

errcode=$?
if [[ $errcode == 0 ]]
then
	echo "nginx is configured properly"
else
	echo "nginx is not configured properly"
	exit $errcode
fi
