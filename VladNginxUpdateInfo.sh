#!/bin/bash

conffilename="/etc/nginx/sites-enabled/bootcamp_aca.conf"

siterootdir=$(sed -n '/root /p' $conffilename | awk '{ print $2 }' | sed 's/;//')
indexfilename=$(sed -n '/index /p' $conffilename | awk '{ print $2 }' | sed 's/;//')


while :
do

	usage_cpu=$[100-$(vmstat 1 2 | tail -1 | awk '{print $15}')]
	usage_mem=$(free -h | grep "Mem:" | awk '{print "total " $2, "used " $3}')
	usage_disk=$(sudo du -hc --max-depth=1 / 2>/dev/null | tail -n 1 |awk '{print $1}')
	
	
	htmltext="<html>
	        <head>
	                <title>Simple resource monitor</title>
	        </head>
	        <body>
		<p>Date: $(date)</p>
	        <p>CPU usage: $usage_cpu %</p>
	        <p>Memory usage: $usage_mem</p>
	        <p>Disk usage: $usage_disk</p>
	        </body>
	</html>"
	
	echo $htmltext | sudo tee $siterootdir/$indexfilename >/dev/null

	sleep 5

done

