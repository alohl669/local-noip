#!/bin/bash
#var
#pillamos la ruta desde donde se instala
ruta=$(pwd)

#creamos los directorios de instalacion
mkdir /etc/local-noip
mkdir /etc/local-noip/backup

#esta parte hay que revisarla, paso de tener un tar
tar -xzvf correo.tar.gz -C /etc/local-noip
rm correo.tar.gz

#creamos el archivo de rutas y variables - hay que meter las generales
echo "$ruta" > /etc/local-noip/localnoip.conf

#creamos los archivos que se usarán mas adelante - mas adelante se creara en el mismo archivo de rutas
touch /etc/local-noip/ipold.conf
touch /etc/local-noip/cronr.conf
#
#copia de seguridad de crontab y linea de ejecución a mailing por ahora
#echo "# local-noip se ha instalado en $ruta" >> /etc/crontab
echo "@reboot root sleep 30 ; sh $ruta/noip.sh" >> /etc/crontab
echo "00,10,20,30,40,50 * * * * root sh $ruta/noip.sh" >> /etc/crontab
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
