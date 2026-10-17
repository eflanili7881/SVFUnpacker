@echo off
title SVF Unpacker v0.3-beta-win
goto menu

:menu
cls
echo ============================================================Menu========================================================
echo =                                                                                                                      =
echo =    1) Unpack SVF's                                                                                                   =
echo =    x) Exit                                                                                                           =
echo =                                                                                                                      =
echo ========================================================================================================================

set /p decisionMenu=Enter your decision: 

if %decisionMenu%==1 (
    call :setVar
    call :showVar
    call :expandSVF
    call :menu
)


if not "%decisionMenu%"=="1" if /i not "%decisionMenu%"=="x" (
    echo You entered an invalid option. Please press any key and press 1 or x to make a decision.
    pause
    goto menu
)

if /i %decisionMenu%==x  (
    call :exit
)

:setVar
cls
echo - Enter smv.exe binary path (.exe extension included):
echo -- In example: C:\smv.exe
echo -- If you leave this blank, it'll be set to C:\Program Files\SmartVersion\smv.exe.
set smvBinaryPath=C:\Program Files\SmartVersion\smv.exe
set /p smvBinaryPath=
echo ----------------------------------------------------------------------------------
echo - Enter folder path that contains your SVF files:
echo -- Be sure to your SVF folder path has no spaces in it.
echo -- Currently, folder recursion is not supported, but it'll be implemented.
set /p svfFilesPath=
echo ----------------------------------------------------------------------------------
echo - Enter source file path for your SVF files:
set /p sourceFilePath=
echo ----------------------------------------------------------------------------------
echo - Enter folder path for where you want to expand your files:
set /p destinationDirectoryPath=

exit /b

:showVar
cls
echo These values are set:
echo smv.exe file path: 
echo %smvBinaryPath%
echo Folder path to scan and expand SVF file(/-s):
echo %svfFilesPath%
echo Folder path to search source file(/-s):
echo %sourceFilePath%
echo Folder path to expanding SVF contents into:
echo %destinationDirectoryPath%
echo ----------------------------------------------------------------------
echo If these values are right, press any key on next prompt.
echo If these values are not right, close this script and run it again.
pause
exit /b

:expandSVF
cls
echo -===D Expanding SVFs to %destinationDirectoryPath% ...
cd /d "%destinationDirectoryPath%"
for %%a in ("%svfFilesPath%\*.svf") do (
    echo -=D Expanding %%a ...
    "%smvBinaryPath%" x %%a -br "%sourceFilePath%" *
)
pause
exit /b

:exit
exit