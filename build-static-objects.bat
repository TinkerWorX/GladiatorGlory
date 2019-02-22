@echo off

call environment.bat

set map=map.w3x

set input=src

cd %input%

@echo Building static objects . . .
"..\tools\Grimex\ObjectMerger.exe" "..\%input%\%map%" "" "static-objects.lua"
if %ERRORLEVEL% GEQ 1 EXIT /B 1
@echo.
@echo.

@echo Finished building static objects . . .
