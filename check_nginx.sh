#!/bin/bash

SERVICE="nginx" #Variable which names the service 

ONLINE_LOG="/home/reports/nginx_online.log" #log that is created to register date and hour when the server is online.
OFFLINE_LOG="/home/reports/nginx_offline.log" #log that is created to register date and hour when the server is offline.


if systemctl is-active --quiet $SERVICE #conditional block used to register in the respective log, either the service online or offline. 
then

	echo "$(date '+%Y-%m-%d %H:%M:%S'): Serviço $SERVICE está ONLINE e operante." >> $ONLINE_LOG

else
	echo "$(date '+%Y-%m-%d %H:%M:%S'): Serviço $SERVICE está OFFLINE. Verifique o servidor." >> $OFFLINE_LOG

fi


