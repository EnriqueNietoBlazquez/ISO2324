"""
Nombre: 
Enrique Nieto Blázquez

Año escolar: 
2023/2024

Función: 
Diapositiva 54
https://moodle.educarex.es/iescastelarfp/pluginfile.php/72837/mod_resource/content/7/UT6.%20Programaci%C3%B3n%20en%20Python.%20Scripts%20de%20administraci%C3%B3n.pdf
"""



#Zona de librerias:
import os
import cpuinfo as c



#Zona de definición de funciones:
#En teoria con algo como "from infoUsers.py import ComprobarRoot()" deberia poner importar esta funcion como cualquier libreria y así simplificar futuros códigos
#Esta creacion de librerias propias obliga a usar nombres especialmente descriptivos para evitar confusiones que Internet no resolverá tan facilmente
def o_eres_root_o_fin():
    identidad=os.getuid() == 0

    if identidad==False:
        print("No eres root")
        exit(0)



#Zona de seguridad:
o_eres_root_o_fin()



#Menú:
#Variable para que el bucle pueda iniciarse
opcion=5

while opcion != 4:
    print("Opción 1: Muestra información del SSOO e información de la CPU.")
    print("Opción 2: Pedir un usuario. Si existe, se muestra información sobre él, si no, se crea.")
    print("Opción 3: Pedir al usuario un directorio. Comprobar si existe y si es un directorio, en caso contrario, lo crea.")
    print("Opción 4: Salir")

    print("")

    #Encaminamiento del bucle
    opcion = int(input("Dime la opción: "))
    print("")

    #Primera opción:
    if opcion==1:
        #Sistema operativo:
        print("Tu sistema operativo es:")
        print(os.uname().sysname)
        print("")
        
        #Procesador:
        print("Tu CPU es:")
        print(c.get_cpu_info()["brand_raw"])
        print("")
        
    #Segunda opción:
    elif opcion==2:
        #Coger el usuario
        usuario=input("Dime un usuario: ")
        
        #Acceder a donde vamos a buscar al usuario
        fichero = open("/etc/passwd", mode="r")
        
        #Ajustar para no necesitar complicarse con bucles:
        registro = fichero.read()
        
        if usuario in registro:
            print("Existe")
            print("")
        else:
            print("No existe, voy a crearlo")
            os.system("useradd -m "+usuario)
            print("")
        
        #Cerrar procesos y conexiones que ya no son necesarios    
        fichero.close()

    #Tercera opción:
    elif opcion==3:
        #Averiguar el directorio
        directorio=input("Dime un directorio: ")

        #Comprobar si existe, ya sea con rutas relativas o absolutas:
        valor=os.path.exists(directorio)
        
        #Actuar en consecuencia segun el estado del fichero:
        if valor==True:
            print("Existe")
            print("")
            
        elif valor==False:
            os.mkdir(directorio)
            print("No existe pero lo he creado")
            print("")
            
    #Cuarta opción:
    elif opcion==4:
        #No hace falta break ni exit ni nada porque la condicion del bucle ya se encarga
        print("Adios")
        print("")
        
    #Actuación en caso de emergencia:
    else:
        print("Error")
        print("")
