README

--Requisitos--
El instalador debe ejecutarse con permisos de administrador.
También se requiere tener instalado y configurado sendmail y curl.

--Función--
La aplicación envía por email la ip si esta ha cambiado, hace una comprobación al arranque y cada 10 minutos. Si por alguna razón se pierde la conexión las comprobaciones pasan a realizarse en intervalos de 5 minutos.
También se puede hacer de forma manual ejecutando noip.sh

Se dispone de archivos de texto para configurar los campos del email.
Dichos archivos se configuran en la instalación pero se pueden cambiar de forma manual o haciendo uso de la herramienta "config.sh"

La disposición de los ficheros es la siguiente:
/etc/local-noip/localnoip.conf --> Configuración básica de la aplicación.
/etc/local-noip/correo/asunto.txt --> Contiene el asunto del email.
/etc/local-noip/correo/libreta.txt --> contiene la lista de direcciones a las que se le mandará la ip por correo
/etc/local-noip/correo/remitente.txt --> Contiene la dirección de correo que usara la aplicación para enviar el email
/etc/local-noip/correo/mensaje.txt --> Contiene el mensaje que se enviará en el email
/etc/local-noip/crontab.tipo --> Copia de Seguridad de crontab
/etc/local-noip/backup/ --> Copia de seguridad de los parámetro de correo
