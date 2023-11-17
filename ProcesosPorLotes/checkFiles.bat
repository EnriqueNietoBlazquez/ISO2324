@echo off

rem Funcion: Comprobar la existencia de un fichero y si no existe crearlo, una y otra vez hasta que pueda crear uno
rem Nombre: Enrique Nieto Blázquez
rem Fecha: Viernes 17-11-2023



title Comprobacion de ficheros
goto Inicio

:Inicio
set /p name=Dime el nombre de un fichero, incluye su extension y ruta, la ruta me da igual si absoluta o relativa, si el fichero esta en el mismo sitio que donde esta este script, no hace falta que me la ponga: 

if exist %name% (
	echo El fichero %name% existe
	echo;
	goto Repetir
)else (
	goto Fin
)

:Repetir
set /p name=Dime el nombre de otro, repetire el proceso hasta que me digas uno que no existe: 

if exist %name% (
	echo El fichero %name% tambien existe
	echo;
	goto Repetir
)else (
	goto Fin
)

:Fin
type nul > %name%
echo El fichero %name% no existia pero ahora si
echo Preparado para salir?
pause
exit