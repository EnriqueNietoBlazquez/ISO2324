#!/bin/bash

# Nombre: Enrique Nieto Blázquez
# Curso: 2023/2024
# Función: https://moodle.educarex.es/iescastelarfp/pluginfile.php/72619/mod_resource/content/1/Entregable%202.%20Calculadora.pdf



# Zona de comprobacion de errores
if [ $# != 2 ] ; then
	echo "Necesito 2 parámetros, ni más, ni menos pero me has pasado $#"
	echo "Lo siento, debo cerrarme"
	exit 0
fi

if [ -f $1 ] ; then
	echo "El fichero existe, no puedo aceptarlo porque me veria obligado a sobrescribir lo que sea que tenga"
	exit 0	
fi



# Introducción
clear 

echo "Enrique Nieto Blázquez"

echo ""

echo "Te aviso. Si el primer parámetro que me has pasado es una carpeta, una ruta absoluta o una ruta con .. y/o si el segundo parámetro no es un número sin decimales; voy a dar errores así que te recomienda cerrarme y volverme a ejecutar si has cometido alguno de esos errores"
echo "Tambien daré problemas si para cuando termina el contador de repeticiones o pulsas X, no has hecho ninguna repetición completa y bien"

echo ""



#Bucle
for ((i=0; i<$2; i++)) do

	echo "Di S para sumar, R para restar, M para multiplicar o D para restar"
	echo "O dime X para cerrar"
	echo "Solo una cosas más, si me dejes datos sin introducir, daré problemas."

	echo ""
	read -p "Operación Op1 Op2: " Operacion Op1 Op2
	echo ""

	case $Operacion in

		S)
			resultado=$(($Op1+$Op2))
			echo "Me has dicho que sume"
			echo "$Op1 + $Op2 es igual a $resultado"
			echo "$Operacion $Op1 $Op2" >> "$1"
		;;
		
		R)
			resultado=$(($Op1-$Op2))
			echo "Me has dicho que reste"
			echo "$Op1 - $Op2 es igual a $resultado"
			echo "$Operacion $Op1 $Op2" >> "$1"
		;;
		
		M)
			resultado=$(($Op1*$Op2))
			echo "Me has dicho que multiplique"
			echo "$Op1 por $Op2 es igual a $resultado"
			echo "$Operacion $Op1 $Op2" >> "$1"
		;;
		
		D)
			resultado=$(($Op1/$Op2))
			resto=$(($Op1%$Op2))
			echo "Me has dicho que sume"
			echo "$Op1 entre $Op2 es igual a $resultado con resto $resto"
			echo "$Operacion $Op1 $Op2" >> "$1"
		;;
		
		X)
			break
		;;
		
		*) 
			echo "Operacion incorrecta. Vuelve a intentarlo, pero aun así, esta repeticion cuenta y por tanto se resta del contador de repeticiones permitidas"
		;;
	esac	
done



# Despedida
echo "Voy a dar por terminado este script pero antes toma la ubicacion del fichero que me has pasado y su contenido"
echo "Debo darlo por terminado bien por haber pulsado X o bien por haber llegado al limite del contador de repiticiones"

ruta=$(pwd)
echo "Su ubicacion es $ruta/$1"
		
echo "Su contenido es:"
cat $1	
exit 0
