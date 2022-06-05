#!/bin/bash

set -e

conffilename="/etc/nginx/sites-enabled/bootcamp_aca.conf"

siterootdir=$(sed -n '/root /p' $conffilename | awk '{ print $2 }' | sed 's/;//')
indexfilename=$(sed -n '/index /p' $conffilename | awk '{ print $2 }' | sed 's/;//')

sudo mkdir -p $siterootdir

htmltext="<html>
	<head>
		<title>Simple resource monitor</title>
	</head>
	<body>
	<p>$(date)</p>
	</body>
</html>"

echo $htmltext | sudo tee $siterootdir/$indexfilename >/dev/null


curl -s localhost >/dev/null
errcode=$?
if [ $errcode == 0 ]
then
	echo "Index html works"
else
	echo "Index html does not work"
	exit $errcode
fi

