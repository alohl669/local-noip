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
tar -xzvf correo.tar.gz -C /etc/local-noip
rm correo.tar.gz
echo "$ruta" > /etc/local-noip/localnoip.conf
touch /etc/local-noip/ipold.conf
#
#copia de seguridad de crontab y linea de ejecución a mailing por ahora
#echo "# local-noip se ha instalado en $ruta" >> /etc/crontab
echo "@reboot root sleep 30 ; sh $ruta/equalip.sh" >> /etc/crontab
cp /etc/crontab /etc/local-noip/crontab.tipo
#
#Instalación asistida
echo "Por favor, introduzca la dirección de correo que va a usar esta maquina como remitente: "
read remitente
echo "$remitente" > /etc/local-noip/correo/remitente.txt
echo "Ahora escriba el Asunto del correo: "
read asunto
echo "$asunto" > /etc/local-noip/correo/asunto.txt
echo "A continuación escriba una única direccion de correo destinatario: "
read email
echo "$email" > /etc/local-noip/correo/libreta.txt
#a partir de aqui script que lee las siguientes direcciones de email
#
#
#
while [ "$email" != "" ]; do
	echo "Desea añadir mas destinatarios?(pulse intro si no lo desea): "
	read email
	if [ "$email" != ""  ]; then
	echo "$email" >> /etc/local-noip/correo/libreta.txt
	else echo "De acuerdo"
	fi
done
#
echo "Instalación terminada, muchas gracias."
