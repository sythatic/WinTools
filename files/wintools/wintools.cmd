@echo off
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
cd %SystemRoot%\System32
echo:
echo   [104m WinTools [0m
echo   [90mv1.0.1 [0m
echo:
:prompt
echo   [7m Available Commands [0m
echo:
echo   [97mExit WinTools                               [93m[exit] [0m
echo:
echo   [97mEnable Built-in Administrator               [92m[admin -y/-n]
echo   [97mWindows Advanced Startup                    [92m[bootops]
echo   [97mClear Icon Cache                            [92m[clrico]
echo   [97mDeployment Image Servicing and Management   [92m[dism]
echo   [97mSuspend File Explorer                       [92m[killfe]
echo   [97mGet OEM Product Key                         [92m[prodkey]
echo   [97mSystem File Checker                         [92m[sfc]
echo   [97mSet System Information                      [92m[sysinfo]
echo   [97mPatch Windows 11                            [92m[winpatch]
echo:
:cmd
set "modify="
set /p modify="[0m  $: "
if /i "%modify%"=="exit" exit
if /i "%modify%"=="help" (
    echo: 
    goto prompt
)
if /i "%modify%"=="admin" (
    echo:
    echo [93m    [Invalid Argument/Option] [0m
    echo:
    echo        use 'admin -y' to enable 
    echo        use 'admin -n' to disable
    echo:
    goto cmd
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
    echo $: [92mshutdown /r /o /f /t 00[0m
    echo:
    shutdown /r /o /f /t 00
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
if /i "%modify%"=="winpatch" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\PCHC" /v "PreviousUninstall" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\PCHealthCheck" /v "installed" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableBlurBehind" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d 0 /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f
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
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /f /v "StartupDelayInMSec" /t REG_DWORD /d 0
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /f /v "JPEGImportQuality" /t REG_DWORD /d 100
    reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /f /v "LargeSystemCache" /t REG_DWORD /d 1
    reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection" /f /v "AllowTelemetry" /t REG_DWORD /d 0
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll" /f
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell" /f
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open" /f /v "MuiVerb" /t REG_SZ /d "@photoviewer.dll,-3043"
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\command" /f /v "" /t REG_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1"
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print" /f
    reg add "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command" /f /v "" /t REG_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_PrintTo %1"
    reg add "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /f /ve /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}"
    reg add "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /f /ve /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}"
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ServerAdminUI" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontPrettyPath" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MapNetDrvBtn" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseCompactMode" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowEncryptCompressedColor" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllCloudStates" /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /t REG_DWORD /d 0 /f
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
