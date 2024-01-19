#!/bin/bash

#Fecha: Curso 2023/2024
#Nombre: Enrique Nieto Blázquez
#Función: Enunciado en: https://drive.google.com/file/d/179Ir-IOxGZjIxQ-GsFR-wzmeRaWRCLE1/view?usp=sharing



#Meter el fichero en una variable no es necesario pero lo hago porque se recomienda meterlo todo en variables
fichero="agenda.txt"

clear



while true ; do

	echo "Bienvenido a esta agenda de contactos"
	echo "Necesito que elijas una opcion (solamente con el número):"

	echo "1 - Añadir una entrada"
	echo "2 - Buscar por DNI"
	echo "3 - Ver la agenda completa"
	echo "4 - Eliminar todas las entradas de la agenda"
	echo "5 - Finalizar"

	echo ""

	read -p "¿Qué elijes? " eleccion


	
	case $eleccion in
	
		1)
			echo "Añadir una entrada, vale"
			read -p "Necesito que me digas su DNI: " dni
			echo ""
			
			if grep "^$dni" $fichero >/dev/null; then
				echo "Esa persona ya está dada de alta"
							
			else
				read -p "Ahora necesito que me digas su nombre: " nombre
				read -p "Ahora sus apellidos (no te preocupes, tolero el espacio en blanco entre apellidos): " apellidos
				read -p "Por último su localidad: " localidad
					
				echo $dni:$nombre:$apellidos:$localidad >> $fichero
					
				echo "Acabo de meter en tu agenda $dni:$nombre:$apellidos:$localidad"			
			fi
			
			echo ""
			;;
			
			
		2)
			echo "Buscar, vale"
			read -p "Necesito que me digas su DNI: " dni
			echo ""
			if grep "^$dni:" agenda.txt >/dev/null &&  [ $dni ]; then
				nombre=$(grep "^$dni" $fichero | cut -d ":" -f 2)
				apellidos=$(grep "^$dni" $fichero | cut -d ":" -f 3)
				localidad=$(grep "^$dni" $fichero | cut -d ":" -f 4)
							
				echo "La persona con DNI número $dni es: $nombre $apellidos, y vive en $localidad"
				
			else					
				echo "Lo siento, te habras equivocado al ponerme el DNI o habrá habido un malentendido pero no tengo registrado a nadie con el DNI $dni"
			fi
			echo ""
			;;


		3)
			echo "Quieres verlo todo, vale"
			echo ""
			
			if [ -s $fichero ] ; then
				echo "Todo lo que tengo es esto:"
				echo ""
				cat $fichero
				
			else
				echo "Agenda vacía"
			fi
			
			echo ""
			;;


		4)
			echo "¡Borrarlo todo! Si es lo que quieres..."
			echo ""
			
			cat /dev/null  > $fichero
			
			echo "Ya está"
			echo ""
			;;


		5)
			echo "Vale, te dejo salir"
			
			exit 0
			;;


		*)
			echo "Solo acepto 1, 2, 3, 4 o 5. Si me pones otras cosas no sé qué hacer y debo mostrarte el menú de nuevo para darte otra oportunidad de elegir, así indefinidamente"
			echo ""
			;;
			
	esac
	
	
	
done
