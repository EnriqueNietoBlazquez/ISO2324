#!/bin/bash

#Nombre: Enrique Nieto Blázquez
#Año escolar: 2023/2024
#Funcion: https://moodle.educarex.es/iescastelarfp/pluginfile.php/72620/mod_resource/content/1/Entregable%203.%20FiveOrMore.pdf

if [ $# != 2 ] ; then
	echo "Solo puedo trabajar si me pasas 2 parámetros, no $#"
	exit 1
fi

if [ -f $1 ] ; then
	echo "El fichero que me has pasado existe, se me ha programado para no trabajar con ficheros que existan"
	exit 1
fi

if [ ! -d $2 ] ; then
	echo "El directorio $2 no existe, vuelve a intentarlo y pasame uno que sí exista"
	exit 1
fi

directoriovacio=$(ls $2)

if [ -z $directoriovacio 2>/dev/null ] ; then
	echo "El directorio $2 está vacio"
	exit 1
fi

echo "Enrique Nieto Blázquez"

ficheros=$(ls $2/*.txt)

for i in $ficheros ; do
	lineas=$(wc -l $i | cut -d " " -f1)	
	
	if [ $lineas -ge 5 ] ; then
		echo $i
		echo $i >> $1
		touch $i.q
		palabras=$(wc -w $i | cut -d " " -f1)
		echo "El número de palabras del fichero original es: $palabras" >> $i.q
		echo "" >> $i.q
		cat $i >> $i.q
	fi
done

NumerodeFicheros=$(wc -l $1 | cut -d " " -f1)
echo "" >> $1
echo "Se han identificado $NumerodeFicheros" >> $1