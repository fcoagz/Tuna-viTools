@echo off
title Tuna-viTools 
mode 75,30
:1p
cls
echo Hola %username%.                                           %date%
echo.
echo Tuna-viDS reproduce video que puede codificar con estas resoluciones:
echo. 
echo        1 - 256x192
echo        2 - 256x144 --- recomendado ---
echo.
echo        3 - Acerca de
echo        4 - Salir
echo.
choice /c:1234 /N /M "Escribe el caracter que corresponde:"

if "%ERRORLEVEL%"=="1" goto :2p
if "%errorlevel%"=="2" goto :3p
if "%errorlevel%"=="3" goto :4p
if "%errorlevel%"=="4" goto :5p

:2p
cls
echo -- RESOLUCION DE PANTALLA ACEPTADA --
echo.
echo        1 - Colocar nombre del archivo
echo        2 - vid_source -- predeterminado --
echo.
echo        3 - Salir
echo.
choice /c:123 /n /m "Escribe el caracter que corresponde:"

if "%errorlevel%"=="1" goto :namep
if "%errorlevel%"=="2" goto :namepp
if "%errorlevel%"=="3" goto :5p

:namep
cls
echo Coloca el nombre del archivo para comenzar con la conversion -- formato no es necesario --
echo.
echo        (nombre del archivo).mp4
echo.
set /p name= 

if "%name%"=="" goto namepro

:namepro
ffmpeg -i %name%.mp4 -f avi -r 10 -s 256x192 -b 192k -bt 64k -vcodec libxvid -deinterlace -acodec libmp3lame -ar 32000 -ab 96k -ac 2 %name%.avi

echo.
echo PROCESO COMPLETADO!
pause >nul
goto 1p

:namepp
ffmpeg -i vid_source.mp4 -f avi -r 10 -s 256x192 -b 192k -bt 64k -vcodec libxvid -deinterlace -acodec libmp3lame -ar 32000 -ab 96k -ac 2 tuna-vids.avi

echo.
echo PROCESO COMPLETADO!
pause >nul
goto 1p

:3p
cls
echo -- RESOLUCION DE PANTALLA ACEPTADA --
echo.
echo        1 - Colocar nombre del archivo
echo        2 - vid_source -- predeterminado --
echo.
echo        3 - Salir
echo.
choice /c:123 /n /m "Escribe el caracter que corresponde:"

if "%errorlevel%"=="1" goto :namep
if "%errorlevel%"=="2" goto :namepp
if "%errorlevel%"=="3" goto :5p

:namep
cls
echo Coloca el nombre del archivo para comenzar con la conversion -- formato no es necesario --
echo.
echo        (nombre del archivo).mp4
echo.
set /p name= 

if "%name%"=="" goto namepro

:namepro
ffmpeg -i %name%.mp4 -f avi -r 10 -s 256x144 -b 192k -bt 64k -vcodec libxvid -deinterlace -acodec libmp3lame -ar 32000 -ab 96k -ac 2 %name%.avi

echo.
echo PROCESO COMPLETADO!
pause >nul
goto 1p

:namepp
ffmpeg -i vid_source.mp4 -f avi -r 10 -s 256x144 -b 192k -bt 64k -vcodec libxvid -deinterlace -acodec libmp3lame -ar 32000 -ab 96k -ac 2 tuna-vids.avi

echo.
echo PROCESO COMPLETADO!
pause >nul
goto 1p

:4p
echo.
echo Tuna-viTools - version 0.1 - created by Francisco Griman - https://github.com/fcoagz
pause> nul 
goto 1p

:5p
exit