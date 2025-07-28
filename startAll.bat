@echo off

set BASEDIR=%~dp0

if "%BASEDIR:~-1%"=="\" set BASEDIR=%BASEDIR:~0,-1%

if "%GROUPNUM%"=="" set GROUPNUM=1

start "GUI" cmd /k "cd /d %BASEDIR%\IndustryGUI && startGUI %GROUPNUM%"

start "Node-RED" cmd /k "npx node-red"

start "API" cmd /k "cd /d %BASEDIR% && python runAPI.py %BASEDIR%"

exit
