#!/bin/bash
ipnew=$(curl ifconfig.me)
ipold=$(cat ipold.ip)
if
	[ "$ipnew" != "$ipold"  ];
	then sh mailing.sh      	#Comprobamos IP vieja o tomada 
	echo "$ipnew" > ipold.ip	#anteriormente y de no coincidir 
	                        	#mandamos la info y registramos la ip
fi
