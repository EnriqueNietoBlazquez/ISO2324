#!/bin/bash



#Nombre: Enrique Nieto Blázquez
#Año escolar: 2023/2024
#Función: https://moodle.educarex.es/iescastelarfp/pluginfile.php/72621/mod_resource/content/2/Entregable%204.%20Users.pdf



#Zona de comprobacion de errores:
if [ $# -ge 2  ]; then
	echo "Necesito 1 párametro o ninguno, no $#"
	exit 1
fi



#Zona de establecimiento del UID a comparar:
numero=$1

if [ -z $1 ]; then
	numero=1000
fi



#Comprobacion de que las dos zonas anteriores funcionen (descomentar para activar):
#echo "Te presento una variable: $numero"



#Zona de inicio de creacion de la salida del script:
#Al estar en /tmp, no consume accesos al discos si no memoria, exactamente igual que una variable
#Da igual que el fichero donde se guardan temporalmente los datos sea un script y así es más descriptivo el nombre, si no podria confundirse con un fichero del sistema en vez de un fichero de este script
echo "=======================================================" > /tmp/FicheroDeUsers.sh
echo "" >> /tmp/FicheroDeUsers.sh
fechacalendario=$(date +%d-%m-%Y)
hora=$(date +%H:%M)
echo "Informe de usuarios el día $fechacalendario" a las $hora >> /tmp/FicheroDeUsers.sh
echo "" >> /tmp/FicheroDeUsers.sh



#Zona de captura de datos de usuarios:
#No funciona si el campo a utilizar es el ultimo campo que se le indica al IFS
while IFS=: read usuario segundocampo uid cuartocampo
do
	#El enunciado dice mayor, no mayor o igual, por eso es gt
	if [ $uid -gt $numero ]; then
		#Captura de datos:
		echo "$usuario - $uid" >> /tmp/FicheroDeUsers.sh
		echo "" >> /tmp/FicheroDeUsers.sh
		
		#Contador:
		#Funciona aunque la variable contador haya un momento en que sea sumarle 1 a una variable vacia
		let contador=$contador+1	
	fi
	
done < /etc/passwd



#Zona de final de creacion de la salida del script y limpieza de residuos:
echo "Total: $contador usuarios" >> /tmp/FicheroDeUsers.sh	
echo "" >> /tmp/FicheroDeUsers.sh
echo "=======================================================" >> /tmp/FicheroDeUsers.sh

cat /tmp/FicheroDeUsers.sh

#Este fichero solamente era para ir preparando la salida del script, así que despues de hacer el cat, ha cumplido su función. 
rm /tmp/FicheroDeUsers.sh



#Zona de log:
echo "$fechacalendario - $hora - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
