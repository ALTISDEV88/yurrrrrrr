@echo off
title Valen Temp Spoofer [DRIVERLESS BETA]

:Logs
timeout /t 1 > nu1
net stop winmgmt /y
timeout /t 2 > nu1

timeout /t 1 > nu1
taskkill /F /IM wmiprvse.exe
timeout /t 3 > nu1
cls
timeout /t 1 > nul
echo.[debug] Gathering System Components
timeout /t 2 > nul

timeout /t 1 > nu1
echo.[debug] Preparing was complete.
cls

timeout /t 1 > nu1
echo.[debug] Choosing driverless Spoof Method for your motherboard . . .
timeout /t 3 > nu1
start macchanger.bat
timeout /t 6 > nul
echo.[debug] method 3 chosen.
timeout /t 3 > nul

timeout /t 3 > nul
echo.[debug] Spoofing regirstry.
timeout /t 1 > nul
ipconfig /flushdns 
netsh int reset all 
netsh int ipv4 reset 
netsh int ipv6 reset 
netsh winsock reset
timeout /t 1 > nul
cls
echo.[debug] Success.
timeout /t 2 > nul
cls

echo.[debug] Spoofing identifiers
timeout /t 2 > nul

echo.[debug] Motherboard handler started.
timeout /t 4 > nul

echo.[debug] Process failed. (0x00001BE)
timeout /t 4 > nul

echo.[debug] Driverless Spoofing failed. ERROR CODE: 0x00001BE CAUSE? N/A
timeout /t 5 > nul
exit /b