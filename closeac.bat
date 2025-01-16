@echo off
@echo off
:: BatchGotAdmin
:-------------------------------------

REM --> Check for permissions
"%SYSTEMROOT%\system32\icacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting Admin...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
setlocal DisabledelayedExpansion
set "batchPath=%~f0"
setlocal EnabledelayedExpansion
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""!batchPath!"" %*", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"

title Deep Trace Cleaner
echo Administrative privileges granted.


REM --> kill shit
taskkill /f /im epicgameslauncher.exe > nul
taskkill /f /im EpicWebHelper.exe > nul
taskkill /f /im FortniteClient-Win64-Shipping_EAC.exe > nul
taskkill /f /im FortniteClient-Win64-Shipping_BE.exe > nul
taskkill /f /im FortniteLauncher.exe > nul
taskkill /f /im FortniteClient-Win64-Shipping.exe > nul
taskkill /f /im EpicGamesLauncher.exe > nul
taskkill /f /im EasyAntiCheat.exe > nul
taskkill /f /im BEService.exe > nul
taskkill /f /im BEServices.exe > nul
taskkill /f /im BattleEye.exe > nul
taskkill /f /im epicgameslauncher.exe >nul
taskkill /f /im FortniteClient-Win64-Shipping_EAC.exe >nul
taskkill /f /im FortniteClient-Win64-Shipping_BE.exe >nul
taskkill /f /im FortniteLauncher.exe >nul
taskkill /f /im OneDrive.exe >nul
taskkill /f /im FortniteClient-Win64-Shipping.exe >nul
taskkill /f /im UnrealCEFSubProcess.exe >nul
taskkill /f /im CEFProcess.exe >nul
taskkill /f /im EasyAntiCheat.exe >nul
taskkill /f /im BEService.exe >nul
taskkill /f /im BEServices.exe >nul
taskkill /f /im BattleEye.exe >nul
taskkill /f /im PerfWatson2.exe >nul
taskkill /f /im vgtray.exe >nul
taskkill /f /im smartscreen.exe >nul
taskkill /f /im EasyAntiCheat.exe >nul
taskkill /f /im dnf.exe >nul
taskkill /f /im CrossProxy.exe >nul
taskkill /f /im tensafe_1.exe >nul
taskkill /f /im tensafe_2.exe >nul
taskkill /f /im tencentdl.exe >nul
taskkill /f /im TenioDL.exe >nul
taskkill /f /im uishell.exe >nul
taskkill /f /im BackgroundDownloader.exe >nul
taskkill /f /im conime.exe >nul
taskkill /f /im QQDL.EXE >nul
taskkill /f /im qqlogin.exe >nul
taskkill /f /im dnfchina.exe >nul
taskkill /f /im dnfchinatest.exe >nul
taskkill /f /im txplatform.exe >nul
taskkill /f /im OriginWebHelperService.exe >nul
taskkill /f /im Origin.exe >nul
taskkill /f /im OriginClientService.exe >nul
taskkill /f /im OriginER.exe >nul
taskkill /f /im OriginThinSetupInternal.exe >nul
taskkill /f /im OriginLegacyCLI.exe >nul
taskkill /f /im Agent.exe >nul
taskkill /f /im Client.exe >nul
sc stop EasyAntiCheat >nul
sc stop FortniteClient-Win64-Shipping_EAC >nul
sc stop BattleEye >nul
sc stop FortniteClient-Win64-Shipping_BE >nul
sc stop faceit >nul

del /f /s /q /a "*.log" >nul
del /f /s /q /a "*.tmp" >nul
del /f /s /q /a "*.init" >nul
cls
echo.Complete
timeout /t 1 > nul
exit
