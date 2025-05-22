@echo off
if not exist "modules\" (
    echo [ERROR] 'modules' directory not found!
    goto :EOF
)
echo Available modules:
setlocal enabledelayedexpansion
set "foundModule=false"
for %%f in (modules\*.cmd) do (
    set "filename=%%~nf"
    echo - !filename!
    set "foundModule=true"
)
if not !foundModule! == true (
    echo [INFO] No modules found in 'modules\'.
)
endlocal