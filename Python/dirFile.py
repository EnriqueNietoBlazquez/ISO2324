"""
Nombre:
Enrique Nieto Blázquez

Año escolar:
2023/2024

Diapositiva:
56
https://moodle.educarex.es/iescastelarfp/pluginfile.php/72837/mod_resource/content/8/UT6.%20Programaci%C3%B3n%20en%20Python.%20Scripts%20de%20administraci%C3%B3n.pdf

Comentario:
Todo funciona perfectamente con espacios, tildes y con carácteres "ñ", todo menos la clasificación del contenido de rutas.txt en ficheros y directorios.
Bueno todo...si hay una "ñ" da error pero es un falso error porque al comprobar, te das cuenta de que ha funcionado, por ejemplo la copia del fichero usando shutil
Usando bucles y condicionales deberia poner arreglarse:

Primero recorro buscando letras "ñ", y si las hay, las sustituyo con la letra "n" y hago la comprobación, luego guardo la linea original en la lista en vez de la linea modificada
Las tildes son las más laboriosas, habria que hacer un if que busque y sustituya á por a, é por e...

No seria muy complicado de hacer, aunque si que haría el código mucho más largo y aumentaría el consumo de recursos hardware
"""



#Zona de librerias:
import os
import shutil



#Zona de separacion en listas:
fichero=open("rutas.txt", mode="r")

listatotal=fichero.readlines()

ficheros=[]
directorios=[]

for i in listatotal:
    #Purificación de carácteres especiales:
    r=i.strip()

    if os.path.isfile(r):
        ficheros.append(r)
    elif os.path.isdir(r):
        directorios.append(r)



#Zona de definción de opcion:
#Al usar tanto las funciones, es más facil separar el código por zonas, lo cual aumenta mucho la legibilidad, más incluso que las tabulaciones
def borrar():
    print("La lista que tengo es:",ficheros)
    print("¿Cual quieres borrar? Pon 0 para el primero, 1 para el segundo......")
    eleccion=int(input("Dime: "))

    if os.path.exists(ficheros[eleccion]) == False:
        print("Ese fichero no existe, no puedo borrarlo")
    elif os.path.exists(ficheros[eleccion]) == True:
        os.remove(ficheros[eleccion])


def infodir():
    print("La lista que tengo es:",directorios)
    print("¿De cual quieres saber informacion? Pon 0 para el primero, 1 para el segundo...")
    eleccion=int(input("Dime: "))

    if os.path.exists(directorios[eleccion]) == False:
        print("Ese directorio no existe")
    elif os.path.exists(directorios[eleccion]) == True:
        print(os.listdir(directorios[eleccion]))


def copiar():
    print("La lista que tengo es:", ficheros)
    print("¿Cual quieres copiar? Pon 0 para el primero, 1 para el segundo......")
    eleccionfichero = int(input("Dime: "))

    print("")

    print("Ahora necesito saber donde lo quieres copiar:", directorios)
    eleccionubicacion = (input("Las reglas son las mismas, o sea 0 para el primero...: "))

    if os.path.exists(ficheros[eleccionfichero]) == False:
        print("Ese fichero no existe")
    elif os.path.exists(ficheros[eleccionfichero]) == True:
        if os.path.exists(directorios[eleccionubicacion]) == False:
            print("Ese directorio no existe")
        elif os.path.exists(ficheros[eleccionfichero]) == True:
            shutil.copy(ficheros[eleccionfichero], directorios[eleccionubicacion])


def mostrar():
    opcion=int(input("¿Quieres que te muestra la lista de directorios o la de ficheros? Marca 1 o 2: "))

    if opcion==1:
        print(directorios)
    elif opcion==2:
        print(ficheros)



#Zona de interfaz del usuario:
while True:
    print("Elige:")
    print("A- Pedir nombre de fichero y eliminarlo.")
    print("B- Pedir nombre de directorio y mostrar su información.")
    print("C- Pedir nombre de fichero, nombre de destino y copiarlo en dicho destino.")
    print("D- Mostrar lista elegida por el usuario.")
    print("E- Salir")

    print("")

    opcion=input("Cual elijes? dime la letra en minuscula: ")

    print("")

    if opcion=="a":
        borrar()
        print("")

    elif opcion=="b":
        infodir()
        print("")

    elif opcion == "c":
        copiar()
        print("")

    elif opcion == "d":
        mostrar()
        print("")

    elif opcion == "e":
        exit(0)

    else:
        print("Error")
        print("")
