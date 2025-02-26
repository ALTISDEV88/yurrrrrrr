@echo
:: BatchGotAdmin
:-------------------------------------

REM --> Check for permissions
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

title Valen deep clean
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting Admin...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"



reg delete "HKEY_CURRENT_USER\Software\Microsoft\Direct3D" /v WHQLClass /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping_EAC.exe:  B1 8A B0 E9 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\EasyAntiCheat\EasyAntiCheat_Setup.exe:  73 D5 4B 11 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe:  E7 CB 84 E9 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f"
reg delete "HKU\.Dreg delete "HKEY_CURRENT_USER\Software\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine" /f
reg delete "HKEY_CURRENT_USER\Software\WOW6432Node\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\com.epicgames.launcher" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\EpicGames" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Description: "Provides integrated security and services for online multiplayer games."" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat\GamesInstalled: "217;"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Type: 0x00000010" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Start: 0x00000003" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ErrorControl: 0x00000001" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ImagePath: ""%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe""" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\DisplayName: "EasyAntiCheat"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\WOW64: 0x0000014C" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f"
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security" /f"
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Type: 0x00000010" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Start: 0x00000003" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\ErrorControl: 0x00000001" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\ImagePath: ""%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe""" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\DisplayName: "EasyAntiCheat"" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\WOW64: 0x0000014C" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\ObjectName: "LocalSystem"" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Description: "Provides integrated security and services for online multiplayer games. /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d  r%random% /f >nul 2>&1
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d  r%random% /f >nul 2>&1
@REG ADD HKLM\SYSTEM\HardwareConfig /v LastConfig /t REG_SZ /d {be%random%} /f >nul 2>&1
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v HwProfileGuid /t REG_SZ /d {fefefee%random%-%random%-%random%-%random%} /f >nul 2>&1
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v GUID /t REG_SZ /d {fefefe%random%-%random%-%random%-%random%} /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v BuildGUID /t REG_SZ /d  r%random% /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOwner /t REG_SZ /d  r%random% /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOrganization /t REG_SZ /d  r%random% /f >nul 2>&1
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\SystemInformation /v ComputerHardwareId /t REG_SZ /d {randomd%random%-%random%-%random%-%random%} /f >nul 2>&1
@REG ADD HKLM\SYSTEM\HardwareConfig /v LastConfig /t REG_SZ /d {BE%random%} /f >nul 2>&1
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v HwProfileGuid /t REG_SZ /d {%random%-%random%-%random%-%random%} /f >nul 2>&1
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v GUID /t REG_SZ /d {%random%-%random%-%random%-%random%} /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v BuildGUID /t REG_SZ /d %random% /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOwner /t REG_SZ /d %random% /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOrganization /t REG_SZ /d %random% /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v ProductId /t REG_SZ /d %random%-%random%-%random%-%random% /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v InstallDate /t REG_SZ /d %random% /f >nul 2>&1
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\SystemInformation /v ComputerHardwareId /t REG_SZ /d {%random%-%random%-%random%-%random%} /f >nul 2>&1
@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\Tracing\Microsoft\Profile\Profile /v Guid /t REG_SZ /d %random%-%random%-%random%-%random% /f >nul 2>&1
@reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f >nul 2>&1
@reg delete "HKEY_CURRENT_USER\Software\WOW6432Node\Epic Games" /f >nul 2>&1
@reg delete "HKEY_CURRENT_USER\Software\Classes\com.epicgames.launcher" /f >nul 2>&1
@reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Hardware Survey" /f >nul 2>&1
@reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Identifiers" /f >nul 2>&1
@reg delete "HKEY_CLASSES_ROOT\com.epicgames.launcher" /f >nul 2>&1
@reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\com.epicgames.launcher" /f >nul 2>&1
@reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Epic Games" /f >nul 2>&1
@reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\EpicGames" /f >nul 2>&1
@reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames" /f >nul 2>&1
@reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Epic Games" /f >nul 2>&1
@reg delete "HKEY_CURRENT_USER\SOFTWARE\Epic Games" /f >nul 2>&1
@reg delete "HKEY_CURRENT_USER\SOFTWARE\EpicGames" /f >nul 2>&1
@REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v InstallDate /t REG_SZ /d %random% /f >nul 2>&1
@REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v ProductId /t REG_SZ /d %random% /f >nul 2>&1
@REG ADD HKLM\System\CurrentControlSet\Control\SystemInformation /v ComputerHardwareId /t REG_SZ /d %random% /f >nul 2>&1
@REG ADD HKLM\System\CurrentControlSet\Control\WMI\Security /v 671a8285-4edb-4cae-99fe-69a15c48c0bc /t REG_SZ /d %random% /f >nul 2>&1
@reg delete "HKEY_LOCAL_MACHINE\SYSTEM\HardwareConfig" /f >nul 2>&1
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d TS-eac%random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d TS-%random% /f
REG ADD HKLM\SYSTEM\HardwareConfig /v LastConfig /t REG_SZ /d {eac%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v HwProfileGuid /t REG_SZ /d {TS-%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v GUID /t REG_SZ /d {TS-%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v BuildGUID /t REG_SZ /d TS-%random% /f
@reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d %random% /f
reg delete"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\WMI\Security\" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Hardware Survey" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Identifiers" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\HardwareConfig" /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v BIOSVendor /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v BIOSReleaseDate /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v SystemProductName /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v SystemManufacturer /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0" /v ProcessorNameString /f
reg delete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control" /v SystemStartOptions /f

del "C:\Windows\prefetch\CLEANER.EXE-08C569E3.pf",
del "C:\Windows\prefetch\RUNTIMEBROKER.EXE-4551A062.pf",
del "C:\Windows\prefetch\TOOL.EXE-7A8EFD97.pf",
del "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\FB0D848F74F70BB2EAA93746D24D9749",
del "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\77EC63BDA74BD0D0E0426DC8F8008506",
del "C:\System Volume Information\IndexerVolumeGuid",
del "C:\System Volume Information\tracking.log",
del "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\77EC63BDA74BD0D0E0426DC8F8008506",
del "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\FB0D848F74F70BB2EAA93746D24D9749",
del "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData",
del "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content",
del "C:\Windows\Logs\CBS\CBS.log",
del "C:\Windows\INF\bthpan.PNF",
del "C:\Windows\INF\netathr10x.PNF",
del "C:\Windows\INF\netsstpa.PNF",
del "C:\Windows\INF\netavpna.PNF",
del "C:\Windows\INF\E2XW10~1.PNF",
del "C:\Windows\INF\e2xw10x64.PNF",
del "C:\Windows.old\Users\All Users\Microsoft\Search\Data\Applications\Windows\edb0004C.jtx",
del "C:\Windows.old\Users\All Users\Microsoft\Search\Data\Applications\Windows\edbtmp.jtx",
del "C:\Windows.old\Users\All Users\Microsoft\Search\Data\Applications\Windows\edb0004D.jtx",
del "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache",
del "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\edb.jcp",
del "C:\Users\All Users\Microsoft\Search\Data\Applications\Windows\edb.jcp",
del "C:\Windows.old\Users\All Users\Microsoft\Search\Data\Applications\Windows\edb.jcp",
del "C:\Users\All Users\Microsoft\Search\Data\Applications\Windows\Projects\SystemIndex\PropMap\CiPT0000.000",
del "C:\Windows.old\Users\All Users\Microsoft\Search\Data\Applications\Windows\Projects\SystemIndex\PropMap\CiPT0000.000",
del "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\CacheStorage\CACHES~1.JFM",
del "C:\Windows\prefetch\WERMGR.EXE-F439C551.pf",
del "C:\Windows\INF\Zenonite.clr",
del "C:\Windows\INF\monitor.PNF",
del "C:\Windows\INF\netvwifimp.PNF",
del "C:\Windows\INF\msports.PNF",
del "C:\Windows\INF\wmiacpi.PNF",
del "C:\Windows\INF\iaLPSS2i_GPIO2_SKL.PNF",
del "C:\Windows\INF\intelpep.PNF",
del "C:\Windows\INF\ndisvirtualbus.PNF",
del "C:\Windows\INF\rdpbus.PNF",
del "C:\Windows\INF\usbxhci.PNF",
del "C:\Windows\System32\wbem\repository\MAPPING1.MAP",
del "C:\Windows\prefetch\WMIPRVSE.EXE-39F97B2D.pf",
del "C:\Windows\System32\wbem\repository\WRITABLE.TST",
del "C:\Windows\prefetch\IPCONFIG.EXE-10A15CF4.pf",
del "C:\Windows\prefetch\CONHOST.EXE-0C6456FB.pf",
del "C:\Windows\prefetch\SVCHOST.EXE-117C4441.pf",
del "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\V01.chk",
del "C:\Users\%username%\AppData\Local\NordVPN\logs\app-2019-12-09.nwl",
del "C:\Windows\prefetch\SVCHOST.EXE-FC689811.pf",
del "C:\Windows\prefetch\RUNDLL32.EXE-AAE32C77.pf",
del "C:\Windows\prefetch\NETSH.EXE-8174DA63.pf",
del "C:\Users\%username%\AppData\Local\Microsoft\Feeds",
del "C:\Windows\prefetch\TASKKILL.EXE-0ECD41EC.pf",
del "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\WEBCAC~1.JFM",
del "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\WEBCAC~1.DAT",
del "C:\Windows\INF\netrasa.PNF",
del "C:\Windows\prefetch\CMD.EXE-6D6290C5.pf",
del "C:\Windows\prefetch\FINDSTR.EXE-5986D423.pf",
del "C:\Windows\prefetch\WMIC.EXE-311B5CB4.pf",
del "C:\Windows\prefetch\reg.EXE-0AC99A87.pf",
del "C:\Windows\prefetch\SVCHOST.EXE-C5837514.pf",
del "C:\Windows\prefetch\WMIPRVSE.EXE-E8B8DD29.pf",
del C:\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav*.*
del C:\Users\Public\Libraries\collection.dat*.*
del C:\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat*.*
del C:\Users\%username%\AppData\Local\Microsoft\Feeds:KnownSources*.*
del C:\Recovery\ntuser.sys*.*
del C:\Users\%username%\AppData\Local\AC\INetCookies\ESE\container.dat*.*
del C:\Users\%username%\AppData\Local\Packages\Settings\settings.dat*.*
del C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini*.*
del C:\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\CacheAccess.json*.*
del C:\Users\%username%\AppData\Local\Microsoft\OneDrive\logs\Common\DeviceHealthSummaryConfiguration.ini*.*
del C:\ProgramData\Microsoft\Windows\DeviceMetadataCache\dmrc.idx*.*
del C:\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore\edb.log*.*
del C:\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\remotemetastore\v1\edb.log*.*
del C:\Users\%username%\ntuser.ini*.*
del C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\container.dat*.*
del C:\System Volume Information\tracking.log*.*
del C:\System Volume Information\WPSettings.dat*.*

del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\*.*"
del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\lockfile"
del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\BrowserMetrics\*.*"
del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\*.*"

del /s /f /a:h /a:a /q "%systemdrive%\Recovery\ntuser.sys\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\Public\Libraries\collection.dat\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Feeds\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\NetworksCache\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\Rules\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\History\History.IE5\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Speech Graphics\Carnival\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\Content.IE5\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCookies\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.jfm\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\AppCache\YVV2MEXU\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\Microsoft\CryptnetUrlCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetHistory\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\TempState\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat\*.*
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\DeviceMetadataCache\dmrc.idx\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Internet Explorer\CacheStorage\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\AMD\CNext\CCCSlim\*.*
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\XboxLive\NSALCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\PlaceholderTileLogoFolder\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Prefetch\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\*.*
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Diagnosis\EventStore.db-wal\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\perfc009.dat\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\perfh009.dat\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\PerfStringBackup.TMP\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\PerfStringBackup.INI\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\ntuser.dat.LOG2\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\Settings\settings.dat.LOG1\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\wbem\Performance\WmiApRpl.ini\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\TEMP\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\WDI\LogFiles\StartupInfo\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\Gms.log\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\spp\store\2.0\cache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\USOShared\Logs\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.ZuneVideo_8wekyb3d8bbwe\LocalState\Database\anonymous\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WER\ERC\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\remotemetastore\v1\edb.log\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore\edb.log\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\Unistore\data\3\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\Unistore\data\temp\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AppData\User\Default\Indexed DB\edb.log\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore\meta.edb\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\b05132b02959bc64.automaticDestinations-ms\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\appcompat\Programs\Amcache.hve\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\LogFiles\WMI\RtBackup\EtwRTGraphicsPerfMonitorSession.etl\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\Recovery\Active\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\#!002\MicrosoftEdge\User\Default\AppCache\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\Autom\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\rescache\_merged\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\ntuser.dat.LOG1\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\ntuser.dat.LOG2\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\settings\Personal\logUploaderSettings_temp.ini\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\settings\Personal\logUploaderSettings.ini\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\sru\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\logs\Common\DeviceHealthSummaryConfiguration.ini\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\XboxLive\AuthStateCache.dat\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\BBI.LOG1\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\BBI.LOG2\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\DEFAULT.LOG2\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\MoSetup\UpdateAgent.log\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\PostRebootEventCache.V2\{323558A6-0300-4C3E-97A0-EDEDFEB96B00}.bin\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\TempState\CortanaUnifiedTileModelCache.dat\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\LogFiles\WMI\RtBackup\EtwRTGraphicsPerfMonitorSession.etl\*.*" >nul 2>&1


del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\Unistore\data\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\UnistoreDB\USS.jtx\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Feeds\*.*" >nul 2>&1\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.XboxGameOverlay_1.42.4001.0_x64__8wekyb3d8bbwe\ActivationStore.dat\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.SkypeApp_kzf8qxf38zg5c\LocalState\DiagOutputDir\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceState\EventLog\Data\lastalive0.dat\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG2\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG1\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\WindowsUpdate.log\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\DataStore.edb\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs\edb.log\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\Safety\edge\remote\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\Settings\settings.dat.LOG1\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\DEFAULT.LOG2\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\SYSTEM.LOG2\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\appcompat\appraiser\AltData\Appraiser_Data.ini\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\dosvcState.dat.LOG1\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\appcompat\Programs\Amcache.hve.LOG1\*.*
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\ClipSVC\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\CloudStore\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-GB_17763.9.22.0_neutral__8wekyb3d8bbwe\Windows\System32\driverstore\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\CBS\CBS.log\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\History\History.IE5\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\logs\Common\DeviceHealthSummaryConfiguration.ini\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\MoSetup\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\edb.log\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\AMD\DxCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCookies\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG1\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\LogFiles\WMI\LwtNetLog.etl\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\ntuser.dat.LOG1\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Notepad++\backup\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\temp\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\INF\*.*
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\LocalCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\LocalState\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\BBI.LOG2\*.*
del /f /s /q "%systemdrive%\Users\Public\Shared Files\*.*"
del /f /s /q "%systemdrive%\Windows\DeliveryOptimization\*.*"
del /f /s /q "%systemdrive%\Windows\INF\WmiApRpl\WmiApRpl.ini\*.*"
del /f /s /q "%systemdrive%\Windows\Logs\CBS\*.*"
del /f /s /q "%systemdrive%\Windows\Logs\WindowsUpdate\*.*"
del /f /s /q "%systemdrive%\Windows\Prefetch\*.*"
del /f /s /q "%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*.*"
del /f /s /q "%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*"
del /f /s /q "%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*"
del /f /s /q "%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\Temp\*.*"
del /f /s /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\*.*"
del /f /s /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs\*.*"
del /f /s /q "%systemdrive%\Windows\SoftwareDistribution\ReportingEvents.log\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\History\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\*.*"
del /f /s /q "%systemdrive%\Windows\System32\LogFiles\WMI\RtBackup\*.*"
del /f /s /q "%systemdrive%\Windows\System32\LogFiles\WMI\RtBackup\EtwRTGraphicsPerfMonitorSession.etl\*.*"
del /f /s /q "%systemdrive%\Windows\System32\LogFiles\WMI\Wifi.etl\*.*"
del /f /s /q "%systemdrive%\Windows\System32\PerfStringBackup.INI\*.*"
del /f /s /q "%systemdrive%\Windows\System32\PerfStringBackup.TMP\*.*"
del /f /s /q "%systemdrive%\Windows\System32\SMI\Store\Machine\*.*"
del /f /s /q "%systemdrive%\Windows\System32\SMI\Store\Machine\SCHEMA.DAT{1c3790dc-b8ad-11e8-aa21-e41d2d101530}.TxR.0.regtrans-ms\*.*"
del /f /s /q "%systemdrive%\Windows\System32\SMI\Store\Machine\SCHEMA.DAT{1c3790dc-b8ad-11e8-aa21-e41d2d101530}.TxR.1.regtrans-ms\*.*"
del /f /s /q "%systemdrive%\Windows\System32\SMI\Store\Machine\SCHEMA.DAT{1c3790dc-b8ad-11e8-aa21-e41d2d101530}.TxR.2.regtrans-ms\*.*"
del /f /s /q "%systemdrive%\Windows\System32\SMI\Store\Machine\SCHEMA.DAT{1c3790dc-b8ad-11e8-aa21-e41d2d101530}.TxR.blf\*.*"
del /f /s /q "%systemdrive%\Windows\System32\SleepStudy\*.*"
del /f /s /q "%systemdrive%\Windows\System32\Tasks\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTask\*.*"
del /f /s /q "%systemdrive%\Windows\System32\Tasks\Microsoft\Windows\Windows Error Reporting\QueueReporting\*.*"
del /f /s /q "%systemdrive%\Windows\System32\Tasks\Microsoft\Windows\WindowsUpdate\Scheduled Start\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\BBI.LOG2\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\COMPONENTS{1c379064-b8ad-11e8-aa21-e41d2d101530}.TM.blf\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\COMPONENTS{1c379064-b8ad-11e8-aa21-e41d2d101530}.TMContainer00000000000000000001.regtrans-ms\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\COMPONENTS{1c379064-b8ad-11e8-aa21-e41d2d101530}.TMContainer00000000000000000002.regtrans-ms\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\DEFAULT.LOG1\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\SYSTEM.LOG2\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\*.*"
del /f /s /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\XboxLive\*.*"
del /f /s /q "%systemdrive%\Windows\System32\perfc009.dat\*.*"
del /f /s /q "%systemdrive%\Windows\System32\perfh009.dat\*.*"
del /f /s /q "%systemdrive%\Windows\System32\spp\store\2.0\cache\cache.dat\*.*"
del /f /s /q "%systemdrive%\Windows\System32\sru\*.*"
del /f /s /q "%systemdrive%\Windows\System32\wbem\Repository\INDEX.BTR\*.*"
del /f /s /q "%systemdrive%\Windows\System32\wbem\Repository\MAPPING3.MAP\*.*"
del /f /s /q "%systemdrive%\Windows\System32\wbem\Repository\OBJECTS.DATA\*.*"
del /f /s /q "%systemdrive%\Windows\System32\winevt\Logs\*.*"
del /f /s /q "%systemdrive%\Windows\Temp\*.*"
del /f /s /q "%systemdrive%\Windows\WinSxS\ManifestCache\*.*"
del /f /s /q "%systemdrive%\Windows\WindowsUpdate.log\*.*"
del /f /s /q "%systemdrive%\Windows\appcompat\Programs\Amcache.hve.LOG2\*.*"
del /f /s /q "%systemdrive%\Windows\appcompat\appraiser\AltData\*.*"
del /f /s /q "%systemdrive%\pagefile.sys\*.*"
del /f /s /q "C:\$recycle.bin"
del /f /s /q "C:\Amd\*.*"
del /f /s /q "C:\Intel\*.*"
del /f /s /q "C:\Intel\Setup.cache"
del /f /s /q "C:\MSOCache"
del /f /s /q "C:\MSOCache\*.*"
del /f /s /q "C:\PerfLogs\collections.dat"
del /f /s /q "C:\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\LMS\Manifest.sav"
del /f /s /q "C:\Recovery\*.*"
del /f /s /q "C:\Users\%USERNAME%\AppData\Local\Microsoft\Feeds Cache\*.*"
del /f /s /q "C:\Users\%USERNAME%\AppData\Local\Microsoft\Feeds"
del /f /s /q "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\IE\*.*"
del /f /s /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\*.*"
del /f /s /q "C:\Users\%username%\AppData\Local\FortniteGame\*.*"
del /f /s /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav\*.*"
del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\Feeds Cache\*.*"
del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\Feeds"
del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\Feeds\*.*"
del /f /s /q "C:\Users\Public\*.*"
del /f /s /q "C:\Users\Public\Libraries\*.*"
del /f /s /q "C:\Users\Public\Libraries\collection.dat"
del /f /s /q "C:\Users\Public\Shared Files"
del /f /s /q "C:\Windows\Logs\*.*"
del /f /s /q "C:\Windows\Prefetch\*.*"
del /f /s /q "C:\Windows\SoftwareDistribution\DataStore\*.*"
del /f /s /q "C:\Windows\System32\drivers\storage.cache"
del /f /s /q "C:\Windows\Temp\*.*"
del /f /s /q "C\Windows\Temp*.*"
del /f /s /q "D:\$recycle.bin"
del /f /s /q "D:\MSOCache\*.*"
del /f /s /q "D:\MSOCache\Setup.dat"
del /f /s /q "D:\MSOCache\guid\Setup.dat"
del /f /s /q "D:\Recovery\*.*"
del /f /s /q "D:\Recovery\ntuser.sys"
del /f /s /q "E:\MSOCache\*.*"
del /f /s /q "E:\Recovery\*.*"
del /f /s /q "F:\MSOCache\*.*"
del /f /s /q "F:\Recovery\*.*"
del /f /s /q "c:\recovery\ntuser.sys"
del /f /s /q "c:\users\public\shared files\"
del /f /s /q %systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\*
del /f /s /q %systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\IE\*
del /f /s /q C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\*
del /f /s /q C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\IE\*
del /q /s "C:\Users\%username%\AppData\Local\Microsoft\Feeds"
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\EpicGamesLauncher\ >nul 2>&1
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\FortniteGame\ >nul 2>&1
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\Microsoft\Feeds\ >nul 2>&1
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\Temp\338e89b.tmp >nul 2>&1
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\UnrealEngineLauncher\ >nul 2>&1
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\UnrealEngine\ >nul 2>&1
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\roaming\EasyAntiCheat >nul 2>&1
del /s /f /a:h /a:a /q C:\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat >nul 2>&1
del /s /f /a:h /a:a /q C:\Recovery\ntuser.sys >nul 2>&1
del /s /f /a:h /a:a /q C:\Windows\Temp\*.* >nul 2>&1
del /s /f /a:h /a:a /q C:\Windows\prefetch\*.* >nul 2>&1
del /s /f /q "%SysteDrive%\Temp"\*.*
del /s /f /q "%USERPROFILE%\Cookies"\*.*
del /s /f /q "%USERPROFILE%\Local SettingsA\History"\*.*
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*
del /s /f /q "%USERPROFILE%\Recent"\*.*
del /s /f /q %USERPROFILE%\appdata\local\temp\*.*
del /s /f /q %temp%\*.*
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q %userprofile%\Recent\*.* >nul 2>&1
del /s /f /q %windir%\Prefetch\*.*
del /s /f /q %windir%\system32\dllcache\*.*
del /s /f /q %windir%\temp\*.*
del /s /f /q C:\Windows\Prefetch\*.*
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1
del /s /f /q C:\Windows\Public\Libraries\*.*
del /s /f /q C:\Windows\Temp\*.*
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
del /s /q   C:\Users\%USERNAME%\AppData\Local\Microsoft\Feeds
del /s /q  "C:\Users\%Username%\AppData\Local\BattlEye" do rmdir "%%p"
del /s /q  "C:\Users\%Username%\AppData\Local\CEF" do rmdir "%%p"
del /s /q  "C:\Users\%Username%\AppData\Local\Comms" do rmdir "%%p"
del /s /q  "C:\Users\%Username%\AppData\Local\ConnectedDevicesPlatform" do rmdir "%%p"
del /s /q  "C:\Users\%Username%\AppData\Local\CrashDumps" do rmdir "%%p"
del /s /q  "C:\Users\%Username%\AppData\Local\CrashReportClient" do rmdir "%%p"
del /s /q  "C:\Users\%Username%\AppData\Local\D3DSCache" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\DBG" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\EpicGamesLauncher" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\FortniteGame" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\Microsoft\Feeds" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\PlaceholderTileLogoFolder" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\Programs\Common" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\Publishers" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\Speech Graphics" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\Temp" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\UnrealEngine" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\UnrealEngineLauncher" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Local\VirtualStore" do rmdir "%%p"
del /s /q "C:\Users\%Username%\AppData\Roaming\EasyAntiCheat" do rmdir "%%p"
del /s /q"C:\Users\%Username%\AppData\Local\Speech Graphics" do rmdir "%%p"
del C:\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat
del C:\MSOCache{71230000-00E2-0000-1000-00000000}\Setup.dat
del C:\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir
del C:\ProgramData\Epic\UnrealEngineLauncher\LauncherInstalled.dat
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.06-23.28.32.replay"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged\54e16588720643fb821d9acfaf90cc68.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\54e16588720643fb821d9acfaf90cc68.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\54e16588720643fb821d9acfaf90cc68\ClientSettings.Sav"
@del /s /f /a:h /a:a /q "C:\Windows\System32\eac_usermode_220608325218020.dll"
@del /s /f /a:h /a:a /q "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe.local"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn6416.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn6415.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn6414.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn6413.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn6412.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn6411.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn6410.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn640F.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn640E.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn640D.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn640C.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn63FC.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn63FB.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn63FA.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn63F9.tmp"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\EventCache.v2\{C717DBEF-81DB-4E6C-94ED-E5B12E9CC753}.bin"
@del /s /f /a:h /a:a /q "C:\Windows\System32\PerfStringBackup.INI"
@del /s /f /a:h /a:a /q "C:\Windows\INF\WmiApRpl"
@del /s /f /a:h /a:a /q "C:\Windows\System32\perfh009.dat"
@del /s /f /a:h /a:a /q "C:\Windows\System32\perfc009.dat"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\EventCache.v2\{F2A3557B-2D8D-41F3-9F7B-47887FC14749}.bin"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.07-16.44.37.replay"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Repository\MAPPING2.MAP"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\29f3c28dda18408b873737d09b1ff7eb.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged\29f3c28dda18408b873737d09b1ff7eb.dat"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\CONHOST.EXE-0C6456FB.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\CMD.EXE-0BD30981.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\MODMAP.EXE-1DB19CC5.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\fnambt.settings"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\3L99B7UZ"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\3L99B7UZ\trans[1].gif"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\SFC2ZRUL\trans[1].gif"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\SFC2ZRUL"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\Microsoft\CryptnetUrlCache\MetaData"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\ZI7241I1\fpconfig.min[1].json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\ZI7241I1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\XJ96RPSD"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\XJ96RPSD\ab[1].json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\TempState\XboxGamingOverlayTraces_20200607214259.txt"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\29f3c28dda18408b873737d09b1ff7eb\ClientSettings.Sav"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-F630A562.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_16.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BC7.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_32.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BB6.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_48.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_96.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BB5.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BB4.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_256.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BB3.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_768.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BB2.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_1280.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BB1.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_1920.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BB0.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_2560.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BAF.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_sr.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_wide.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BAE.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BAD.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_exif.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_wide_alternate.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BAC.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BAB.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_custom_stream.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BAA.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn7BA9.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Logs\FortniteGame-backup-2020.06.07-05.45.31.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\UE4CC-Windows-83D18C654D6F2A4DE11807AEE1512BD8"
@del /s /f /a:h /a:a /q "C:\Windows\System32\eac_usermode_381808198426781.dll"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\DLLHOST.EXE-3F775797.pf"
@del /s /f /a:h /a:a /q "C:\Windows\TEMP"
@del /s /f /a:h /a:a /q "C:\Windows\TEMP\UDDA755.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\a0de3ab3-ab59-0f43-d979-4e1537a26540"
@del /s /f /a:h /a:a /q "D:\MSOCache"
@del /s /f /a:h /a:a /q "D:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe.local"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\OGAT5LPS"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\OGAT5LPS\trans[2].gif"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\IANPDDDM"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\IANPDDDM\trans[2].gif"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_16.db"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\DLLHOST.EXE-63B92852.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.07-18.51.47.replay"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Intel\CUIPromotions\Temp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Intel\CUIPromotions"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\container.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\B398B80134F72209547439DB21AB308D_5FDD03068CBBD8A96F3AB9595BA10093"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Intel\CUIPromotions\Temp\New.json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Intel\CUIPromotions\Config\Current.json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Intel\CUIPromotions\Config\status.cst"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\V010003A.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\V01.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\V01tmp.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged\b1904793c9714ba68e7abd6ddd4c740c.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\b1904793c9714ba68e7abd6ddd4c740c.dat"
@del /s /f /a:h /a:a /q "C:\Program Files (x86)\Google\CrashReports"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\GOOGLEUPDATE.EXE-0E1E7B82.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\b1904793c9714ba68e7abd6ddd4c740c"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\b1904793c9714ba68e7abd6ddd4c740c\ClientSettings.Sav"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\temp.edb"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\edbtmp.log"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\BBI.LOG1"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\DEFAULT.LOG1"
@del /s /f /a:h /a:a /q "C:\Windows\appcompat\Programs\Amcache.hve.LOG1"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\WindowsUpdate\WindowsUpdate.20200607.184959.794.1.etl"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\REMOTING_HOST.EXE-98099BD0.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\REMOTING_DESKTOP.EXE-AE08534C.pf"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\ClipSVC"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\ReportArchive"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\a35cadf2-9a85-4ff8-81ba-1da6b7fb3fec"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER789B.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER789B.tmp.mdmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\b964fe56-5680-407c-957c-4c6d91bb5703"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7919.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7919.tmp.WERInternalMetadata.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\2168bc9d-a080-4e29-871a-0612b4a4936d"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7949.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7949.tmp.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\3b7097b6-6252-4665-a518-a172d508b3cb"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\80e1b6b7-7f18-437d-8a22-ee461a8b346f"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\80e1b6b7-7f18-437d-8a22-ee461a8b346f\3681c698-0445-42a1-8a82-4c6a6aec5e33"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\80e1b6b7-7f18-437d-8a22-ee461a8b346f\9740fb48-fb07-4761-9a62-0356c756abde"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\ec4dd07a-ecf7-4337-a4fa-e10887cc18f7"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7947.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7947.tmp.csv"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\eb0cfd9d-dbfc-415e-b690-85982c79b058"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7976.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER7976.tmp.txt"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Credentials"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\TABTIP.EXE-9740CA06.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-C9E3B372.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\RUNTIMEBROKER.EXE-79DA4D38.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\FB0D848F74F70BB2EAA93746D24D9749"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Comms\UnistoreDB\store.jfm"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\6BADA8974A10C4BD62CC921D13E43B18_88614FFAD35D353421B8A7E1FE18FCE4"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Credentials\DFBE70A7E5CC19A398EBF1B96859CE5D"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\mat-debug-6164.log"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\7faa1a79-555e-4333-afbd-62d07d7c9732"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER278F.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER278F.tmp.mdmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\acf70141-648c-40c0-9cfa-549702f360e0"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER286B.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER286B.tmp.WERInternalMetadata.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\44fe14d1-3e86-4b02-89ab-480342fb9b10"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER289B.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER289B.tmp.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\0cea1038-292d-427f-9273-c3a59023fdbb"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\7868f3a9-95c3-41fb-aa42-e692b8cdac5d"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\7868f3a9-95c3-41fb-aa42-e692b8cdac5d\00e8bc1b-9aa1-4bc0-a7cd-9aa329a992d1"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\7868f3a9-95c3-41fb-aa42-e692b8cdac5d\c4b19633-7027-457d-ba27-44f66fb03f05"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\912ebb1c-4984-4d9d-b19b-5777b47007a6"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER28B8.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER28B8.tmp.csv"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\9c844648-64b9-4072-a736-cf395107746e"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER28F8.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER28F8.tmp.txt"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalState\notifications.json~RF1d3192.TMP"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\CLR_v4.0\UsageLogs\LocalBridge.exe.log"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\RUNTIMEBROKER.EXE-E09C4F85.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\eac_usermode_401424855163510.dll"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000046"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker"
@del /s /q /f /a ".\desktop.ini"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FOLDERCHANGESVIEW.EXE-B277C3B5.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\StructuredQuery.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows"
@del /s /f /a:h /a:a /q "C:\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\EASYANTICHEAT_SETUP.EXE-487D2C5D.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\EasyAntiCheat\gamelauncher.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\EasyAntiCheat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\EasyAntiCheat\217\loader.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\EasyAntiCheat\217"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\e6440939-eb49-d60d-56a3-9bfdadd4d876"
@del /s /f /a:h /a:a /q "C:\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys"
@del /s /f /a:h /a:a /q "C:\Windows\temp\UDDCC37.tmp"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITECLIENT-WIN64-SHIPPING-49F72F61.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-Application-Experience%4Program-Compatibility-Assistant.evtx"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\SYSTEM.LOG1"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\BBI.LOG2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\EasyAntiCheat\217\easyanticheat_wow64_x64.eac"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\EasyAntiCheat\217\easyanticheat_wow64_x64.eac.metadata"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\DLLHOST.EXE-463C6FB1.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\EASYANTICHEAT.EXE-4E9E548C.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\blob_storage\e838092b-b46a-4d74-9b39-6f4279b47605\0"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\blob_storage\e838092b-b46a-4d74-9b39-6f4279b47605"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\blob_storage"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\cef3.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
@del /s /f /a:h /a:a /q "C:\Windows\System32\eac_usermode_482097104432748.dll"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\UnrealEngine\4.25"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\UnrealEngine\4.25\Saved"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\UnrealEngine\4.25\Saved\Config"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\UnrealEngine\4.25\Saved\Config\WindowsClient"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\UnrealEngine"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\UE4CC-Windows-F8D5BC134F71DF83257BEF9B4085E365"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache\97df6490435bf0a9436805b328593e521bef2709c249ad019ecc79461eb3fd1d"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache\64b9209c2ac8cd8a260da8725247308b7da56dbc84bd6883bc51afe4278459eb"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache\c599248bab609cabbbe87d3f7e3e50ea514e617406a31121a5fdee918c714604"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\Settings\settings.dat.LOG1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\Settings\settings.dat.LOG2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\Settings"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\Settings\roaming.lock"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\Settings\settings.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\container.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\History\desktop.ini"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCookies\ESE\container.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCookies\ESE"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\Microsoft\CryptnetUrlCache\MetaData"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\Microsoft\CryptnetUrlCache\Content"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\f01b4d95cf55d32a.automaticDestinations-ms"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\5f7b5f1e01b83767.automaticDestinations-ms"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe\Settings\settings.dat.LOG1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe\Settings\settings.dat.LOG2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe\Settings"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\DA3B6E45325D5FFF28CF6BAD6065C907_BB48CA9838349E20FCB601A27952B68B"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache\8e515a9364adf147e3e6aded15551b073adc200a60e0c5833e2b038fd268b98a"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache\2e89e5e2a53880ccd375b604198765985f2c73c2b2d4ac5372b343786ecb6ddb"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache\ebd5ee9b5aeb33b1736533c0efd2ceff9861038fde9caee3bec8d5c011cf5405"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\LocalLow\Intel\ShaderCache\e50c2d83707e36b37a8ccc9b5e817185ef64eba636fbdb33c226fbb691452b0e"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\c22865656185fc02"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\c22865656185fc02\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.idx"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\c22865656185fc02\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.val"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\52b1c4a799428aeb"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\52b1c4a799428aeb\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.idx"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\52b1c4a799428aeb\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.val"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\N0FFOQJ7"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\1TTBRZUD"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\9LFQPUJ2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\QEDL8UE0"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\QEDL8UE0\ab[1].json"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-WindowsUpdateClient%4Operational.evtx"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\CBS\CBS.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS\c7dee411e20a44ab930f841e8d206b1b"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS\a22d837b6a2b46349421259c0a5411bf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS\b800b911053c4906a5bd399f46ae0055"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS\3460cbe1c57d4a838ace32951a4d7171"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS\c52c1f9246eb48ce9dade87be5a66f29"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS\7e2a66ce68554814b1bd0aa14351cd71"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS\b6c60402a72e4081a6a47c641371c19f"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer\iconcache_idx.db"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS\Files"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged\68b8f6c0ed514c9bbe63d2d41064aa5b.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\68b8f6c0ed514c9bbe63d2d41064aa5b.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\RDR8CF6.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\RDR8CF6.tmp\empty.txt"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\RDRD051.tmp\empty.txt"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\e71f8ca9-7a8f-4073-bfa0-020a26737001"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8CF7.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8CF7.tmp.WERInternalMetadata.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\81ecce72-2441-477f-93cb-f7123e6a3077"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8D17.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8D17.tmp.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\c9253d7e-8a3f-4968-9b2b-05f99235a26c"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\66864573-f9f1-44e8-85a2-6ac862842b9b"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\66864573-f9f1-44e8-85a2-6ac862842b9b\87013600-757e-4238-bf15-e6f088732821"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\66864573-f9f1-44e8-85a2-6ac862842b9b\d9d32f03-02f1-443c-8ddd-eba04235dc8e"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\f9cee132-b20d-4a71-9722-4e2091922bdf"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8D54.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8D54.tmp.csv"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\45ec6edb-4340-453b-be33-d354eea6c133"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8D74.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WER8D74.tmp.txt"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD061.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD061.tmp.WERInternalMetadata.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD081.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD081.tmp.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD0DD.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD0DD.tmp.csv"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD0FD.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERD0FD.tmp.txt"


@del /s /f /a:h /a:a /q "C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Credentials\DFBE70A7E5CC19A398EBF1B96859CE5D"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Credentials\DFBE70A7E5CC19A398EBF1B96859CE5D"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-Resource-Exhaustion-Resolver%4Operational.evtx"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-6E1A6101.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\ntuser.dat.LOG1"
@del /s /f /a:h /a:a /q "C:\Windows\System32\catroot2\dberr.txt"
@del /s /f /a:h /a:a /q "C:\Windows\INF\basicrender.PNF"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Comms\UnistoreDB\USS.jtx"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\LMS"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\4d5bc96.tmp"
@del /s /f /a:h /a:a /q "C:\Users\Public\Libraries\collection.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOCK"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Feeds"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\ReportingEvents.log"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\DataStore\Logs\tmp.edb"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\DataStore\Logs"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\WindowsUpdate\WindowsUpdate.20200608.032521.900.10.etl"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\WindowsUpdate\WindowsUpdate.20200608.032521.900.9.etl"
@del /s /f /a:h /a:a /q "C:\Windows\System32\LogFiles\WMI\RtBackup\EtwRTdfa2c640-651d-488d-a479-2fd7a7ca6e29.etl"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SPPSVC.EXE-96070FE0.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\68b8f6c0ed514c9bbe63d2d41064aa5b"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\68b8f6c0ed514c9bbe63d2d41064aa5b\ClientSettings.Sav"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.08-03.48.26.replay"
@del /s /f /a:h /a:a /q "C:\Windows\ServiceState\EventLog\Data\lastalive0.dat"
@del /s /f /a:h /a:a /q "C:\ProgramData\regid.1991-06.com.microsoft\regid.1991-06.com.microsoft_Windows-10-Enterprise-Evaluation.swidtag"
@del /s /f /a:h /a:a /q "C:\ProgramData\regid.1991-06.com.microsoft"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\Settings\settings.dat.LOG1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\Settings\settings.dat.LOG2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\Settings"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedScenarios\WINDOWS.SIUF.xml.new"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedScenarios"
@del /s /f /a:h /a:a /q "C:\ProgramData\mntemp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedScenarios\WINDOWS.SIUF.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service\Unknown.Log"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedSettings\utc.app.json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\mat-debug-1016.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\Settings\settings.dat.LOG1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\Settings\settings.dat.LOG2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\Settings"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Features\du.bin"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Features"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalState\notifications.json~RF24dddd.TMP"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\LOCALBRIDGE.EXE-DD86BC95.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\2cc80dabc69f58b6_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\4cb013792b196a35_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\f1cdccba37924bda_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\ba23d8ecda68de77_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\67a473248953641b_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\b6c28cea6ed9dfc1_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\013888a1cda32b90_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000001"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00004d"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00004e"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00004f"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000050"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000051"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000052"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000053"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\3be23bfd7e47e465\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.idx"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\3be23bfd7e47e465\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.lock"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\3be23bfd7e47e465"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\ba68a1950dd74932\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.val"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\ba68a1950dd74932\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.idx"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\ba68a1950dd74932\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.lock"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\3be23bfd7e47e465\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.val"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\CrashReportClient\UE4CC-Windows-C738582F4F60E7B572467B87334A52DE"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITECLIENT-WIN64-SHIPPING-A840A14D.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITELAUNCHER.EXE-CEAE6228.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITECLIENT-WIN64-SHIPPING-5D7C37E5.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\DLLHOST.EXE-5A2E8D37.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\EASYANTICHEAT.EXE-ACEC6391.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\RUNTIMEBROKER.EXE-8A8295D7.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\GAMEBARPRESENCEWRITER.EXE-FE591E8F.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\CrashReportClient"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher-backup-2020.06.08-21.47.55.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\PortalRegions.ini"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\PortalRegions.ini"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\d4c9c2a7325eb61e\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.lock"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\UnrealEngineLauncher\LauncherInstalled.dat"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage\PatchData"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage\Install"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage\Meta"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage\PatchData\chunkdump"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage\Meta\$resumeData"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\EPICGAMESLAUNCHER.EXE-018FC121.pf"
@del /s /f /a:h /a:a /q "C:\ProgramData\Epic\EpicGamesLauncher\Data\EMS\current"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\ecache.bin"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged\OC_60ceea72acec404a8814e29f533cd218.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\OC_60ceea72acec404a8814e29f533cd218.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\LOG.old"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\LOG.old~RF2ce23.TMP"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000047"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000048"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\UNREALCEFSUBPROCESS.EXE-2C8D5F1D.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\Notifications\wpndatabase.db-wal"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\Notifications\wpndatabase.db-shm"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.OneConnect_5.2005.1431.0_x64__8wekyb3d8bbwe\ActivationStore.dat"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\60a40e5f-987c-430b-9562-80daf0bb31f1"
@del /s /f /a:h /a:a /q "C:\Windows\System32\Tasks\Microsoft\Windows\PushToInstall\Registration"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39cacd108634434c91f1"
@del /s /f /a:h /a:a /q "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Credentials\DFBE70A7E5CC19A398EBF1B96859CE5D"
@del /s /f /a:h /a:a /q "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Credentials"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\ClipSVC\tokens.dat.bak"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\ClipSVC\tokens.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.OneConnect_8wekyb3d8bbwe\LocalState\DiagOutputDir"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000049"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-74450C2F.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\DRIVERS.LOG1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00004a"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Vault\UserProfileRoaming\Latest.dat"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\EventStore.db-wal"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index-dir\the-real-index"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index-dir"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index-dir\the-real-index~RF32ada.TMP"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cookies-journal"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cookies"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows Security Health\Logs\SHS-06082020-170341-7-3f-73c8e.1.fm8919rc.8ah9_rfl72sd.de14fd-793e.etl"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows Security Health\Logs"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SECURITYHEALTHSERVICE.EXE-91B5FB98.pf"
@del /s /f /a:h /a:a /q "C:\Program Files (x86)\Common Files\BattlEye\BEService.exe"
@del /s /f /a:h /a:a /q "C:\Program Files (x86)\Common Files\BattlEye\BEService_fn.exe"
@del /s /f /a:h /a:a /q "C:\Windows\temp\UDD6B4B.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index-dir\temp-index"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index-dir\the-real-index~RF4a68d.TMP"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\UE4CC-Windows-E18472FD40444A81200C4689242F0DC2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Logs\FortniteGame-backup-2020.06.08-21.56.42.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\TempState\XboxGamingOverlayTraces_20200608220449.txt"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\TempState"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\LocalCache\kglDL.bin"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\LocalCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\dd7c3b1adb1c168b.automaticDestinations-ms"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\The Internet.lnk"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\LocalCache\kgl.bin"
@del /s /f /a:h /a:a /q "C:\Windows\System32\LogFiles\WMI\RtBackup\EtwRTXboxGameBar-PresentMon.etl"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\V01.chk"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\K1P1XB13\ab[1].json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\K1P1XB13"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\AT2DHMOO\ab[1].json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\AC\INetCache\AT2DHMOO"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\GAMEBAR.EXE-F128C052.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-9E5372D6.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\GAMEBARFTSERVER.EXE-893F5327.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\GAMEBARFT.EXE-361978C4.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Performance\WmiApRpl_new.h"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\WMIADAP.EXE-BB21CD77.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\WMIPRVSE.EXE-E8B8DD29.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged\60ceea72acec404a8814e29f533cd218.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\60ceea72acec404a8814e29f533cd218.dat"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Performance\WmiApRpl.h"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Performance"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Performance\WmiApRpl_new.ini"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\SmsRouter\MessageStore\edb.chk"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\SmsRouter\MessageStore\SmsInterceptStore.db"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\SmsRouter\MessageStore\edb.log"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\SmsRouter\MessageStore\SmsInterceptStore.jfm"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe\Settings\settings.dat"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-Containers-BindFlt%4Operational.evtx"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Performance\WmiApRpl.ini"
@del /s /f /a:h /a:a /q "C:\Windows\INF\WmiApRpl\0009\WmiApRpl.ini"
@del /s /f /a:h /a:a /q "C:\Windows\INF\WmiApRpl\0009"
@del /s /f /a:h /a:a /q "C:\Windows\INF\WmiApRpl\WmiApRpl.h"
@del /s /f /a:h /a:a /q "C:\Windows\INF\WmiApRpl\WmiApRpl.ini"
@del /s /f /a:h /a:a /q "C:\Windows\System32\PerfStringBackup.TMP"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Repository\OBJECTS.DATA"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Repository\INDEX.BTR"
@del /s /f /a:h /a:a /q "C:\Windows\System32\wbem\Repository\MAPPING3.MAP"
@del /s /f /a:h /a:a /q "C:\Windows\bootstat.dat"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\AppRepository\StateRepository-Deployment.srd"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\AppRepository\StateRepository-Deployment.srd-wal"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-Known Folders API Service.evtx"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-DB425447.pf"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\EventCache.v2\{77A75EB3-3BD3-455C-8257-0EF8A6E36FAC}.bin"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\EventCache.v2"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\EventCache.v2\{F15212AA-704A-4D8E-95AC-8DB9BA5A6E74}.bin"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-Storage-Storport%4Health.evtx"
@del /s /f /a:h /a:a /q "C:\Windows\INF\netrasa.PNF"
@del /s /f /a:h /a:a /q "C:\Windows\INF\netvwifimp.PNF"
@del /s /f /a:h /a:a /q "C:\Windows\INF\netsstpa.PNF"
@del /s /f /a:h /a:a /q "C:\Windows\INF\netwtw04.PNF"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.08-17.12.29.replay"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\DataStore\DataStore.jfm"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\DataStore\DataStore.edb"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\DataStore\Logs\edb.chk"
@del /s /f /a:h /a:a /q "C:\Windows\SoftwareDistribution\DataStore\Logs\edb.log"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\WindowsUpdate\WindowsUpdate.20200608.165939.547.1.etl"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-9F82877C.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SMARTSCREEN.EXE-EACC1250.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00004b"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00005a"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-47E93A69.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\BESERVICE.EXE-991187A8.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITECLIENT-WIN64-SHIPPING-2FF4C5BF.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WER\ERC\statecache.lock"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITECLIENT-WIN64-SHIPPING-62345C79.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITELAUNCHER.EXE-4FF7645C.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-12871F9D.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-WER-PayloadHealth%4Operational.evtx"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-Fault-Tolerant-Heap%4Operational.evtx"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\UnrealEngine\4.25\Saved\Config\WindowsClient\Manifest.ini"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\UE4CC-Windows-32DC50BD4D6B154607F1D2AB2A40834C"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Logs\FortniteGame-backup-2020.06.11-20.21.57.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Logs"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Logs\FortniteGame.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\data_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\QuotaManager-journal"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\QuotaManager"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\c22865656185fc02\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.lock"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\52b1c4a799428aeb\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.lock"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\000003.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\LOG.old"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\COMPPKGSRV.EXE-4780F0C1.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\LogFiles\WMI\RtBackup\EtwRTGraphicsPerfMonitorSession.etl"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-4DDD208B.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Spelling\en-US\default.dic"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Spelling\en-US\default.exc"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Roaming\Microsoft\Spelling\en-US\default.acl"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-AE1E0CAD.pf"

rmdir "C:\Users\%username%\AppData\Local\CrashDumps" /s /q
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged\85c5fa72dc424ba28ac8a44c49794b1d.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\85c5fa72dc424ba28ac8a44c49794b1d.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data"
@del /s /f /a:h /a:a /q "C:\Windows\System32\sru\SRU.chk"
@del /s /f /a:h /a:a /q "C:\Windows\System32\sru\SRUDB.dat"
@del /s /f /a:h /a:a /q "C:\Windows\System32\sru\SRUDB.jfm"
@del /s /f /a:h /a:a /q "C:\Windows\System32\sru\SRU.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS\Files\C28FF1DE0C661DAF01E118A30B3F21B897A7A6E2"
@del /s /f /a:h /a:a /q "C:\Windows\System32\winevt\Logs\Microsoft-Windows-Storage-Storport%4Operational.evtx"

@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\GAMEBARPRESENCEWRITER.EXE-5ADEE7C2.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-0114DDBC.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITECLIENT-WIN64-SHIPPING-A840A14D.pf
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\FORTNITECLIENT-WIN64-SHIPPING-A840A14D.pf"
@del /s /f /a:h /a:a /q "C:\Windows\System32\config\DEFAULT.LOG2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS\CacheAccess.json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\ntuser.dat.LOG2"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedSettings\telemetry.ASM-WindowsDefault.json"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedSettings"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedSettings\telemetry.ASM-WindowsDefault.json.bk"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\CacheStorage\CacheStorage.edb"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Internet Explorer\CacheStorage\edb.chk"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\CacheStorage\CacheStorage.jfm"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Internet Explorer\CacheStorage\edb.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Internet Explorer\CacheStorage\.inUse"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Internet Explorer\CacheStorage"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\IndexedDB.edb"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\ScenariosSqlStore\EventStore.db-wal"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\parse.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\O7NIJE77\fpconfig.min[1].json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\R4WA2BLZ\fpconfig.min[1].json"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\DLLHOST.EXE-E9BDD97B.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\NOTEPAD.EXE-C5670914.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\DLLHOST.EXE-4B6CB38A.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\DLLHOST.EXE-15CDDA9C.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\SVCHOST.EXE-62677B80.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\BACKGROUNDTASKHOST.EXE-4EED4AF4.pf"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\TASKHOSTW.EXE-2E5D4B75.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\R4WA2BLZ\trans[4].gif"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\FXE0B9PV\trans[4].gif"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC\INetCache\FXE0B9PV"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\IndexedDB.jfm"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\edb.chk"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB\edb.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.11-23.22.40.replay"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\WindowsUpdate\WindowsUpdate.20200611.173755.524.2.etl"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\WindowsUpdate"
@del /s /f /a:h /a:a /q "C:\Windows\Logs\WindowsUpdate\WindowsUpdate.20200611.173755.524.1.etl"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\D3DSCache\e8010882af4f153f\F4EB2D6C-ED2B-4BDD-AD9D-F913287E6768.lock"
@del /s /f /a:h /a:a /q "C:\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys"
@del /s /f /a:h /a:a /q "C:\Program Files (x86)\Common Files\BattlEye"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\GameUserSettings.ini"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000075"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000077"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\LOG"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00005b"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\UNREALCEFSUBPROCESS.EXE-2C8D5F1C.pf"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Visited Links"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\LOG"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\000003.log"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_0"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_1"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_2"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_3"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\TASKMGR.EXE-4C8500BA.pf"
rem Clear IE cache
@del /s /f /a:h /a:a /q "D:\Recovery\ntuser.sys"
del /s /q /f /a:h /a:a  "C:\Users%username%\AppData\Local\Temp"
@del /s /f /a:h /a:a /q "D:\Recovery"
@del /s /f /a:h /a:a /q "D:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files"
@del /s /f /a:h /a:a /q "D:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64"
@del /s /f /a:h /a:a /q "D:\MSOCache\{71230000-00E2-0000-1000-00000000}"
@del /s /f /a:h /a:a /q "D:\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat"
@del /s /f /a:h /a:a /q "D:\desktop.ini"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\Settings\settings.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalState"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalState\notifications.json~RF8eaa66.TMP"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalState\notifications.json.~tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalState\notifications.json"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\Settings\settings.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\CrashDumps\YourPhone.exe.3696.dmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\CrashDumps\HxTsr.exe.10192.dmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\CrashDumps\backgroundTaskHost.exe.10176.dmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\CrashDumps"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\CrashDumps\YourPhone.exe.7740.dmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalCache\EcsCache0\Ecs.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalCache\EcsCache0"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe\LocalCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\18e190413af045db88dfbd29609eb877.db.ses"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA316.tmp.txt"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\mat-debug-1164.log"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2F6.tmp.csv"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\History\Low\History.IE5"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA316.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\abe4f690-4949-40b0-8f8d-3ad5cf29c11a"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2F6.tmp.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2F5.tmp.txt"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2F6.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2F5.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\IECompatUaCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\IECompatUaCache\Low"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\IECompatCache"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\IECompatCache\Low"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCookies\PrivacIE"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCookies\PrivacIE\Low"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCookies\Low"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCookies\DNTException"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCookies\DNTException\Low"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2D5.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2D5.tmp.WERInternalMetadata.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2D4.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2D4.tmp.csv"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Temp\b0a63f70-5f47-4e0f-8307-1ac148082552"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2D6.tmp.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2D6.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2B6.tmp.WERInternalMetadata.xml"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA2B6.tmp"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\Settings\settings.dat"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA277.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA277.tmp.mdmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA248.tmp"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\WER\Temp\WERA248.tmp.mdmp"
@del /s /f /a:h /a:a /q "C:\Windows\Prefetch\WERFAULT.EXE-155C56CF.pf"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\AppRepository\StateRepository-Machine.srd-shm"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\LocalState"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\LocalState\HxCommAlwaysOnLog.etl"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Packages\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\LocalState\HxCommAlwaysOnLog_Old.etl"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Wallet_2.4.18324.0_x64__8wekyb3d8bbwe\ActivationStore.dat"
@del /s /f /a:h /a:a /q "C:\ProgramData\Microsoft\Diagnosis\DownloadedSettings\utc.tracing.json.new"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\Microsoft\PenWorkspace\DiscoverCacheData.dat"
@del /s /f /a:h /a:a /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.16-20.22.13.replay"
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d Desktop%random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d Desktop%random% /f
REG ADD HKLM\SYSTEM\HardwareConfig /v LastConfig /t REG_SZ /d {%username%%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v HwProfileGuid /t REG_SZ /d {%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v GUID /t REG_SZ /d {%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v BuildGUID /t REG_SZ /d %random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOwner /t REG_SZ /d %random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOrganization /t REG_SZ /d %random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Cryptography /v GUID /t REG_SZ /d %random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Cryptography /v MachineGuid /t REG_SZ /d %random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\Tracing\Microsoft\Profile\Profile /v Guid /t REG_SZ /d %random%-%random%-%random%-%username%%random% /f
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\0007 /v NetworkAddress /d 002622D90EFC /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v BIOSReleaseDate /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v BIOSVendor /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v SystemManufacturer /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\BIOS" /v SystemProductName /f
reg delete"HKEY_LOCAL_MACHINE\SYSTEM\HardwareConfig" /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SYSTEM\HardwareConfig /v LastConfig /t REG_SZ /d {eac%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v HwProfileGuid /t REG_SZ /d {%random%-%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v GUID /t REG_SZ /d {%random%-%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v BuildGUID /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOwner /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOrganization /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Cryptography /v GUID /t REG_SZ /d %random%-%random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Cryptography /v MachineGuid /t REG_SZ /d %random%-%random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v ProductId /t REG_SZ /d %random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v InstallDate /t REG_SZ /d %random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\SystemInformation /v ComputerHardwareId /t REG_SZ /d {%random%-%random%-%random%-%random%} /f
reg delete "HKEY_CLASSES_ROOT\com.epicgames.launcher" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Epic Games" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\EpicGames" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Installer\Dependencies" /v MSICache /f
reg delete "HKEY_CURRENT_USER\Software\Classes\com.epicgames.launcher" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Hardware Survey" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Identifiers" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Direct3D" /v WHQLClass /f
reg delete "HKEY_CURRENT_USER\Software\WOW6432Node\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0" /v ProcessorNameString /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\com.epicgames.launcher" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\EpicGames" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\HardwareConfig" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control" /v SystemStartOptions /f
reg delete "HKEY_USERS\S-1-5-21-2097722829-2509645790-3642206209-1001\Software\Epic Games" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App\windows.protocol" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App\windows.protocol\ms-gamebarservices" /f
reg delete "HKLM\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications\FortniteClient-Win64-Shipping.exe" /f
reg delete "HKLM\SOFTWARE\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\Package\181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\Package\181\93" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\PackageAndPackageRelativeApplicationId\181^App" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\PackageAndPackageRelativeApplicationId\181^App\93" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\3^93" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\3^93\ac" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\4^93" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\4^93\ad" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFamily\4e\180" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFamily\4e\181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFamily\4e\182" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFullName\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFullName\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe\182" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFullName\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFullName\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\180" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFullName\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFullName\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a80" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a81" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a82" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a83" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a84" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180\1a80" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181\1a81" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182\1a82" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180\1a83" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181\1a84" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x64__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x86__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x64__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x86__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security" /f
reg delete "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher" /f
reg delete "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
reg delete "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
reg delete "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f
reg delete "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher" /f
reg delete "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
reg delete "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
reg delete "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Classes\Local Settings\MrtCache\C:%5CProgram Files%5CWindowsApps%5CMicrosoft.XboxGamingOverlay_2.26.28001.0_x64__8wekyb3d8bbwe%5Cmicrosoft.system.package.metadata%5CS-1-5-21-2532382528-581214834-2534474248-1001-MergedResources-2.pri" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Classes\Local Settings\MrtCache\C:%5CProgram Files%5CWindowsApps%5CMicrosoft.XboxGamingOverlay_2.26.28001.0_x64__8wekyb3d8bbwe%5Cmicrosoft.system.package.metadata%5CS-1-5-21-2532382528-581214834-2534474248-1001-MergedResources-2.pri\1d50f44cf1a0499" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Classes\Local Settings\MrtCache\C:%5CProgram Files%5CWindowsApps%5CMicrosoft.XboxGamingOverlay_2.26.28001.0_x64__8wekyb3d8bbwe%5Cmicrosoft.system.package.metadata%5CS-1-5-21-2532382528-581214834-2534474248-1001-MergedResources-2.pri\1d50f44cf1a0499\87f345c2" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\System\GameConfigStore\Children\03ce6902-ff58-41de-ab92-36fcaf27a580" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\System\GameConfigStore\Parents\fd13f746e7d2d69760b017363f621255c9b49ac8" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001_Classes\Local Settings\MrtCache\C:%5CProgram Files%5CWindowsApps%5CMicrosoft.XboxGamingOverlay_2.26.28001.0_x64__8wekyb3d8bbwe%5Cmicrosoft.system.package.metadata%5CS-1-5-21-2532382528-581214834-2534474248-1001-MergedResources-2.pri" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001_Classes\Local Settings\MrtCache\C:%5CProgram Files%5CWindowsApps%5CMicrosoft.XboxGamingOverlay_2.26.28001.0_x64__8wekyb3d8bbwe%5Cmicrosoft.system.package.metadata%5CS-1-5-21-2532382528-581214834-2534474248-1001-MergedResources-2.pri\1d50f44cf1a0499" /f
reg delete "HKU\S-1-5-21-2532382528-581214834-2534474248-1001_Classes\Local Settings\MrtCache\C:%5CProgram Files%5CWindowsApps%5CMicrosoft.XboxGamingOverlay_2.26.28001.0_x64__8wekyb3d8bbwe%5Cmicrosoft.system.package.metadata%5CS-1-5-21-2532382528-581214834-2534474248-1001-MergedResources-2.pri\1d50f44cf1a0499\87f345c2" /f
reg delete "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher" /f
reg delete "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
reg delete "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
reg delete "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f
reg delete "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher" /f
reg delete "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
reg delete "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
reg delete "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Extensions\ProgIDs\AppXm8fs0gj5h36ynw4kq0x3gqnz6ecr1kvy\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe: (NULL!)" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Extensions\windows.protocol\ms-gamebarservices\AppXm8fs0gj5h36ynw4kq0x3gqnz6ecr1kvy\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe: (NULL!)" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App\windows.protocol\ms-gamebarservices\ACID: "App.AppXe655y38cadddpg1xd2b5k915wndhg5gm.mca"" /f
reg delete "HKLM\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications\FortniteClient-Win64-Shipping.exe\LastDetectionTime:  F9 8F FD B6 8D 13 D5 01" /f
reg delete "HKLM\SOFTWARE\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\AppPackageType: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\PackageSid: "S-1-15-2-1823635404-1364722122-2170562666-1762391777-2399050872-3465541734-3732476201"" /f
reg delete "HKLM\SOFTWARE\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\EnterpriseID: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\CapSids:  0A 00 00 00 01 02 00 00 00 00 00 0F 03 00 00 00 01 00 00 00 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 E8 41 FE 65 15 CB 86 8E 43 2C E1 30 42 2A B3 51 4E 9C 0E 17 B4 1B 89 09 98 DA 44 8D 13 6A 0C B3 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 E4 29 72 AE 52 A9 2E 19 C4 FB 6C 51 9E 00 25 50 5B 64 A6 6F A4 D2 D0 57 D2 DB D7 37 F2 B0 85 AC 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 0B 44 35 CF 44 6C 30 B5 4C 90 DA 15 DB 4C 09 94 5A 08 A5 69 F0 DC C5 65 02 4A 7B B9 A8 2C DA C2 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 3C DA 35 57 2A 15 FA C8 02 C1 BC 52 65 2B D8 EC C8 8E 72 9B 62 79 A8 20 65 1E 06 07 AF 02 70 0C 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 CE 22 45 27 27 B8 EA 12 11 8A 20 EF 09 19 FD 6B B8 B4 A0 D6 03 10 5B DD D6 CF 74 85 60 22 D2 CD 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 0A D5 CA 1A 96 05 1C F5 5E 2C 0C CE 2A E" /f
reg delete "8 F3 66 B9 86 13 95 5D 1A 40 0A 7F 52 A9 BA B2 23 04 83 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 38 B0 4E D5 42 5B 15 DF 75 ED 77 00 0E 5B 16 73 C1 5E D2 AF 68 BF 75 AD 38 35 1D 6A 1E 9A 12 F7 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 AF 37 E5 A2 58 AD 48 66 53 E6 1F 53 B9 42 0E EA 34 9C E5 B6 48 3A DB 78 9F 5C A7 33 FE 7E 97 1A 01 08 00 00 00 00 00 0F 03 00 00 00 CC 77 B2 6C CA 01 58 51 6A 28 60 81 E1 F6 0B 69 78 9C FE 8E 66 F8 8F CE 29 11 79 DE 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" /f
reg delete " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\ApplicationFlags: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\Origins\kz2LMQg4+pNfXggv65DcWFQ9SiekWR4B4WMWT+pcqbU: 0x00000002" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\Origins\4JSyFFDDKUMXDyK2USgAjbiksFnqOb3f8RPZBPSpEfU: 0x00000002" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\Origins\62bDlCzxB/xxIWLkQdDRYcAqhmZhNOMUtjhRkAgTvkQ: 0x00000002" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Package: 0x00000181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Index: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Flags: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\PackageRelativeApplicationId: "App"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\ApplicationUserModelId: "Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Executable: "GameBar.exe"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Entrypoint: "GameBar.App"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\StartPage: (NULL!)" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\_IndexKeys:  50 61 63 6B 61 67 65 5C 31 38 31 5C 39 33 00 50 61 63 6B 61 67 65 41 6E 64 50 61 63 6B 61 67 65 52 65 6C 61 74 69 76 65 41 70 70 6C 69 63 61 74 69 6F 6E 49 64 5C 31 38 31 5E 41 70 70 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\Application: 0x00000093" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\User: 0x00000003" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\ApplicationUserModelId: "Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\_IndexKeys:  55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 5C 33 5E 39 33 00 55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 55 73 65 72 4D 6F 64 65 6C 49 64 5C 33 5E 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 21 41 70 70 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\Application: 0x00000093" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\User: 0x00000004" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\ApplicationUserModelId: "Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\_IndexKeys:  55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 5C 34 5E 39 33 00 55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 55 73 65 72 4D 6F 64 65 6C 49 64 5C 34 5E 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 21 41 70 70 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageFullName: "Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageFamily: 0x0000004E" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageType: 0x00000008" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\Flags: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageOrigin: 0x00000003" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\Volume: 0x00000001" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\InstalledLocation: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\_IndexKeys:  50 61 63 6B 61 67 65 46 61 6D 69 6C 79 5C 34 65 5C 31 38 30 00 50 61 63 6B 61 67 65 46 75 6C 6C 4E 61 6D 65 5C 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 31 2E 34 31 2E 32 34 30 30 31 2E 30 5F 6E 65 75 74 72 61 6C 5F 7E 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageFullName: "Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageFamily: 0x0000004E" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageType: 0x00000001" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\Flags: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageOrigin: 0x00000003" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\Volume: 0x00000001" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\InstalledLocation: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\_IndexKeys:  50 61 63 6B 61 67 65 46 61 6D 69 6C 79 5C 34 65 5C 31 38 31 00 50 61 63 6B 61 67 65 46 75 6C 6C 4E 61 6D 65 5C 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 31 2E 34 31 2E 32 34 30 30 31 2E 30 5F 78 36 34 5F 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageFullName: "Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageFamily: 0x0000004E" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageType: 0x00000004" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\Flags: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageOrigin: 0x00000003" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\Volume: 0x00000001" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\InstalledLocation: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\_IndexKeys:  50 61 63 6B 61 67 65 46 61 6D 69 6C 79 5C 34 65 5C 31 38 32 00 50 61 63 6B 61 67 65 46 75 6C 6C 4E 61 6D 65 5C 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 31 2E 34 31 2E 32 34 30 30 31 2E 30 5F 6E 65 75 74 72 61 6C 5F 73 70 6C 69 74 2E 73 63 61 6C 65 2D 31 30 30 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80\Package: 0x00000180" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80\User: 0x00000003" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80\_IndexKeys:  55 73 65 72 5C 33 5C 31 61 38 30 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 33 5E 31 38 30 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81\Package: 0x00000181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81\User: 0x00000003" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81\_IndexKeys:  55 73 65 72 5C 33 5C 31 61 38 31 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 33 5E 31 38 31 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82\Package: 0x00000182" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82\User: 0x00000003" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82\_IndexKeys:  55 73 65 72 5C 33 5C 31 61 38 32 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 33 5E 31 38 32 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83\Package: 0x00000180" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83\User: 0x00000004" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83\_IndexKeys:  55 73 65 72 5C 34 5C 31 61 38 33 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 34 5E 31 38 30 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84\Package: 0x00000181" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84\User: 0x00000004" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84\_IndexKeys:  55 73 65 72 5C 34 5C 31 61 38 34 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 34 5E 31 38 31 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\AppxMetadata\AppxBundleManifest.xml"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x64__8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.VCLibs.140.00_14.0.27323.0_x64__8wekyb3d8bbwe\AppxManifest.xml"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x86__8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.VCLibs.140.00_14.0.27323.0_x86__8wekyb3d8bbwe\AppxManifest.xml"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\AppxMetadata\AppxBundleManifest.xml"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\LastReturnValue: 0x00000000" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\NumberOfAttempts: 0x00000001" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x64__8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.VCLibs.140.00_14.0.27323.0_x64__8wekyb3d8bbwe\AppxManifest.xml"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-2532382528-581214834-2534474248-1001\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe\Microsoft.VCLibs.140.00_14.0.27323.0_x86__8wekyb3d8bbwe\Path: "C:\Program Files\WindowsApps\Microsoft.VCLibs.140.00_14.0.27323.0_x86__8wekyb3d8bbwe\AppxManifest.xml"" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\VolatileNotifications\41C64E6DA3D39855:  01 00 04 80 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00 00 02 00 1C 00 01 00 00 00 00 00 14 00 03 00 00 00 01 01 00 00 00 00 00 05 0B 00 00 00 04 00 00 00" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\VolatileNotifications\41C64E6DA3CF4055:  01 00 04 80 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00 00 02 00 1C 00 01 00 00 00 00 00 14 00 03 00 00 00 01 01 00 00 00 00 00 05 0B 00 00 00 04 00 00 00" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Google\Update\UsageStats\Daily\Counts\cup_ecdsa_http_failure:  01 00 00 00 00 00 00 00" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\AppPackageType: 0x00000000" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\PackageSid: "S-1-15-2-1823635404-1364722122-2170562666-1762391777-2399050872-3465541734-3732476201"" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\EnterpriseID: 0x00000000" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\CapSids:  0A 00 00 00 01 02 00 00 00 00 00 0F 03 00 00 00 01 00 00 00 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 E8 41 FE 65 15 CB 86 8E 43 2C E1 30 42 2A B3 51 4E 9C 0E 17 B4 1B 89 09 98 DA 44 8D 13 6A 0C B3 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 E4 29 72 AE 52 A9 2E 19 C4 FB 6C 51 9E 00 25 50 5B 64 A6 6F A4 D2 D0 57 D2 DB D7 37 F2 B0 85 AC 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 0B 44 35 CF 44 6C 30 B5 4C 90 DA 15 DB 4C 09 94 5A 08 A5 69 F0 DC C5 65 02 4A 7B B9 A8 2C DA C2 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 3C DA 35 57 2A 15 FA C8 02 C1 BC 52 65 2B D8 EC C8 8E 72 9B 62 79 A8 20 65 1E 06 07 AF 02 70 0C 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 CE 22 45 27 27 B8 EA 12 11 8A 20 EF 09 19 FD 6B B8 B4 A0 D6 03 10 5B DD D6 CF 74 85 60 22 D2 CD 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 0A D5 CA 1A 96 05 1C F5 5E 2" /f
reg delete "C 0C CE 2A E8 F3 66 B9 86 13 95 5D 1A 40 0A 7F 52 A9 BA B2 23 04 83 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 38 B0 4E D5 42 5B 15 DF 75 ED 77 00 0E 5B 16 73 C1 5E D2 AF 68 BF 75 AD 38 35 1D 6A 1E 9A 12 F7 01 0A 00 00 00 00 00 0F 03 00 00 00 00 04 00 00 AF 37 E5 A2 58 AD 48 66 53 E6 1F 53 B9 42 0E EA 34 9C E5 B6 48 3A DB 78 9F 5C A7 33 FE 7E 97 1A 01 08 00 00 00 00 00 0F 03 00 00 00 CC 77 B2 6C CA 01 58 51 6A 28 60 81 E1 F6 0B 69 78 9C FE 8E 66 F8 8F CE 29 11 79 DE 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" /f
reg delete " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe\ApplicationFlags: 0x00000000" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat\GamesInstalled: "217;"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\hivelist\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862software:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 2E 64 61 74 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\hivelist\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_sid:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 2E 64 61 74 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\hivelist\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_classes:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 43 6C 61 73 73 65 73 2E 64 61 74 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\hivelist\REGISTRY\WC\Siloe6b4a779-bfe1-62d8-47ac-fa19e9becbbecom:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 5F 43 4F 4D 31 35 2E 64 61 74 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\hivelist\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862com:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 2E 64 61 74 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping_EAC.exe:  B1 8A B0 E9 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\EasyAntiCheat\EasyAntiCheat_Setup.exe:  73 D5 4B 11 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe:  E7 CB 84 E9 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Type: 0x00000010" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Start: 0x00000003" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ErrorControl: 0x00000001" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ImagePath: ""C:\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe""" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\DisplayName: "EasyAntiCheat"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\WOW64: 0x0000014C" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ObjectName: "LocalSystem"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Description: "Provides integrated security and services for online multiplayer games."" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862software:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 2E 64 61 74 00 00" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_sid:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 2E 64 61 74 00 00" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_classes:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 43 6C 61 73 73 65 73 2E 64 61 74 00 00" /f
del  C:\Program s\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared s
del  C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownload\CMS\s\C28FF1DE0C661DAF01E118A30B3F21B897A7A6E2\362A8E0D024EE3CE70B9AF5283FF6E95C2A3427D
del  C:\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownload\CMS\s\C28FF1DE0C661DAF01E118A30B3F21B897A7A6E2\D448A2D69B897D0CA64BC7EAD63C82B135B28C90
del  C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos
del  C:\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\UnsavedReplay-2020.06.30-23.22.06.replay
del  C:\Users\%username%\AppData\Local\FortniteGame\Saved\LMS
del  C:\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\EditorPerProjectUserSettings.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Engine.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Game.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\GameUserSettings.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Hardware.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Input.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Lightmass.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\PortalRegions.ini*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\65f6b08d488442e694b1e23d152d971e.dat*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\b371f0ee15b74eba84bd23830461130c.dat*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\OC_65f6b08d488442e694b1e23d152d971e.dat*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\OC_b371f0ee15b74eba84bd23830461130c.dat*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\cef3.log*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher.log*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher_2.log*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_0*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_1*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_2*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_3*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000001*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000002*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000004*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000005*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000006*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000007*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000008*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000009*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00000a*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00000b*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00000c*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00000d*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00000e*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00000f*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000010*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000011*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000012*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000013*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000014*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000015*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000016*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000017*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000018*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000019*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00001a*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00001b*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00001c*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00001d*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00001e*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00001f*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000020*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000021*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000022*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000023*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000024*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000025*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000026*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000027*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000028*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00002b*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00002c*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00002d*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00002e*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00002f*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000030*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000031*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000032*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000033*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000034*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000035*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000036*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000037*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000038*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000039*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00003a*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00003b*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00003c*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00003d*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00003e*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_00003f*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000040*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000041*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000042*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000043*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000044*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000045*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\f_000046*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\UE4CC-Windows-FA58D227408B75B949C1ECA1ABE0D4C7*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Demos*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Logs*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS\Files*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDir\EMS*.*
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe.local
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files:VersionCache
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\SharedFiles:VersionCache
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\XSettings.Sav
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Config
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\CacheAccess.json
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\09_SubgameSelect_Default_StW-512x1024-e47f51e25cbe9943678b9221056a808e81da40e3.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_BattleLabs_PlaylistTile-(2)-1024x512-ca5f4e84a2941264f787239caa5458d0eabd39e3.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_In-Game_Launch_Week1_SubgameSelect-512x1024-8b298ddfb13ca218af3f10017e4e989888212e9e.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_Launch_ModeTiles_Duos-1024x512-b73da22f5ef25695bd78814e0c708253a2cfd66b.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_Launch_ModeTiles_Solo-1024x512-867508f824d65b998c1e11180306eeb720b1aa11.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_Launch_ModeTiles_Squad-1024x512-4bca2b25311bd5b8c6bd4a4aa32b2bfa2fadbf78.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_LTM_Siphon_PlaylistTile-1024x512-712b3caea93ea8df09d1592c88d55913ad296526.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_LunarNewYear_GanPickaxe_MOTD_1920x1080-1920x1080-7c458359ec91e63c981ae8bae9498a590446c32b.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\BR06_ModeTile_TDM-1024x512-878ba9f92deb153ec85f2bcbce925e185344290e.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\C2CM_Launch_In-Game_Subgame_PropHunt-512x1024-c84b714dc3c2f4ec9dc966074c0c53deef2dc9.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\CM_LobbyTileArt-1024x512-fb48db36552ccb1ab4021b722ea29d515377cc.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Fbattleroyalenews%2F1140+HF%2F8ball_MOTD_1024x512-1024x512-b8690a2ee91e5ccfc2c9ab23561be0dda6ee55.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Duos-1024x512-a431d8587eb87ad5630eada21b60bca9874d116a.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Solo_ModeTile-1024x512-6cee09d7bcf82ce3f32ca7c77ca04948121ce617.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\DMS
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\*.*" >nul 2>&1
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Config\NoRedist\Windows\ShippableWindowsGameUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins\CurveEditorTools\AssetRegistry.bin
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins\Editor\CryptoKeys\AssetRegistry.bin
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins\Editor\CurveEditorTools\AssetRegistry.bin
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files:VersionCache
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\SharedFiles:VersionCache
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\XSettings.Sav
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Config
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\CacheAccess.json
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\09_SubgameSelect_Default_StW-512x1024-e47f51e25cbe9943678b9221056a808e81da40e3.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_BattleLabs_PlaylistTile-(2)-1024x512-ca5f4e84a2941264f787239caa5458d0eabd39e3.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_In-Game_Launch_Week1_SubgameSelect-512x1024-8b298ddfb13ca218af3f10017e4e989888212e9e.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_Launch_ModeTiles_Duos-1024x512-b73da22f5ef25695bd78814e0c708253a2cfd66b.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_Launch_ModeTiles_Solo-1024x512-867508f824d65b998c1e11180306eeb720b1aa11.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_Launch_ModeTiles_Squad-1024x512-4bca2b25311bd5b8c6bd4a4aa32b2bfa2fadbf78.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_LTM_Siphon_PlaylistTile-1024x512-712b3caea93ea8df09d1592c88d55913ad296526.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\11BR_LunarNewYear_GanPickaxe_MOTD_1920x1080-1920x1080-7c458359ec91e63c981ae8bae9498a590446c32b.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\BR06_ModeTile_TDM-1024x512-878ba9f92deb153ec85f2bcbce925e185344290e.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\C2CM_Launch_In-Game_Subgame_PropHunt-512x1024-c84b714dc3c2f4ec9dc966074c0c53deef2dc9.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\CM_LobbyTileArt-1024x512-fb48db36552ccb1ab4021b722ea29d515377cc.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Fbattleroyalenews%2F1140+HF%2F8ball_MOTD_1024x512-1024x512-b8690a2ee91e5ccfc2c9ab23561be0dda6ee55.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Duos-1024x512-a431d8587eb87ad5630eada21b60bca9874d116a.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0D9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Solo_ModeTile-1024x512-6cee09d7bcf82ce3f32ca7c77ca04948121ce617.jpg
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\DMS
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS\7e2a66ce68554814b1bd0aa1435171
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS\3460cbe1c57d4a838ace32951a4d7171
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS\a22d837b6a2b46349421259c0a5411bf
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS\ac0ac825f74a809ba2927ece3c3014
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS\b6c60402a72e4081a6a47c641371c19f
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS\b800b911053c4906a5bd399f46ae0055
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\EMS\c52c1f9246eb48ce9dade87be5a66f29
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\LMS\Manifest.sav
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Plugins
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
rmdir /s /q "%%systemdrive%%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Roaming\EasyAntiCheat\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\*.*"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Roaming\EasyAntiCheat"
del /s /q /f /a:h /a:a "%%systemdrive%%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys\*.* "
rmdir /s /q  "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.*"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud""
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys\*.*"
RD /s /q "%%localappdata%%\FortniteGame""
RD /s /q "%%localappdata%%\EpicGamesLauncher""
RD /s /q "%%localappdata%%\UnrealEngine""
RD /s /q "%%localappdata%%\UnrealEngineLauncher""
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files\*.*"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Roaming\EasyAntiCheat""
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys\*.*"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache""
rmdir /s /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient""
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame""
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\UnrealEngine"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
rmdir /s /q  "%%systemdrive%%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud"
del "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880\siphon-1024x512-4cc0ff3407053325e353c4aea55fb30316e6ecf6.jpg",
del "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Squad_ModeTile-1024x512-c543a187ce733be5ee9f6d17bfb74fb1f2e15f4a.jpg",
del "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Solo_ModeTile-1024x512-6cee09d7bcf82ce3f32ca7c77ca04948121ce617.jpg"
del "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cookies"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\*.*
del /f /s /q "@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\*.*"
rmdir /s /q "@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame"
@RD /S /Q "%localappdata%\FortniteGame"
@RD /S /Q "%localappdata%\EpicGamesLauncher"
@RD /S /Q "%localappdata%\UnrealEngine"
@RD /S /Q "%localappdata%\UnrealEngineLauncher"
cmd /C "del /f /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.* "
cmd /C "del /f /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.* "
cmd /C "del /f /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.* "
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f"
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security" /f"
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f"
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f"
reg delete "HKEY_LOCAL_MACHINE\Software\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\WOW6432Node\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\com.epicgames.launcher" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Hardware Survey" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Identifiers" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Hardware Survey" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Identifiers" /f
reg delete "HKEY_CLASSES_ROOT\com.epicgames.launcher" /f
reg delete "HKEY_CLASSES_ROOT\com.epicgames.launcher" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Epic Games" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\EpicGames" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Installer\Dependencies" /v MSICache /f
reg delete "HKEY_CURRENT_USER\Software\Classes\com.epicgames.launcher" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Hardware Survey" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Identifiers" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Direct3D" /v WHQLClass /f
reg delete "HKEY_CURRENT_USER\Software\WOW6432Node\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\com.epicgames.launcher" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\EpicGames" /f
reg delete "HKEY_USERS\S-1-5-21-2097722829-2509645790-3642206209-1001\Software\Epic Games" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Type: 0x00000010" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Start: 0x00000003" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ErrorControl: 0x00000001" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ImagePath: ""%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe""" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\DisplayName: "EasyAntiCheat"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\WOW64: 0x0000014C" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Description: "Provides integrated security and services for online multiplayer games."" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat\GamesInstalled: "217;"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Type: 0x00000010" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Start: 0x00000003" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ErrorControl: 0x00000001" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ImagePath: ""%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe""" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\DisplayName: "EasyAntiCheat"" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\WOW64: 0x0000014C" /f
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\*.*" >nul 2>&1
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\*.*" >nul 2>&1
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*
del /f /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\*.*
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud"
@del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys\*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f"
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security" /f"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%%systemdrive%%\Users\%%username%%\AppData\Local\UnrealEngine\* .*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*" >nul 2>&1
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.*" >nul 2>&1
del /f /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*
del /f /s /q "%systemdrive%\Users\%%username%%\AppData\Local\UnrealEngine\*.*
del /f /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*
del /f /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*
del /f /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*
del /f /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*
del /f /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*
del /f /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*"
RD /S /Q "%%localappdata%%\FortniteGame"
RD /S /Q "%%localappdata%%\EpicGamesLauncher"
RD /S /Q "%%localappdata%%\UnrealEngine"
RD /S /Q "%%localappdata%%\UnrealEngineLauncher"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Roaming\EasyAntiCheat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\*.*"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Roaming\EasyAntiCheat"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys\*.*"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
rmdir /s /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher"
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files"
reg delete "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping_EAC.exe:  B1 8A B0 E9 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\EasyAntiCheat\EasyAntiCheat_Setup.exe:  73 D5 4B 11 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-2532382528-581214834-2534474248-1001\\Device\HarddiskVolume3\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe:  E7 CB 84 E9 8D 13 D5 01 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Type: 0x00000010" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Start: 0x00000003" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\ErrorControl: 0x00000001" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\ImagePath: ""%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe""" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\DisplayName: "EasyAntiCheat"" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\WOW64: 0x0000014C" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\ObjectName: "LocalSystem"" /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Description: "Provides integrated security and services for online multiplayer games. /f"
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame" 
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame"  
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav"
rmdir /s /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys"
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS"
rmdir /s /q "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage"  
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*
del /f /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\*.*
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\*.*
del /f /s /q "%systemdrive%\Recovery\ntuser.sys\*.*
del /f /s /q "%systemdrive%\Users\Public\Libraries\collection.dat\*.*
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir"
@del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys\*.*
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
@del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys\*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye\*.*
RD /s /q "%systemdrive%\Users\%Username%\AppData\Local\BattlEye"
del /s /q  "%systemdrive%\Users\%Username%\AppData\Local\BattlEye" do rmdir "%%p"
RD /s /q "%systemdrive%\Users\%Username%\AppData\Local\BattlEye"
RD /s /q "%systemdrive%\Users\%Username%\AppData\Local\BattlEye"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Compat.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\EditorPerProjectUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Engine.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Game.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Hardware.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Input.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\Lightmass.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\PortalRegions.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\CrashReportClient\UE4CC-Windows-3F785CCB48B0E4F697FA2DA1403F027A\CrashReportClient.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\CrashReportClient\UE4CC-Windows-D36903E04AEBB495D1D6A58F05AC6671\CrashReportClient.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\CrashReportClient\UE4CC-Windows-F219A7F84FE8B0694E2FACB917EF2D34\CrashReportClient.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\47d12477ed4c40cab8623c53ea967927.dat
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher-backup-2020.01.28-07.02.36.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher-backup-2020.01.28-09.00.40.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher-backup-2020.01.28-09.00.50.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher_2.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\SelfUpdatePrereqInstall.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\SelfUpdatePrereqInstall_0_PortalPrereqSetup.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\LOG.old
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Local Storage\https_www.epicgames.com_0.localstorage-journal
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\6dfe4cbf-2643-41f6-977a-7f1e6f36a2f2\index-dir\the-real-index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\LOG.old
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\2cc80dabc69f58b6_0
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\2cc80dabc69f58b6_1
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\HardwareSurvey\dxdiag.txtdel /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Compat.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\EditorPerProjectUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Engine.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Game.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\GameUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Hardware.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Input.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Lightmass.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\MessagingDebugger.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\PortalRegions.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Scalability.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\UdpMessaging.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\VisualStudioSourceCodeAccess.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\XCodeSourceCodeAccess.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\Common Files\BattlEye
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\CommonFiles\BattlEye\BEDaisy.sys\
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\EasyAntiCheat
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\Epic Games\Launcher\Engine\Programs\CrashReportClient\Config\DefaultEngine.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\Epic Games\Launcher\VaultCache
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\EpicGames\Launcher\Portal\Binaries\Win32
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\EpicGames\Launcher\Portal\Binaries\Win32\
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)\Epic Games\Launcher\Engine\Config\Base.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)\Epic Games\Launcher\Engine\Config\BaseGame.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)\Epic Games\Launcher\Engine\Config\BaseInput.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)\Epic Games\Launcher\Engine\Config\Windows\BaseWindowsLightmass.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)\Epic Games\Launcher\Engine\Config\Windows\WindowsGame.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)\Epic Games\Launcher\Portal\Config\UserLightmass.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)Epic Games\Launcher\Engine\Config\BaseHardware.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)Epic Games\Launcher\Portal\Config\NotForLicensees\Windows\WindowsHardware.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files(x86)Epic Games\Launcher\Portal\Config\UserScalability.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite1\FortniteGame\PersistentDownloadDir\CMS
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite1\FortniteGame\PersistentDownloadDir\EMS
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Config\NoRedist\Windows\ShippableWindowsGameUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins\CurveEditorTools\AssetRegistry.bin
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins\Editor\CryptoKeys\AssetRegistry.bin
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\Engine\Plugins\Editor\CurveEditorTools\AssetRegistry.bin
@del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe.local
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files:VersionCache
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\SharedFiles:VersionCache
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\XSettings.Sav
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Config
el /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\current
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\EpicGamesLauncher\BuildNotificationsV2.json
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\EpicGamesLauncher\TheBridge.png
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage\
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\Manifests\332441564059B197BCE9A18EBB26CE7F.item
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\Manifests\Pending
del /s /q /f /a:h /a:a "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\Manifests\Pending\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\GameUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\1e4f55431a9a45a2aee75300b31632b3.dat
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\cef3.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\EpicGamesLauncher.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\blob_storage\b141f05c-60b5-4a70-8565-3bd967e47be0
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_0
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_1
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_2
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\data_3
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cookies-journal
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\databases\Databases.db
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\data_0
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\data_1
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\data_2
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\data_3
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\000003.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\LOCK
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\LOG
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb\MANIFEST-000001
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Local Storage\https_payment-website-pci.ol.epicgames.com_0.localstorage
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Local Storage\https_payment-website-pci.ol.epicgames.com_0.localstorage-journal
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Local Storage\https_ssl.kaptcha.com_0.localstorage
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Local Storage\https_ssl.kaptcha.com_0.localstorage-journal
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Local Storage\https_www.epicgames.com_0.localstorage
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\QuotaManager
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\QuotaManager-journal
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\d7fef8f9-801d-49d9-a684-6babe0ef53ca
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\d7fef8f9-801d-49d9-a684-6babe0ef53ca\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\d7fef8f9-801d-49d9-a684-6babe0ef53ca\index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\d7fef8f9-801d-49d9-a684-6babe0ef53ca\index-dir
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\d7fef8f9-801d-49d9-a684-6babe0ef53ca\index-dir\the-real-index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\e6a49143-8892-41ce-8a92-f2ec698a4ab8
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\e6a49143-8892-41ce-8a92-f2ec698a4ab8\index-dir
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\e6a49143-8892-41ce-8a92-f2ec698a4ab8\index-dir\the-real-index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\f825e79d-e5c6-4583-ad21-9af36ff4ec56
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\f825e79d-e5c6-4583-ad21-9af36ff4ec56\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\f825e79d-e5c6-4583-ad21-9af36ff4ec56\index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\f825e79d-e5c6-4583-ad21-9af36ff4ec56\index-dir
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\f825e79d-e5c6-4583-ad21-9af36ff4ec56\index-dir\the-real-index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\index.txt
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\000003.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\CURRENT
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\LOCK
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\LOG
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database\MANIFEST-000001
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index-dir\the-real-index
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\ServiceWorker\CacheStorage
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\ServiceWorker\CacheStorage\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Visited Links
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\\Config\WindowsClient\GameUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\ClientSettings.Sav
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\1e4f55431a9a45a2aee75300b31632b3
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\1e4f55431a9a45a2aee75300b31632b3\ClientSettings.Sav
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Logs\FortniteGame.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\Unreal Engine\Engine\Config\UserGameUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\4.23\Saved\Config\WindowsClient\Manifest.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\4.24\Saved\Config\WindowsClient\Manifest.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\updater.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\217
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\217\easyanticheat_wow64_x64.eac
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\217\easyanticheat_wow64_x64.eac.metadata
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\217\loader.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\gamelauncher.log
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\Documents\Unreal Engine\Engine\Config\UserGameUserSettings.ini
del /s /q /f /a:h /a:a "%systemdrive%\Users\All Users\Epic\EpicGamesLauncher\Data\EMS\current
del /s /q /f /a:h /a:a "%systemdrive%\Users\All Users\Epic\EpicGamesLauncher\Data\EMS\EpicGamesLauncher\BuildNotificationsV2.json
del /s /q /f /a:h /a:a "%systemdrive%\Users\All Users\Epic\EpicGamesLauncher\Data\EMS\EpicGamesLauncher\TheBridge.png
del /s /q /f /a:h /a:a "%systemdrive%\Users\All Users\Epic\UnrealEngineLauncher\LauncherInstalled.dat
del /s /q /f /a:h /a:a "%systemdrive%\Users\All Users\Epic\EpicGamesLauncher\Data\EMS
del /s /q /f /a:h /a:a "%systemdrive%\Users\All Users\Epic\UnrealEngineLauncher
del /s /q /f /a:h /a:a "%systemdrive%\Windows\Prefetch\EASYANTICHEAT.EXE-4E9E548C.pf
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\UnrealEngine\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.*"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\UnrealEngine\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.* "
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\UnrealEngine"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
rmdir /s /q "%%systemdrive%%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS"
rmdir /s /q "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud"
del /s /q /f /a:h /a:a "%%systemdrive%%\Users\%%username%%\AppData\Roaming\EasyAntiCheat\*.* "
del /s /q /f /a:h /a:a "%%systemdrive%%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys\*.* "
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Recovery\ntuser.sys\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\UnrealEngine\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS\*.*"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud\*.*"
RD /s /q "%%localappdata%%\EpicGamesLauncher""
RD /s /q "%%localappdata%%\UnrealEngine""
RD /s /q "%%localappdata%%\UnrealEngineLauncher""
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\Recovery\Active\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%%username%%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\#!002\MicrosoftEdge\User\Default\AppCache\*.*" >nul 2>&1"
del /s /q /f /a:h /a:a "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\Shared Files\*.*"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Roaming\EasyAntiCheat""
del /s /q /f /a:h /a:a "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys\*.*"
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache""
rmdir /s /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient""
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher""
rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame""
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\UnrealEngine"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\Logs"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Config\WindowsClient"
rmdir /s /q  "%%systemdrive%%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\LMS"
rmdir /s /q  "%%systemdrive%%\Users\%%username%%\AppData\Local\FortniteGame\Saved\Cloud"
del "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880\siphon-1024x512-4cc0ff3407053325e353c4aea55fb30316e6ecf6.jpg",
del "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Squad_ModeTile-1024x512-c543a187ce733be5ee9f6d17bfb74fb1f2e15f4a.jpg",
del "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS\Files\9A71EB4A90946A4A0DCD9B7D82F48C55B49D0880\Fortnite%2Ffortnite-game%2Ftournaments%2F11BR_Arena_ModeTiles_Solo_ModeTile-1024x512-6cee09d7bcf82ce3f32ca7c77ca04948121ce617.jpg"
del "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cookies"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Demos\*.*"
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache\*.*
@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\*.*
del /f /s /q "@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\*.*"
rmdir /s /q "@del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame"
cmd /C "RD /s /q "%systemdrive%\Users\%%username%%\AppData\Local\BattlEye" "
cmd /C "del /s /q  "%systemdrive%\Users\%%username%%\AppData\Local\BattlEye" do rmdir "%%p" "
cmd /C "del /s /q  "%systemdrive%\Users\%%username%%\AppData\Local\CrashReportClient" do rmdir "%%p" "
cmd /C "RD /s /q "%systemdrive%\Users\%%username%%\AppData\Local\D3DSCache" "
cmd /C "del /s /q  "%systemdrive%\Users\%%username%%\AppData\Local\D3DSCache" do rmdir "%%p" "
cmd /C "RD /s /q "%systemdrive%\Users\%%username%%\AppData\Local\DBG" "
cmd /C "del /s /q "%systemdrive%\Users\%%username%%\AppData\Local\DBG" do rmdir "%%p" "
cmd /C "RD /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher" "
cmd /C "del /s /q "%systemdrive%\Users\%%username%%\AppData\Local\EpicGamesLauncher" do rmdir "%%p" "
cmd /C "RD /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame" "
cmd /C "del /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame" do rmdir "%%p" "
cmd /C "RD /s /q "%systemdrive%\Users\%%username%%\AppData\Roaming\EasyAntiCheat" "
cmd /C "del /s /q "%systemdrive%\Users\%%username%%\AppData\Roaming\EasyAntiCheat" do rmdir "%%p" "
cmd /C "rmdir /s /q "%systemdrive%\Users\%%username%%\AppData\Local\FortniteGame" "
cmd /C "del /s /f /a:h /a:a /q %%USERPROFILE%%\appdata\local\Temp\338e89b.tmp "
cmd /C "del /s /f /a:h /a:a /q %%USERPROFILE%%\appdata\roaming\EasyAntiCheat "
cmd /C "del /s /f /a:h /a:a /q %%USERPROFILE%%\appdata\local\FortniteGame\ "
cmd /C "del /s /f /a:h /a:a /q %%USERPROFILE%%\appdata\local\EpicGamesLauncher\ "
cmd /C "RD /s /f /a:h /a:a /q %%USERPROFILE%%\appdata\local\FortniteGame "
cmd /C "RD /s /f /a:h /a:a /q %%USERPROFILE%%\appdata\local\EpicGamesLauncher "
del /s /q "%systemdrive%\Users\%Username%\AppData\Local\BattlEye" do rmdir "%%p"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\CrashReportClient
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\CrashReportClient\UE4CC-Windows-655756964A59ED47CFA1499FDA5AFE4F
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Config\Windows
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Data\Staged
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\HardwareSurvey
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\blob_storage
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\blob_storage\2adf1466-4806-45dc-b7b0-a1d323f2adc6
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Cache
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\databases
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\GPUCache
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\IndexedDB\https_www.epicgames.com_0.indexeddb.leveldb
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Local Storage
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\5dbdef24-37ef-4a7a-ba75-ee9bc4a22645
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\5dbdef24-37ef-4a7a-ba75-ee9bc4a22645\index-dir
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\b90b1134-2a94-4983-be85-2c213daffc4d
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\b90b1134-2a94-4983-be85-2c213daffc4d\index-dir
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\dacadf8b-e278-424e-8f13-649b4a298a56
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\CacheStorage\e60030e2e5440743857a39ca108634434c91f1\dacadf8b-e278-424e-8f13-649b4a298a56\index-dir
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\Database
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache\Service Worker\ScriptCache\index-dir
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\HiddenWebhelperCache\Service Worker\ScriptCache\index-dir
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security" /f
rmdir /s /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys"
rmdir /s /q "%systemdrive%\Program Files (x86)\TeamViewer\Connections_incoming.txt"
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS"
rmdir /s /q "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage"
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\d945f059b8b54aa58202ed2989bebfc8
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient\UE4CC-Windows-AED3596C4ADFAC4DB9E422A6546810D3
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Config\WindowsClient
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Demos
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS
del /s /q /f /a:h /a:a "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\Logs
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav\*.*"
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\EpicGamesLauncher\ >nul 2>&1
del /s /f /a:h /a:a /q %USERPROFILE%\appdata\local\FortniteGame\ >nul 2>&1
del /s /q  "%systemdrive%\Users\%Username%\AppData\Local\BattlEye" do rmdir "%%p"
del /s /q "%systemdrive%\Users\%Username%\AppData\Local\EpicGamesLauncher" do rmdir "%%p"
del /s /q "%systemdrive%\Users\%Username%\AppData\Local\FortniteGame" do rmdir "%%p"
rmdir /s /q "%systemdrive%\Program Files (x86)\Common Files\BattlEye\BEDaisy.sys"
rmdir /s /q "%systemdrive%\Program Files\Epic Games\Fortnite\FortniteGame\PersistentDownloadDir\CMS"
rmdir /s /q "%systemdrive%\ProgramData\Epic\EpicGamesLauncher\Data\EMS\stage"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher\Intermediate\Config\CoalescedSourceConfigs\Engine.ini"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame"
rmdir /s /q "%systemdrive%\Users\%USERPROFILE%\AppData\Local\FortniteGame" >nul 2>&1
rmdir /s /q "%systemdrive%\Users\%USERPROFILE%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav" >nul 2>&1
rmdir /s /q "%systemdrive%\Users\%USERPROFILE%\AppData\Local\Microsoft\Feeds" >nul 2>&1
rmdir /s /q "%systemdrive%\Users\%USERPROFILE%\AppData\Local\Temp" >nul 2>&1
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\EpicGamesLauncher"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame" 
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame"  
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\FortniteGame\Saved\LMS\Manifest.sav"  
Del C:\Users%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDel\CMS\Dels\C28FF1DE0C661DAF01E118A30B3F21B897A7A6E2\0C8034B96B942EC00042C1D6BB25F8E1ADEDC566
Del C:\Users%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDel\CMS\Dels\C28FF1DE0C661DAF01E118A30B3F21B897A7A6E2\D448A2D69B897D0CA64BC7EAD63C82B135B28C90
Del C:\Users%username%\AppData\Local\FortniteGame\Saved\PersistentDownloadDel\CMS\Dels\C28FF1DE0C661DAF01E118A30B3F21B897A7A6E2\EB595625E08C501F5484D4F4FE7EB7A3D7AD7582
Del C:\Users%username%\AppData\Local\FortniteGame\Saved\Demos