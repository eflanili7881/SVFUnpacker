@echo off
echo SVF Unpacker v0.2
echo Enter smv.exe binary path (.exe file included):
echo In example: C:\smv.exe
set /p smvbinarypath=
echo Enter SVF path:
set /p svfpath=
echo Enter SourceISO path:
set /p sourceisopath=
echo Enter DestinationDIR path:
set /p destinationdirpath=
echo Expanding SVFs ...
cd /d "%destinationdirpath%"
for %%a in ("%svfpath%\*.svf") do "%smvbinarypath%" x %%a -br "%sourceisopath%" *
pause
