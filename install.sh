#!/bin/bash
#var
#pillamos la ruta desde donde se instala
rutaapp=$(pwd)

#creamos los directorios de instalacion
mkdir /etc/local-noip
mkdir /etc/local-noip/correo
mkdir /etc/local-noip/backup

#Creamos los archivos para la funcion de mailing
touch /etc/local-noip/correo/asunto.txt
touch /etc/local-noip/correo/libreta.txt
touch /etc/local-noip/correo/remitente.txt
cat > /etc/local-noip/correo/mensaje.txt<<EOF
Recibe este mensaje porque la IP del servidor ha cambiado.
Se recomienda que apunte la ip o no borre este mensaje ya que no se le mandará ninguna otra a no ser que cambie de nuevo.

Por favor, no responda a este mensaje.

La última dirección IP conocida es:
EOF

#creamos el archivo de rutas y variables
echo "ruta=/etc/local-noip" > /etc/local-noip/localnoip.conf
echo "ruta_correo=/etc/local-noip/correo" >> /etc/local-noip/localnoip.conf
echo "rutaapp=$rutaapp" >> /etc/local-noip/localnoip.conf

#creamos los archivos que se usarán mas adelante - mas adelante se creara en el mismo archivo de rutas
touch /etc/local-noip/ipold.conf
touch /etc/local-noip/cronr.conf
#
#copia de seguridad de crontab y linea de ejecución a mailing por ahora
#echo "# local-noip se ha instalado en $ruta" >> /etc/crontab
echo "@reboot root sleep 30 ; sh $rutaapp/noip.sh" >> /etc/crontab
echo "00,10,20,30,40,50 * * * * root sh $rutaapp/noip.sh" >> /etc/crontab
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
