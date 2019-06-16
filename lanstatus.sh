#!/bin/bash
###########
# La idea es hacer un ping a google por ejemplo que devuelva una sola linea 
# y que de esa linea capture una palabra reprensentativa del estado de conexión

#ping -c 1 google.com 	# Esto hace que el ping solo devuelva una respuesta

# Buscamos la parte de estado donde si se realiza la conexion nos informa de 0% errores
#ping -c 1 google.com | grep packets | awk '{ print $6 }'
#
#Y lo metemos en una variable de bash para trabajar con ella
#Variable ploss (Packet Loss), cronsts(cron-status-repeat) y ruta
ploss=$(ping -c 1 google.com | grep packets | awk '{ print $6 }')
ruta=$(cat localnoip.conf)
cronsts=$(cat $ruta/cronr)
#comandos
alias cpcrontab='cp /etc/crontab $ruta/crontab.tipo'
alias cpcrntipo='cp $ruta/crontab.tipo /etc/crontab'
#comenzamos
if [ "$ploss" = "0%" ]; then
	echo "no" > $ruta/cronr
	cpcrntipo
	sh $ruta/equalip.sh
else
	if [ "$cronsts" != "si" ]; then
		echo "si" > $ruta/cronr
		cpcrontab
		echo "00,10,20,30,40,50 * * * * root sh $ruta/lanstatus.sh" >> /etc/crontab
	fi
fi
