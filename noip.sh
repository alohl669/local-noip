#!/bin/bash
############## 1 script version#############
#var
#var rutas globales
ruta=/etc/local-noip
ruta_correo=/etc/local-noip/correo
rutaapp=$(cat /etc/local-noip/localnoip.conf)

#functions
function mailing{
  #var function
  ipname=$(curl ifconfig.me)
  destino=$(cat $ruta_correo/libreta.txt)
  remitente=$(cat $ruta_correo/remitente.txt)
  asunto=$(cat $ruta_correo/asunto.txt)
  mensaje=$(cat $ruta_correo/mensaje.txt)

/usr/sbin/sendmail $destino<<EOF
Subject: $asunto
From: $remitente
$mensaje
$ipname
EOF
}

function equalip{
  #var function
  ipnew=$(curl ifconfig.me)
  ipold=$(cat $ruta/ipold.conf)

  #Comprobamos IP vieja o tomada anteriormente y de no coincidir mandamos la info y registramos la ip
  if
  	[ "$ipnew" != "$ipold"  ];
  	then mailing
  	echo "$ipnew" > $ruta/ipold.conf
  fi
}

function lanstatus{
  #var function
  ploss=$(ping -c 1 google.com | grep packets | awk '{ print $6 }')
  cronsts=$(cat $ruta/cronr.conf)
  #alias function
  alias cpcrontab='cp /etc/crontab $ruta/crontab.tipo'
  alias cpcrntipo='cp $ruta/crontab.tipo /etc/crontab'

  if [ "$ploss" = "0%" ]; then
  	echo "no" > $ruta/cronr.conf
  	cpcrntipo
  	equalip
  else
  	if [ "$cronsts" != "si" ]; then
  		echo "si" > $ruta/cronr.conf
  		cpcrontab
  		echo "05,15,25,35,45,55 * * * * root sh $rutaapp/noip.sh" >> /etc/crontab
  	fi
  fi
}

lanstatus
