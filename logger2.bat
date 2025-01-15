@echo off
title Lite Temp Spoofer

:Logs
echo.[Debug] entered startHandler
echo.[Debug] Disabling anti-cheat services
timeout /t 4 > nul
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
cd C:\Users\%USERNAME%\AppData\Local\Temp
start closeac.bat
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Disabling anti-cheat services
echo.[Debug] Finished preparing.
timeout /t 1 > nul
echo.[Debug] Gathering System Components
timeout /t 2 > nul
echo.[Debug] enteredMacHandler
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
timeout /t 2 > nul
echo.[Debug] enteredRegistryHandler
timeout /t 3 > nul
echo.[Debug] Registry Spoofed.
timeout /t 1 > nul
echo.[Debug] entering last spoofing stage...
timeout /t 1 > nul
echo.[Debug] Spoofing Final Hardware
cd C:\Users\%USERNAME%\AppData\Local\Temp
Sys32.exe Kernel.sys
timeout /t 5 > nul
echo.[Debug] enteredRegistryHandler
timeout /t 8 > nul
echo.[Debug] Registry Spoofed.
timeout /t 5 > nul



