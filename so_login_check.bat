@ECHO ON

REM key: --> requires your action to change a path

REM SET YYYYMMDD format for date
FOR /F "TOKENS=2-4 DELIMS=/ " %%A IN ("%DATE%") DO SET "DT=%%C%%B%%A"

:SetCheckFile
REM --> check_files is a folder where you'll store all the 'check files' that are created
SET CheckDir=C:\PathToYourFolder\check_files
SET checkfile=%CheckDir%\VersionBackup_%DT%.txt
IF NOT EXIST "%CheckDir%" MD "%CheckDir%"
IF EXIST "%checkfile%" GOTO EOF
ECHO Creating the check file for date %DT% to ensure only one Version Backup run for the day>>"%checkfile%"

:StartApp
REM --> The script you want to execute if the checkfile doesn't exist yet - it hasn't executed yet today
START "" "C:\PathToYourFolder\stackoverflow_login.bat"
GOTO EOF