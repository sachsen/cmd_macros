@ECHO OFF
echo Macros Backup Automatically to OneDrive?
choice

if errorlevel 2 goto :no
if errorlevel 1 goto :yes

:yes
ECHO  Enter OneDriveFolderName:
SET INPUT_STR=
SET /P INPUT_STR=
 
IF "%INPUT_STR%"=="" GOTO :yes
set tf=true
set odpath=%INPUT_STR%
GOTO :regist

:no
set tf=false
set odpath=""

:regist
powershell -executionpolicy RemoteSigned -File %USERPROFILE%\cmd_macros\init.ps1 %tf% "%odpath%"
echo config file is created. 
echo if you want to change setting, see config.json.
echo Change Autorun value to "%USERPROFILE%\cmd_macros\macros.bat" or for Anaconda User: "%USERPROFILE%\cmd_macros\macros.bat" & if exist "%USERPROFILE%\Anaconda3\condabin\conda_hook.bat" "%USERPROFILE%\Anaconda3\condabin\conda_hook.bat"
reg add "HKCU\Software\Microsoft\Command Processor" /v "LastKey" /t REG_SZ /d "delete shitemo iiyo"
start regedit


notepad %USERPROFILE%\cmd_macros\macrolist.bat