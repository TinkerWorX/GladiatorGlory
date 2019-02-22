@echo off

if not exist environment.bat (
  @echo WARNING: environment.bat missing, generating default . . .
  copy "environment-base.bat" "environment.bat"
)

call clean.bat
call environment.bat

if "%gamepath%"=="" (
  @echo: ERROR: gamepath not configured
  @echo: Open up 'environment.bat' and add the path to your warcraft III installation like shown
  EXIT /B 1
)

@echo Building map . . .

set map=map.w3x

set input=src
set output=out

mkdir "%output%"
xcopy "%input%\%map%" "%output%"

cd %input%
@echo.
"..\tools\Mpq\mpq.exe" "%map%" "war3map.j" "..\%output%\war3map.j"
if %ERRORLEVEL% GEQ 1 EXIT /B 1
@echo.

@echo Merging objects . . .
"..\tools\Grimex\ObjectMerger.exe" "..\%output%\%map%" "" "objects.lua"
if %ERRORLEVEL% GEQ 1 EXIT /B 1
@echo.
@echo.

@echo Importing data . . . 
"..\tools\Grimex\FileImporter.exe" "..\%output%\%map%" "" "imports"
if %ERRORLEVEL% GEQ 1 EXIT /B 1
@echo.
@echo.

@echo Preprocessing map script . . .
"..\tools\mcpp\bin\mcpp.exe" -P -I1 "..\%input%\war3map.j" "..\%output%\war3map.processed.j"
if %ERRORLEVEL% GEQ 1 EXIT /B 1
@echo.

@echo Compiling map script . . .
IF "%gui%"=="true" (
  "..\tools\JassHelper\jasshelper.exe" "..\%input%\common.j" "..\%input%\blizzard.j" "..\%output%\war3map.processed.j" "..\%output%\%map%"
) ELSE (
  "..\tools\JassHelper\clijasshelper.exe" "..\%input%\common.j" "..\%input%\blizzard.j" "..\%output%\war3map.processed.j" "..\%output%\%map%"
)
if %ERRORLEVEL% GEQ 1 EXIT /B 1
@echo.

cd ..

@echo Finished building map . . .

@echo Moving logs . . .
MOVE /Y "%input%\logs" "logs"
@echo Finished moving logs . . .
@echo Moving backups . . .
MOVE /Y "%input%\backups" "backups"
@echo Finished moving backups . . .
IF "%pause%"=="true" (
    @pause
)