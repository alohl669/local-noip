#!/bin/bash
ipname=$(curl ifconfig.me)
destino="alohl669@protonmail.com"
autor="admin@drh-test.es"
asunto="[DRH-TEST]Reinicio del Servidor y cambio de IP"
mensaje="La última dirección IP conocida es: 
$ipname

No olvide añadir el puerto mediante la opción -p XXX."

/usr/sbin/sendmail $destino <<EOF
Subject: $asunto
From: $autor
$mensaje
EOF
