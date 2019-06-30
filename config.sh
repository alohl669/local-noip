#!/bin/bash
#variables basicas
#
#Instalación asistida
cp /etc/local-noip/correo/asunto.txt /etc/local-noip/backup/
cp /etc/local-noip/correo/libreta.txt /etc/local-noip/backup/
cp /etc/local-noip/correo/remitente.txt /etc/local-noip/backup/
cp /etc/local-noip/correo/mensaje.txt /etc/local-noip/backup/
echo "##########################################"
echo "               LOCAL-NOIP"
echo "##########################################"
echo ""
echo "Se van a cambiar los valores por defecto de la utilidad de correo, por su seguridad se ha realizado una copia de seguridad que usted deberá restaurar en caso de fallo, lease el README para comprobar la relacion de directorios para asi poder restaurar de forma adecuada su configuración anterior. Si por alguna razón no desea hacer ningún cambio simplemete no rellene el formulario"
echo ""
echo "Introduzca la nueva dirección de correo que va a usar esta maquina como remitente(pulse intro para mantener la dirección actual): "
read remitente
if [ "$remitente" != ""  ]; then
echo "$remitente" > /etc/local-noip/correo/remitente.txt
fi
#
echo "Ahora escriba el Asunto del correo(pulse intro para mantener el asunto actual): "
read asunto
if [ "$asunto" != ""  ]; then
echo "$asunto" > /etc/local-noip/correo/asunto.txt
fi
#
echo "Desea añadir mas destinatarios?(pulse intro si no lo desea): "
read email
if [ "$email" != "" ]; then
echo "$email" >> /etc/local-noip/correo/libreta.txt
while [ "$email" != "" ]; do
        echo "Desea añadir mas destinatarios?(pulse intro si no lo desea): "
        read email
        if [ "$email" != ""  ]; then
        echo "$email" >> /etc/local-noip/correo/libreta.txt
        else echo "De acuerdo"
        fi
done
fi
#
echo "Actualización terminada, muchas gracias."
