@echo off

rem Autor: Enrique Nieto Blázquez
rem Fecha: Martes 14-11-2023
rem Funcion: Hacer la media de 3 números distintos.

set /a suma=%1 + %2 + %3
set /a division=%suma% / 3

rem La siguiente linea no es necesaria pero este cambio de nombres innecesario en favor de una mayor humanización del código, parece que gusta

set media = %division%

echo La media de %1, %2 y %3 es %media%