@echo off

rem Autor: Enrique Nieto Blázquez
rem Fecha: Miercoles 15-11-2023
rem Funcion: Crear un menú de 5 opciones


rem Zona de estética
title Menu de opciones

echo Indice
echo;
echo 1 - Crear fichero con nombre pedido al usuario
echo 2 - Mostrar el arbol de directorios de la carpeta de usuario
echo 3 - Mostrar archivos con extension txt
echo 4 - Crea los directorios alfredoff, marinapg y ramonam en tu directorio actual
echo 5 - Copia el contenido de tu carpeta de usuario al Escritorio.


rem Zona de encaminamiento
set /p opcion="Que opcion elijes "

if %opcion%==1 goto crearficheroconame
if %opcion%==2 goto mostrar
if %opcion%==3 goto mostrartxt
if %opcion%==4 goto crearficherosconcretos
if %opcion%==5 goto copiar


rem Zona de resolucion
:crearficheroconame
set /p name="Dime el nombre que quieras ponerle, incluyendo su extension "
type nul > %name%
exit

:mostrar
tree %USERPROFILE%
echo;
pause
exit

:mostrartxt
dir *.txt
echo;
pause
exit

:crearficherosconcretos
mkdir alfredoff marinapg ramonam
exit

:copiar
xcopy /t /e "%USERPROFILE%" "C:\Copias"
echo Accion completada
pause
exit