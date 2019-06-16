#!/bin/bash
#instalador basico para local-noip
#La idea es copiar el cron original del usuario para no plancharlo
#y añadir la linea necesaria que hara posible esta aplicación
#mas adelante se repetirá el proceso de la misma forma sin comprometer 
#las nuevas incorporaciones
#
#variables
ruta=$(pwd)
echo "$ruta" > localnoip.conf
#
echo "@reboot root sleep 30 ; sh $ruta/lanstatus.sh" >> /etc/crontab
cp /etc/crontab $ruta/crontab.tipo
#chown root:root equal-ip.sh lan-status.sh mailing.sh
#chmod 755 equal-ip.sh lan-status.sh mailing.sh
#cancelado tema permisos por problemas con cron.
