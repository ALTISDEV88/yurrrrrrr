@echo off
title Valen Temp Spoofer

:Logs
echo.[debug] Preparing stage 1 . . .
timeout /t 1 > nu1
net stop winmgmt /y
timeout /t 2 > nu1
cls
timeout /t 1 > nu1
taskkill /F /IM wmiprvse.exe
timeout /t 3 > nu1
cls
echo.[debug] Preparing stage 1 was complete.
timeout /t 2 > nu1
cls
echo.[debug] Preparing stage 2 . . .
timeout /t 1 > nu1
echo.[debug] Killing anti cheats. 
cd C:\Users\%USERNAME%\Appdata\Local\Temp
start closeac.bat
timeout /t 5 > nul
cls
timeout /t 1 > nul
echo.[debug] Gathering System Components
timeout /t 2 > nul
cls
timeout /t 1 > nu1
echo.[debug] Preparing was complete.
cls
timeout /t 1 > nu1
echo.[debug] Entered Spoof Stage.
timeout /t 1 > nu1
echo.[debug] Spoofing Mac
timeout /t 1 > nul
start macchanger.bat
timeout /t 6> nul
echo.[debug] Success.
cls
timeout /t 3 > nul
echo.[debug] Spoofing regirstry
timeout /t 1 > nul
ipconfig /flushdns >nul
netsh int reset all >nul
netsh int ipv4 reset >nul
netsh int ipv6 reset >nul
netsh winsock reset >nul
timeout /t 1 > nul
echo.[debug] Success.
timeout /t 2 > nul
cls
echo.[debug] Spoofing identifiers . . .
cd C:\Users\%USERNAME%\Appdata\Local\Temp
cls
kdmapper_Release.exe Kernel.sys
timeout /t 2 > nul
cls



