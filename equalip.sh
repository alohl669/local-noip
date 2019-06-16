#!/bin/bash
ruta=/etc/local-noip
rutaapp=$(cat /etc/local-noip/localnoip.conf)
ipnew=$(curl ifconfig.me)
ipold=$(cat $ruta/ipold.conf)

#Comprobamos IP vieja o tomada anteriormente y de no coincidir mandamos la info y registramos la ip
if
	[ "$ipnew" != "$ipold"  ];
	then sh $rutaapp/mailing.sh 
	echo "$ipnew" > $ruta/ipold.conf
fi
