#!/bin/bash
#ya que la finalidad de esta aplicacion es comunicar la ip publica del equipo
#es importante que tenga en cuenta que en el archivo mensaje.txt debe incluir
#un mensaje redactado de tal forma que de pie a que la ultima informacion sea
#la ip, la cual se incluye desde aqui con la variable $ipname
#no obstante se incluye un mensjae de ejemplo.
#
#En el archivo libreta.txt deberá agregar una unica direccion de email por linea
ruta=$(cat localnoip.conf)
ipname=$(curl ifconfig.me)
destino=$(cat $ruta/correo/libreta.txt)
remitente=$(cat $ruta/correo/remitente.txt)
asunto=$(cat $ruta/correo/asunto.txt)
mensaje=$(cat $ruta/correo/mensaje.txt)

/usr/sbin/sendmail $destino <<EOF
Subject: $asunto
From: $remitente
$mensaje
$ipname
EOF
