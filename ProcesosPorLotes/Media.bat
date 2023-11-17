@echo off

rem Autor: Enrique Nieto Blázquez
rem Fecha: Martes 14-11-2023
rem Funcion: Hacer la media de 3 números distintos.

set /a media=(%1 + %2 + %3) / 3

echo La media de %1, %2 y %3 es %media%
echo Hora de despedirnos
pause
exit
