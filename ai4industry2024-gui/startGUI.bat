@echo off
setlocal enabledelayedexpansion

:: Check for correct number of arguments
IF "%~1"=="" (
    echo Usage: start_gui.bat [groupNumber 1-8]
    exit /b 1
)

SET groupNumber=%~1

:: Validate group number (only allow 1-8)
IF NOT "%groupNumber%"=="1" IF NOT "%groupNumber%"=="2" IF NOT "%groupNumber%"=="3" IF NOT "%groupNumber%"=="4" IF NOT "%groupNumber%"=="5" IF NOT "%groupNumber%"=="6" IF NOT "%groupNumber%"=="7" IF NOT "%groupNumber%"=="8" (
    echo Error: Group number must be between 1 and 8.
    exit /b 1
)

echo Starting GUI with simu %groupNumber%...

:: Start Spring Boot backend
cd ai4industry-gui-spring
start "" cmd /c gradlew.bat bootRun
cd ..

:: Start React frontend
cd ai4industry-gui-react

:: Install dependencies
call npm install --legacy-peer-deps
IF ERRORLEVEL 1 (
    echo NPM install failed.
    exit /b 1
)

:: Set .env variable
echo REACT_APP_SIMU=%groupNumber% > .env

:: Start the React app
call npm start

endlocal
