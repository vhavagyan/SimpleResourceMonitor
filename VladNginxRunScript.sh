#!/bin/bash -e

./VladNginxInstall.sh

errcode=$?
if [ $errcode != 0 ]
then
	echo "Error running script NginxInstall" 
	exit $errcode
fi


./VladNginxConfig.sh

errcode=$?
if [ $errcode != 0 ]
then
	echo "Error running script NginxConfig" 
	exit $errcode
fi


./VladNginxCreateIndex.sh

errcode=$?
if [ $errcode != 0 ]
then
	echo "Error running script NginxCreateIndex" 
	exit $errcode
fi


nohup ./VladNginxUpdateInfo.sh &>/dev/null &

