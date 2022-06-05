#!/bin/bash

set -e

wgetretres=$(sudo wget -q -O /etc/nginx/sites-enabled/bootcamp_aca.conf https://transfer.sh/QX7UuX/bootcamp_aca.conf)

errcode=$?
if [ $errcode == 0 ]
then
	sudo rm -f /etc/nginx/sites-enabled/default
	sudo nginx -s reload
else
	echo "Errors on downloading config file: $wgetretres"
	exit $errcode
fi

