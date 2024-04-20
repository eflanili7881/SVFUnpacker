@echo off
echo SVF Unpacker v0.1
echo Enter SVF path:
set /p svfpath=
echo Enter SourceISO path:
set /p sourceisopath=
echo Enter DestinationDIR path:
set /p destinationdirpath=
echo Expanding SVFs ...
cd /d "%destinationdirpath%"
for %%a in ("%svfpath%\*.svf") do "C:\Program Files\SmartVersion\smv.exe" x %%a -br "%sourceisopath%" *
pause