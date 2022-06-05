#!/bin/bash

usage_cpu=$[100-$(vmstat 1 2 | tail -1 | awk '{print $15}')]
usage_mem=$(free -h | grep "Mem:" | awk '{print "total " $2, "used " $3}')
usage_disk=$(sudo du -hc --max-depth=1 / 2>/dev/null | tail -n 1 |awk '{print $1}')

echo "CPU usage: $usage_cpu, MEM usage: $usage_mem, Disk usage: $usage_disk"

