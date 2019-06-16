#!/bin/bash
#instalador basico para local-noip
#La idea es copiar el cron original del usuario para no plancharlo
#y añadir la linea necesaria que hara posible esta aplicación
#mas adelante se repetirá el proceso de la misma forma sin comprometer 
#las nuevas incorporaciones
#
#variables basicas
ruta=$(pwd)
echo "$ruta" > localnoip.conf
#i=0
#copia de seguridad de crontab y linea de ejecución a mailing por ahora
echo "@reboot root sleep 30 ; sh $ruta/mailing.sh" >> /etc/crontab
cp /etc/crontab $ruta/crontab.tipo
#
#Instalación asistida
echo "Por favor, introduzca la dirección de correo que va a usar esta maquina como remitente: "
read remitente
echo "$remitente" > $ruta/correo/remitente.txt
echo "Ahora escriba el Asunto del correo: "
read asunto
echo "$asunto" > $ruta/correo/asunto.txt
echo "A continuación escriba una única direccion de correo destinatario: "
read email
echo "$email" > $ruta/correo/libreta.txt
#a partir de aqui script que lee las siguientes direcciones de email
#for #condicion;
#do
#	echo "Desea añadir mas destinatarios?(pulse intro si no lo desea): "
#	read email
#	if [ "$email" != "" ];
#		then echo "$email" >> $ruta/correo/libreta.txt
#		#incrementamos el contador
#		else #ponemos tope al contador
#	fi
#done
#mensaje final
while [ "$email" != "" ]; do
	echo "Desea añadir mas destinatarios?(pulse intro si no lo desea): "
	read email
	echo "$email" >> $ruta/correo/libreta.txt
done
#
echo "Instalación terminada, muchas gracias."
