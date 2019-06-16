#!/bin/bash
#instalador basico para local-noip
#La idea es copiar el cron original del usuario para no plancharlo
#y añadir la linea necesaria que hara posible esta aplicación
#mas adelante se repetirá el proceso de la misma forma sin comprometer 
#las nuevas incorporaciones
#
#variables basicas
ruta=$(pwd)
#para el tema rutas podemos barajar varias formas, la primera con la cutrada 
#de añadir la direccion a crontab y capturarla con
#cat /etc/crontab | grep instalado | awk '{ print $7 }'
#lo cual es bastante cutre
#
#La otra opción es dejar localnoip.conf en /etc/local-noip/ Probemos:
mkdir /etc/local-noip
echo "$ruta" > /etc/local-noip/localnoip.conf
#
#copia de seguridad de crontab y linea de ejecución a mailing por ahora
#echo "# local-noip se ha instalado en $ruta" >> /etc/crontab
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
#
#
#
while [ "$email" != "" ]; do
	echo "Desea añadir mas destinatarios?(pulse intro si no lo desea): "
	read email
	if [ "$email" != ""  ]; then
	echo "$email" >> $ruta/correo/libreta.txt
	else echo "De acuerdo"
	fi
done
#
echo "Instalación terminada, muchas gracias."
