# LOCAL-NOIP

## Descripción

La aplicación envía por email la ip si esta ha cambiado, hace una comprobación al arranque y cada 10 minutos. Si por alguna razón se pierde la conexión las comprobaciones pasan a realizarse en intervalos de 5 minutos.

La aplicación se configura en la instalación y se puede configurar despues de forma manual con los parametros -c o --configure


### Requisitos

Acceso administrador.
Centos 7
sendmail
curl
