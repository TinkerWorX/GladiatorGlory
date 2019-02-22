call build.bat
if %ERRORLEVEL% GEQ 1 EXIT /B 1
"%gamepath%" -loadfile "%~dp0out\map.w3x" %arguments%