@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "appname=Cassiru Toolkit"
set "appversion=1.0"

REM Main router
if "%~1"=="" (
    call scripts\usage.bat
    goto :EOF
)

if /i "%~1"=="help" (
    call scripts\help.bat
    goto :EOF
)

if /i "%~1"=="list" (
    call scripts\list.bat
    goto :EOF
)

if /i "%~1"=="interactive" (
    call scripts\interactive.bat
    goto :EOF
)

if /i "%~1"=="version" (
    echo %appname% %appversion%
    goto :EOF
)

REM Check if modules dir exists before running a module
if not exist "modules\" (
    echo [ERROR] 'modules' directory not found!
    goto :EOF
)

REM Run module by name
if exist "modules\%~1.cmd" (
    call "modules\%~1.cmd"
) else (
    echo [ERROR] Module '%~1' not found in 'modules\'!
    echo Use 'cassiru list' to see available modules.
)

:EOF
endlocal
exit /b
