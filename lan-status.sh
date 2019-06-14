#!/bin/bash
###########
# Las siguientes lineas aun no funcionan, la idea es hacer un ping
# a google por ejemplo que devuelva una sola linea y que de esa linea
# solo capture la última palabra
ping -c 1 google.com # Esto hace que el ping solo devuelva un estado

# Esta linea por ahora devuelva la primera palabra de la linea que nos ha 
# devuelto el ping
ip addr show br0 | grep inet | awk '{ print $1; }'
