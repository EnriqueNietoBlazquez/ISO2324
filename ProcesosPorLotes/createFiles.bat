@echo off

rem Autor: Enrique Nieto Blázquez
rem Fecha: Miercoles 15-11-2023
rem Funcion: Crear un menú de 2 opciones



title Creacion


rem Zona de recogida de datos
set /p opcion="Pulsa 1 para crear un txt y 2 para crear un bat "
set /p deseo="Dime el nombre que quieres ponerle, no necesito la extension. Si quieres crearlo en otra ruta, indicamela junto con el nombre, relativa o absoluta, acepto ambas "


rem Zona de direccionamiento
if %opcion%==1 goto txt
if %opcion%==2 goto bat


rem Zona de ejecución
:txt
type nul > %deseo%.txt
echo %deseo%.txt ha sido creado
echo Hora de despedirnos
pause
exit

:bat
type nul > %deseo%.bat
echo %deseo%.bat ha sido creado
echo Hora de despedirnos
pause
exit