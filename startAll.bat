@echo off
REM Set base directory where your projects are
set BASEDIR=C:\1_Arquivos\2_Pessoal\SummerSchool

REM 1. Open GUI in new terminal
start "GUI" cmd /k "cd /d %BASEDIR%\ai4industry2024-gui && startGUI 2"

REM 2. Start Node-RED in another terminal
start "Node-RED" cmd /k "npx node-red"

REM 3. Start your Flask API in another terminal
start "API" cmd /k "cd /d %BASEDIR%\startMASSimu && python runAPI.py"

exit