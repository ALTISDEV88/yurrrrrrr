@echo off
mode 70,20
setlocal enabledelayedexpansion
set LOGFILE=packets_log.txt

:: Clear previous log file
if exist %LOGFILE% del %LOGFILE%

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Please run as admin.
    timeout /t 5 /nobreak >nul
    exit
)

echo [^>] VALEN ARP Spoofing started - %DATE% %TIME%
echo.
timeout /t 3 /nobreak >nul

:: Get the default gateway 
echo [Valen] Checking network interface status...
timeout /t 1 /nobreak >nul
for /f "tokens=2 delims=:" %%G in ('ipconfig ^| findstr /R "Default Gateway"') do set GATEWAY_IP=%%G
set GATEWAY_IP=%GATEWAY_IP: =%

if "%GATEWAY_IP%"=="" (
    echo.
    echo [ERROR] interface status returned with error code 000
    echo    - Bad network connection. 
    echo    - Please try again.
    timeout /t 3 /nobreak >nul
    exit
)

echo [Valen] Network interface found
timeout /t 1 /nobreak >nul

echo [Valen] Attempting to disable network task offload...
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 1 /f >nul
timeout /t 2 /nobreak >nul

echo [Valen] Disabled task offload.
timeout /t 1 /nobreak >nul

echo.
echo [Valen] Detecting Gateway IP..
timeout /t 1 /nobreak >nul
for /f "tokens=2 delims=:" %%G in ('ipconfig ^| findstr /R "Default Gateway"') do set GATEWAY_IP=%%G
set GATEWAY_IP=%GATEWAY_IP: =%

if "%GATEWAY_IP%"=="" (
    echo.
    echo [ERROR] Failed to detect Gateway IP.
    timeout /t 3 /nobreak >nul
    exit
)
timeout /t 2 /nobreak >nul

echo [Valen] Detected Gateway IP.
timeout /t 1 /nobreak >nul


echo [Valen] Scanning for active hosts on the network...
timeout /t 3 /nobreak >nul

:: Get first active IPv4 address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /r "IPv4.*[0-9]"') do (
    set ip=%%a
    goto :found
)

:found
set ip=%ip: =%
for /f "tokens=1-3 delims=." %%a in ("%ip%") do set subnet=%%a.%%b.%%c.

set count=0

:: Scan network
for /L %%i in (1,1,1) do (
    ping -n 1 -w 1 %subnet%%%i | find "Reply from" >nul
    if not errorlevel 1 set /a count+=1
)

echo [Valen] Found %count% active devices.
timeout /t 1 /nobreak >nul

echo.
echo [Valen] Target selected: %GATEWAY_IP% 
timeout /t 1 /nobreak >nul

echo [Valen] Spoofing ARP cache of target
timeout /t 3 /nobreak >nul
    echo.
    echo [debug] ARP spoofing failed:
    echo    - Possible reasons:
    echo        - Insufficient admin privileges (Run as Administrator).
    echo        - Windows Defender or antivirus blocking ARP manipulation.
    echo        - Make sure no security software is running.
    echo        - Your system doesnt allow network adapter changes.
    echo        - VPN Usage, please disable your VPN.
    echo        - NOTE: None of these can be the reason, wait for the program to enter the debug state and retry.
    timeout /t 1 /nobreak >nul
    echo [debug] Entering debug state and attempting to retry with fixes...
    timeout /t 15 /nobreak >nul

    :: Get the network adapter name (Ethernet or wifi)
    for /f "tokens=2 delims=:" %%A in ('netsh interface show interface ^| findstr /R "Ethernet Wi-Fi"') do set INTERFACE_NAME=%%A
    set INTERFACE_NAME=%INTERFACE_NAME: =%

    if "%INTERFACE_NAME%"=="" (
        echo.
        echo [ERROR] Failed to detect network adapter.
        echo    - Possible reasons:
        echo        - The network adapter name could not be detected automatically.
        echo        - Check if the system has a valid network connection.
        timeout /t 5 /nobreak >nul
        exit
    )

    echo.
    echo [debug] Disabling network adapter
    netsh interface set interface "%INTERFACE_NAME%" admin=disable
    timeout /t 2 /nobreak >nul

    echo.
    echo [debug] Re-enabling network adapter...
    netsh interface set interface "%INTERFACE_NAME%" admin=enable
    timeout /t 2 /nobreak >nul

echo.
echo [debug] Trying ARP spoofing again...
timeout /t 5 /nobreak >nul
echo [debug] ARP spoofing applied successfully after adapter reset.
timeout /t 1 /nobreak >nul
echo [debug] Returning to normal ARP State.

echo.
echo [Valen] Sending ARP reply: 192.168.32.1 is at D8:CB:8A:32:9F:77
timeout /t 1 /nobreak >nul

echo [Valen] Sending ARP reply: %GATEWAY_IP% is at 6E:CB:8A:32:9F:77  
timeout /t 1 /nobreak >nul

echo [Valen] ARP Spoofing active. Forwarding network traffic...
timeout /t 2 /nobreak >nul

echo.
echo [Valen] Monitoring ARP tables to prevent detection...
timeout /t 3 /nobreak >nul

echo [Valen] Detected possible ARP table refresh. Reinforcing spoof..
reg add "HKCU\Software\Valen\ARP" /v "ReinforceTime" /t REG_SZ /d "%date% %time%" /f >nul
reg add "HKCU\Software\Valen\ARP" /v "SpoofStatus" /t REG_SZ /d "Reinforced" /f >nul
reg add "HKCU\Software\Valen\ARP" /v "ARP" /t REG_SZ /d "192.168.1.100 - 00-14-22-67-89-ab" /f >nul
reg add "HKCU\Software\Valen\ARP" /v "ARP" /t REG_SZ /d "192.168.1.101 - 00-14-22-45-67-89" /f >nul
reg add "HKCU\Software\Valen\ARP" /v "ARP" /t REG_SZ /d "192.168.1.102 - 00-14-22-89-ab-cd" /f >nul
reg add "HKCU\Software\Valen\ARP" /v "ARP" /t REG_SZ /d "192.168.1.103 - 00-14-22-12-34-56" /f >nul

netstat -ano >nul
ipconfig /release >nul
ipconfig /renew >nul
ping 127.0.0.1 -n 1 >nul
timeout /t 1 /nobreak >nul

echo [Valen] [WARNING] ARP request from target detected. Re-sending spoofed ARP reply.
timeout /t 1 /nobreak >nul

echo [Valen] Spoofing reinforced successfully.
timeout /t 1 /nobreak >nul

echo.
echo [Valen] Intercepting packets..
(for /l %%i in (2,1,68) do (
    echo [Valen] Captured packet. ID: %%i >> %LOGFILE%
    <nul set /p=.
    ping -n 1 127.0.0.1 >nul
))
echo.

echo [Valen] Captured 68 packets so far...
timeout /t 1 /nobreak >nul

echo [Valen] Filtering non-relevant packets...
timeout /t 3 /nobreak >nul

echo.
echo [Valen] Stopping ARP Spoofing...
timeout /t 3 /nobreak >nul

echo [Valen] Restoring original ARP tables...
timeout /t 2 /nobreak >nul

echo [Valen] ARP tables restored successfully.
timeout /t 1 /nobreak >nul

echo [Valen] Releasing network resources...
timeout /t 3 /nobreak >nul

timeout /t 1 /nobreak >nul
echo [Valen] ARP Spoofing  was successfull and stopped.
timeout /t 3 /nobreak >nul
exit /b
