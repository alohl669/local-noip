#!/bin/bash
###########
# Las siguientes lineas aun no funcionan, la idea es hacer un ping
# a google por ejemplo que devuelva una sola linea y que de esa linea
# solo capture la última palabra

#ping -c 1 google.com 	# Esto hace que el ping solo devuelva un estado

# Esta linea por ahora devuelva la primera palabra de la linea que nos ha 
# devuelto el ping
# Buscamos la parte de estado donde si se realiza la conexion nos informa de 0% errores
#ping -c 1 google.com | grep packets | awk '{ print $6 }'
#
#Y lo metemos en una variable de bash para trabajar con ella
#Variable ploss (Packet Loss)
ploss=$(ping -c 1 google.com | grep packets | awk '{ print $6 }')

#comenzamos
if
	[ "$ploss" = "0%" ]; then
	sh mailing.sh	#echo "guay tio" #aqui sustituimos por sh mailing.sh
else
	echo "nada guay tio" #aqui se incrustaran un sh que modifique el crontab para hacer comprobaciones periodicas
fi
echo $ploss
