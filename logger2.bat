@echo off
title Lite Temp Spoofer

:Logs
echo.[debug] Killing anti cheats. 
cd C:\Users\%USERNAME%\Appdata\Local\Temp
start closeac.bat
timeout /t 5 > nul
cls
timeout /t 1 > nul
echo.[debug] Gathering System Components
timeout /t 2 > nul
cls
echo.[debug] Spoofing Mac
timeout /t 1 > nul
start macchanger.bat
timeout /t 3> nul
cls
timeout /t 1 > nul
echo.[debug] Spoofing final serials
timeout /t 5 > nul
cd C:\Users\%USERNAME%\Appdata\Local\Temp
kdmapper_Release.exe Kernel.sys
timeout /t 2 > nul
cls



