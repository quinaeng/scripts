rem @echo off

set FILE_SYSTEM="C:\"

wmic shadowcopy call create volume=%FILE_SYSTEM%

if %errorlevel% equ 0 (
	eventcreate /id 100 /L APPLICATION /t SUCCESS /D "shadowcopy is success."
) else (
	eventcreate /id 100 /L APPLICATION /t SUCCESS /D "shadowcopy is fail."
)

