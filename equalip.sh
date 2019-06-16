#!/bin/bash
ruta=/etc/local-noip
ipnew=$(curl ifconfig.me)
ipold=$(cat $ruta/ipold.conf)

#Comprobamos IP vieja o tomada anteriormente y de no coincidir mandamos la info y registramos la ip
if
	[ "$ipnew" != "$ipold"  ];
	then sh $ruta/mailing.sh 
	echo "$ipnew" > $ruta/ipold.conf
fi
