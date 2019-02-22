@echo off

@echo Cleaning up . . .

set output=out
set logs=logs
set backups=backups

if exist "%output%" rmdir /S /Q "%output%"
if exist "%logs%" rmdir/S /Q "%logs%"
if exist "%backups%" rmdir /S /Q "%backups%"

@echo Finished cleaning up . . .