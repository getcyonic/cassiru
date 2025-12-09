:: Cassiru Install Package Script
:: Usage: ipkg.bat package_name package_manager

@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ====================================================
    echo   ERROR: This script must be run as Administrator.
    echo ====================================================
    pause
    exit /b 1
)

set "script_name=%~nx0"

:: Checking arguments
if "%~1"=="" (
    echo Usage: %script_name% package_name package_manager
    echo Supported managers: winget, choco
    exit /b 1
)

if "%~2"=="" (
    echo Error: You must specify the package manager.
    echo Example: %script_name% node winget
    exit /b 1
)

set PKG=%~1
set MANAGER=%~2

echo ================================
echo Package: %PKG%
echo Package Manager: %MANAGER%
echo ================================

:: Check if command exists
where %MANAGER% >nul 2>&1
if %errorlevel% neq 0 (
    echo Package manager %MANAGER% was not found.
    echo Installing...

    if /I "%MANAGER%"=="winget" (
        echo Winget usually comes preinstalled on Windows 10/11.
        echo If it's missing, install/update "App Installer" from Microsoft Store.
        pause
        exit /b 1
    )

    if /I "%MANAGER%"=="choco" (
        echo Installing Chocolatey...
        powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process; [System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex"
    )
)

echo Package manager found/installed successfully!
echo Installing package %PKG%...

:: ---------------------------
:: INSTALL PACKAGE
:: ---------------------------
if /I "%MANAGER%"=="winget" (
    winget install %PKG% --silent --accept-package-agreements --accept-source-agreements
    exit /b
)

if /I "%MANAGER%"=="choco" (
    choco install %PKG% -y
    exit /b
)

echo ERROR: Unsupported package manager "%MANAGER%"!
exit /b 1
