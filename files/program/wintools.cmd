:debug
@echo off & title WinTools
net session >nul 2>&1
if %errorLevel% equ 0 (
    goto top
) else (
    echo:
    echo [43m This script must be run as Administrator [0m
    echo:
    pause
    exit
)
:top
cd %SystemRoot%
echo:
echo   [104m WinTools [0m
echo   [90m22H2 [0m
echo:
:prompt
echo   [7m Commands [0m
echo:
echo   [97mToggle Built-in Administrator               [93m[admin -y/-n]
echo   [97mAppx Package Uninstaller                    [93m[appxmgr]
echo   [97mInitiate Advanced Startup                   [93m[bootops]
echo   [97mClear Icon Cache                            [93m[clrico]
echo   [97mDISM System Recovery                        [93m[dism]
echo   [97mAdd an Environmental Variable               [93m[envar]
echo   [97mEnable Windows Photo Viewer                 [93m[getphotoview]
echo   [97mHTTP Index Downloader                       [93m[indexdl]
echo   [97mSuspend File Explorer                       [93m[killfe]
echo   [97mGet OEM Product Key                         [93m[prodkey]
echo   [97mSet Powershell Execution Policy             [93m[pspedit]
echo   [97mSet Remote Desktop Port                     [93m[rdport]
echo   [97mSystem File Checker                         [93m[sfc]
echo   [97mReboot to UEFI/BIOS                         [93m[sysfw]
echo   [97mSet System Information                      [93m[sysinfo]
echo   [97mBypass TPM Appraisers                       [93m[tpmbypass]
echo   [97mPatch Windows 11                            [93m[winpatch]
echo:
echo   [97mExit WinTools                               [91m[exit] [0m
echo:
:cmd
set "modify="
set /p modify="[0m  $: "
if /i "%modify%"=="debug" goto debug
if /i "%modify%"=="exit" exit
if /i "%modify%"=="help" (
    echo: 
    goto prompt
)
if /i "%modify%"=="admin" (
    echo:
    echo [93m    [Invalid Argument/Option] [0m
    echo:
    echo        use [93m[admin -y][0m to enable 
    echo        use [93m[admin -n][0m to disable
    echo:
    goto cmd
)
if /i "%modify%"=="appxmgr" (
    echo:
    cd %SystemRoot%\wintools\applets
    powershell ".\appxmgr.ps1"
    cd %SystemRoot%
    echo: 
    goto prompt
)
if /i "%modify%"=="admin -y" (
    echo:
    echo $: [92mnet user administrator /active:yes[0m
    echo:
    net user administrator /active:yes
    echo:
    goto prompt
)
if /i "%modify%"=="admin -n" (
    echo:
    echo $: [92mnet user administrator /active:no[0m
    echo:
    net user administrator /active:no
    echo:
    goto prompt
)
if /i "%modify%"=="bootops" (
    echo:
    echo $: [92mshutdown /r /o /t 00[0m
    echo:
    shutdown /r /o /t 00
    echo:
    goto prompt
)
if /i "%modify%"=="clrico" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    cd /d %userprofile%\AppData\Local
    del "IconCache.db" /a
    cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer
    attrib -h "iconcache_*.db"
    del "iconcache_*.db"
    cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer
    attrib -h "thumbcache_*.db"
    del "thumbcache_*.db"
    echo:
    start explorer.exe
    cd %SystemRoot%
    echo:
    goto prompt
)
if /i "%modify%"=="dism" (
    echo:
    echo $: [92mdism /Online /Cleanup-Image /RestoreHealth[0m
    echo:
    dism /Online /Cleanup-Image /RestoreHealth
    echo:
    pause
    echo:
    goto prompt
)
if /i "%modify%"=="envar" (
    echo:
    echo   [7m Add an Environmental Variable [0m
    echo:
    set /p evar="[0m  Variable: "
    echo:
    set /p eval="[0m  Value: "
    echo:
    taskkill /f /im explorer.exe
    echo:
    setx %evar% %eval% /M
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="getphotoview" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll" /f
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell" /f
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open" /f /v "MuiVerb" /t REG_SZ /d "@photoviewer.dll,-3043"
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\command" /f /v "" /t REG_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1"
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print" /f
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command" /f /v "" /t REG_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_PrintTo %1"
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="indexdl" (
    echo:
    cd %SystemRoot%\wintools\applets
    powershell ".\indexdl.ps1"
    cd %SystemRoot%
    echo: 
    goto prompt
)
if /i "%modify%"=="killfe" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    pause
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="prodkey" (
    echo:
    echo $: [92mSoftwarelicensingservice get OA3xOriginalProductKey[0m
    echo:
    wmic path Softwarelicensingservice get OA3xOriginalProductKey
    echo:
    goto prompt
)
if /i "%modify%"=="pspedit" (
    echo: 
    echo [90m   [Undefined][0m
    echo     - There is no execution policy set in the current scope.
    echo     - If the execution policy in all scopes is Undefined, the policy is set to default.
    echo:
    echo [94m   [Restricted][0m
    echo     - Permits individual commands.
    echo     - Prevents running of all script files.
    echo:
    echo [96m   [Default][0m
    echo     - Restricted for Windows clients.
    echo     - RemoteSigned for Windows servers.
    echo:
    echo [92m   [AllSigned][0m
    echo     - Requires all scripts files be signed, including scripts written on the local computer.
    echo     - Prompts you before running scripts from publishers that you haven't yet classified as trusted or untrusted.
    echo:
    echo [93m   [RemoteSigned][0m
    echo     - Requires a signature on scripts downloaded from the internet.
    echo     - Doesn't require a signature on scripts written on the local computer.
    echo     - Runs unblocked, unsigned scripts downloaded from the internet.
    echo:
    echo [91m   [Unrestricted][0m
    echo     - Unsigned scripts can run.
    echo     - Warns the user before running non-local scripts.
    echo:
    echo [95m   [Bypass][0m
    echo     - Nothing is blocked and there are no warnings or prompts.
    echo     - There is a risk of running malicious scripts. 
    echo: 
    echo Current Policy:
    powershell "Get-ExecutionPolicy"
    powershell "Set-ExecutionPolicy"
    echo:  
    echo New Policy:
    powershell "Get-ExecutionPolicy"
    echo: 
    goto prompt
)
if /i "%modify%"=="rdport" (
    echo:
    cd %SystemRoot%\wintools\applets
    powershell ".\rdport.ps1"
    cd %SystemRoot%
    echo: 
    goto prompt
)
if /i "%modify%"=="sfc" (
    echo:
    echo $: [92msfc /scannow[0m
    echo:
    sfc /scannow
    echo:
    pause
    echo:
    goto prompt
)
if /i "%modify%"=="sysfw" (
    echo:
    echo $: [92mshutdown /r /fw /t 00[0m
    echo:
    shutdown /r /fw /t 00
    echo:
    goto prompt
)
if /i "%modify%"=="sysinfo" (
    echo:
    echo   [7m Enter System Information [0m
    echo:
    set /p brand="[0m  Manufacturer: "
    echo:
    set /p model="[0m  Model: "
    echo:
    set /p url="[0m  Support URL: "
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /v Manufacturer /d "%brand%" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /v Model /d "%model%" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /v SupportURL /d "%url%" /f
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="tpmbypass" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg add "HKEY_LOCAL_MACHINE\System\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\System\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\System\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\System\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d 1 /f
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="winpatch" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d 0 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightWindowsWelcomeExperience" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightOnActionCenter" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightOnSettings" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent" /v "ConfigureWindowsSpotlight" /t REG_DWORD /d 2 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent" /v "IncludeEnterpriseSpotlight" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /f /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /f /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d 0
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "BingSearchEnabled" /t REG_DWORD /d 0
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d 0 /f

    reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /v "" /t REG_SZ /d ""
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization" /f /v "NoLockScreen" /t REG_DWORD /d 1
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "verbosestatus" /t REG_DWORD /d 1    
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ServerAdminUI" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MapNetDrvBtn" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowEncryptCompressedColor" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllCloudStates" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d 0 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /f /v "JPEGImportQuality" /t REG_DWORD /d 100
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection" /f /v "AllowTelemetry" /t REG_DWORD /d 0

    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /f /v "StartupDelayInMSec" /t REG_DWORD /d 0
    reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /f /v "LargeSystemCache" /t REG_DWORD /d 1

    reg add "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /f /ve /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}"
    reg add "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /f /ve /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}"
        
    ::reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWUfBSafeguards" /t REG_DWORD /d 1 /f
    ::reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 4 /f
    ::reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\PCHC" /v "PreviousUninstall" /t REG_DWORD /d 1 /f
    ::reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\PCHealthCheck" /v "installed" /t REG_DWORD /d 1 /f

    setx Themes "shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}" /M 
    setx AllTasks "shell:::{ED7BA470-8E54-465E-825C-99712043E01C}" /M 
    echo:
    start explorer.exe
    echo:
    goto prompt
) else (
    echo:
    echo [93m    [Command Not Found]
    echo:
    goto cmd
)
echo:
echo [91m    [Error]
echo:
goto prompt