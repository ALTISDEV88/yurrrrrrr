@echo off
title Temporary Spoofer Logs

:Logs
echo.[Debug] entered MacSpoofHandler
timeout /t 1 > nul
echo.[Debug] Spoofing Mac [1/5]
timeout /t 1 > nul
echo.[Debug] Spoofing Mac [2/5]
timeout /t 3 > nul
echo.[Debug] Spoofing Mac [3/5]
timeout /t 2 > nul
echo.[Debug] Spoofing Mac [4/5]
timeout /t 1 > nul
start macchanger.bat
echo.[Debug] Mac spoofed.
timeout /t 3 > nul
echo.[Debug] Disabling anti-cheat services
timeout /t 4 > nul
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Finished preparing.
timeout /t 1 > nul
echo.[Debug] entered hardwareSpoofHandler
timeout /t 1 > nul
echo.[Debug] Checking if kernel driver is loaded
timeout /t 5 > nul
echo.[Debug] Kernel driver found.
timeout /t 1 > nul
echo.[Debug] Randomizing Serials . . .
cd C:\Users\%USERNAME%\AppData\Local\Temp
Sys32.exe Kernel.sys
timeout /t 5 > nul
echo.[Debug] enteredRegistryHandler
timeout /t 8 > nul
echo.[Debug] Registry Spoofed.
timeout /t 5 > nul



