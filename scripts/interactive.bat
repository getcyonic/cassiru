@echo off
if not exist "modules\" (
    echo [ERROR] 'modules' directory not found!
    goto :EOF
)
echo.
echo === Cassiru Interactive Mode ===
echo Type the module name to run it, or type 'list' to see available modules.
echo Type 'help' for help or 'exit' to quit.
setlocal enabledelayedexpansion
:interactive_loop
set "usercmd="
set /p usercmd=cassiru : 
for /f "tokens=* delims= " %%a in ("!usercmd!") do set "usercmd=%%a"
if /i "!usercmd!"=="exit" (
    echo Exiting interactive mode.
    endlocal
    goto :EOF
)
if /i "!usercmd!"=="help" (
    call scripts\help.bat
    goto :interactive_loop
)
if /i "!usercmd!"=="list" (
    call scripts\list.bat
    goto :interactive_loop
)
if not defined usercmd (
    echo [INFO] Please enter a module name, 'list', 'help', or 'exit'.
    goto :interactive_loop
)
if exist "modules\!usercmd!.cmd" (
    call "modules\!usercmd!.cmd"
) else (
    echo [ERROR] Module '!usercmd!' not found. Type 'list' to see available modules.
)
goto :interactive_loop