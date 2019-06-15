#!/bin/bash
#instalador basico para local-noip
#La idea es copiar el cron original del usuario para no plancharlo
#y añadir la linea necesaria que hara posible esta aplicación
#mas adelante se repetirá el proceso de la misma forma sin comprometer 
#las nuevas incorporaciones
#
#variables
ruta=$(pwd)
#
echo "@reboot root sleep 30 ; sh $ruta/net-status.sh" >> /etc/crontab
cp /etc/crontab crontab.tipo
chown root:root equal-ip.sh lan-status.sh mailing.sh
chmod 754 equal-ip.sh lan-status.sh mailing.sh
