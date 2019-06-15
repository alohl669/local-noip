#!/bin/bash
#ya que la finalidad de esta aplicacion es comunicar la ip publica del equipo
#es importante que tenga en cuenta que en el archivo mensaje.txt debe incluir
#un mensaje redactado de tal forma que de pie a que la ultima informacion sea
#la ip, la cual se incluye desde aqui con la variable $ipname
#no obstante se incluye un mensjae de ejemplo.
#
#En el archivo libreta.txt deberá agregar una unica direccion de email por linea
ruta=$(pwd)
ipname=$(curl ifconfig.me)
destino=$(cat $ruta/libreta.txt)
remitente=$(cat $ruta/remitente.txt)
asunto=$(cat $ruta/asunto.txt)
mensaje=$(cat $ruta/mensaje.txt)

/usr/sbin/sendmail $destino <<EOF
Subject: $asunto
From: $remitente
$mensaje
$ipname
EOF
