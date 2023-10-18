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
echo:
echo   [104m WinTools [0m
echo   [90m22H2 [0m
echo:
:prompt
cd %SystemRoot%
echo   [7m Commands [0m
echo:
echo   [97mToggle Built-in Administrator               [93m[admin -y/-n]
echo   [97mAppx Package Uninstaller                    [93m[appxmgr]
echo   [97mInitiate Advanced Startup                   [93m[bootops]
echo   [97mClear Icon Cache                            [93m[clrico]
echo   [97mDISM System Recovery                        [93m[dism]
echo   [97mAdd an Environment Variable                 [93m[envar]
echo   [97mHTTP Index Downloader                       [93m[indexdl]
echo   [97mSuspend File Explorer                       [93m[killfe]
echo   [97mGet OEM Product Key                         [93m[prodkey]
echo   [97mSet Powershell Execution Policy             [93m[pspedit]
echo   [97mSet Remote Desktop Port                     [93m[rdport]
echo   [97mSystem File Checker                         [93m[sfc]
echo   [97mReboot to UEFI/BIOS                         [93m[sysfw]
echo   [97mSet System Information                      [93m[sysinfo]
echo   [97mBypass TPM Appraisers                       [93m[tpmbypass]
echo   [97mRestore Classic Functionality               [93m[winpatch]
echo   [97mRestore Default Functionality               [93m[winpatch -r]
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
    powershell "%SystemRoot%\wintools\applets\appxmgr.ps1"
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
    cd /d %LOCALAPPDATA%\Microsoft\Windows\Explorer
    attrib -h "iconcache_*.db"
    del "iconcache_*.db"
    cd /d %LOCALAPPDATA%\Microsoft\Windows\Explorer
    attrib -h "thumbcache_*.db"
    del "thumbcache_*.db"
    cd %SystemRoot%
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
if /i "%modify%"=="indexdl" (
    echo:
    powershell "%SystemRoot%\wintools\applets\indexdl.ps1"
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
    powershell "%SystemRoot%\wintools\applets\rdport.ps1"
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
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /f /v "Manufacturer" /d "%brand%"
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /f /v "Model" /d "%model%"
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /f /v "SupportURL" /d "%url%"
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="tpmbypass" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg add "HKLM\System\Setup\LabConfig" /f /v "BypassTPMCheck" /t REG_DWORD /d 1
    reg add "HKLM\System\Setup\LabConfig" /f /v "BypassRAMCheck" /t REG_DWORD /d 1
    reg add "HKLM\System\Setup\LabConfig" /f /v "BypassSecureBootCheck" /t REG_DWORD /d 1
    reg add "HKLM\System\Setup\MoSetup" /f /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d 1
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="winpatch" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /f /v "AllowCloudSearch" /t REG_DWORD /d 0
    reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /f /v "AllowCortana" /t REG_DWORD /d 0
    reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /f /v "AllowCortanaAboveLock" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "CortanaEnabled" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "CortanaConsent" /t REG_DWORD /d 0
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f /v "DisableWindowsSpotlightWindowsWelcomeExperience" /t REG_DWORD /d 1
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d 1
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f /v "DisableWindowsSpotlightOnActionCenter" /t REG_DWORD /d 1
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f /v "DisableWindowsSpotlightOnSettings" /t REG_DWORD /d 1
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f /v "ConfigureWindowsSpotlight" /t REG_DWORD /d 2
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f /v "IncludeEnterpriseSpotlight" /t REG_DWORD /d 0
    reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /f /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /f /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "BingSearchEnabled" /t REG_DWORD /d 0
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v "AllowOnlineTips" /t REG_DWORD /d 0

    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve /t REG_SZ /d ""
    reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /f /v "NoLockScreen" /t REG_DWORD /d 1
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "verbosestatus" /t REG_DWORD /d 1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "StartShownOnUpgrade" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "DisallowShaking" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "MapNetDrvBtn" /t REG_DWORD /d 1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "AutoCheckSelect" /t REG_DWORD /d 1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideMergeConflicts" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "ShowEncryptCompressedColor" /t REG_DWORD /d 1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "NavPaneShowAllCloudStates" /t REG_DWORD /d 1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "DisablePreviewDesktop" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "LaunchTo" /t REG_DWORD /d 1
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /f /v "PeopleBand" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v "HideSCAMeetNow" /t REG_DWORD /d 1
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v "HideSCAMeetNow" /t REG_DWORD /d 1
    reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /f /v "HidePeopleBar" /t REG_DWORD /d 1
    reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /f /v "HidePeopleBar" /t REG_DWORD /d 1
    reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /f /v "EnableFeeds" /t REG_DWORD /d 0
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Feeds" /f /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /f /v "TaskbarEndTask" /t REG_DWORD /d 1
    reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /f /v "AllowTelemetry" /t REG_DWORD /d 0

    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "SeparateProcess" /t REG_DWORD /d 1
    reg add "HKCU\Control Panel\Desktop" /f /v "JPEGImportQuality" /t REG_DWORD /d 100
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /f /v "StartupDelayInMSec" /t REG_DWORD /d 0
    reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /f /v "LargeSystemCache" /t REG_DWORD /d 1

    reg add "HKCR\SystemFileAssociations\image\shell\open\command" /f
    reg add "HKCR\Applications\photoviewer.dll\shell\open" /f /v "MuiVerb" /t REG_SZ /d "@photoviewer.dll,-3043"
    reg add "HKCR\Applications\photoviewer.dll\shell\open\command" /f /ve /t REG_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1"
    reg add "HKCR\Applications\photoviewer.dll\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKCR\Applications\photoviewer.dll\shell\print\command" /f /ve /t REG_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_PrintTo %1"
    reg add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /f /v "ApplicationDescription" /t REG_EXPAND_SZ /d "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3069"
    reg add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /f /v "ApplicationName" /t REG_EXPAND_SZ /d "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3009"

    reg add "HKCR\PhotoViewer.FileAssoc.Bitmap" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Bitmap\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Bitmap\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Bitmap\shell\open" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Bitmap\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Bitmap\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".bmp" /t REG_SZ /d "PhotoViewer.FileAssoc.Bitmap"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".dib" /t REG_SZ /d "PhotoViewer.FileAssoc.Bitmap"

    reg add "HKCR\PhotoViewer.FileAssoc.JFIF" /f /v "EditFlags" /t REG_DWORD /d 65536
    reg add "HKCR\PhotoViewer.FileAssoc.JFIF" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.JFIF\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.JFIF\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open" /f /v "MuiVerb" /t REG_EXPAND_SZ /d "C:\Windows Photo Viewer\PhotoViewer.dll,-3043"
    reg add "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.JFIF\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".jfif" /t REG_SZ /d "PhotoViewer.FileAssoc.JFIF"

    reg add "HKCR\PhotoViewer.FileAssoc.Jpeg" /f /v "EditFlags" /t REG_DWORD /d 65536
    reg add "HKCR\PhotoViewer.FileAssoc.Jpeg" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Jpeg\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Jpeg\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open" /v "MuiVerb" /f /t REG_EXPAND_SZ /d "C:\Windows Photo Viewer\PhotoViewer.dll,-3043"
    reg add "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Jpeg\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".jpeg" /t REG_SZ /d "PhotoViewer.FileAssoc.Jpeg"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".jpg" /t REG_SZ /d "PhotoViewer.FileAssoc.Jpeg"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".jpe" /t REG_SZ /d "PhotoViewer.FileAssoc.Jpeg"

    reg add "HKCR\PhotoViewer.FileAssoc.Gif" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Gif\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Gif\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Gif\shell\open" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Gif\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Gif\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".gif" /t REG_SZ /d "PhotoViewer.FileAssoc.Gif"

    reg add "HKCR\PhotoViewer.FileAssoc.Png" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Png\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Png\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Png\shell\open" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Png\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Png\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".png" /t REG_SZ /d "PhotoViewer.FileAssoc.Png"

    reg add "HKCR\PhotoViewer.FileAssoc.Wdp" /f /v "EditFlags" /t REG_DWORD /d 65536
    reg add "HKCR\PhotoViewer.FileAssoc.Wdp" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Wdp\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Wdp\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open" /f /v "MuiVerb" /t REG_EXPAND_SZ /d "C:\Windows Photo Viewer\PhotoViewer.dll,-3057"
    reg add "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Wdp\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".wdp" /t REG_SZ /d "PhotoViewer.FileAssoc.Wdp"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".jxr" /t REG_SZ /d "PhotoViewer.FileAssoc.Wdp"

    reg add "HKCR\PhotoViewer.FileAssoc.Icon" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Icon\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Icon\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Icon\shell\open" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Icon\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Icon\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".ico" /t REG_SZ /d "PhotoViewer.FileAssoc.Icon"

    reg add "HKCR\PhotoViewer.FileAssoc.Cursor" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Cursor\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Cursor\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Cursor\shell\open" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Cursor\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Cursor\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".cur" /t REG_SZ /d "PhotoViewer.FileAssoc.Cursor"

    reg add "HKCR\PhotoViewer.FileAssoc.AnimatedCursor" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.AnimatedCursor\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.AnimatedCursor\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.AnimatedCursor\shell\open" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.AnimatedCursor\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.AnimatedCursor\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".ani" /t REG_SZ /d "PhotoViewer.FileAssoc.AnimatedCursor"

    reg add "HKCR\PhotoViewer.FileAssoc.Webp" /f /v "ImageOptionFlags" /t REG_DWORD /d 1
    reg add "HKCR\PhotoViewer.FileAssoc.Webp\DefaultIcon" /f /ve /d "%SystemRoot%\System32\imageres.dll,-71"
    reg add "HKCR\PhotoViewer.FileAssoc.Webp\shell" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Webp\shell\open" /f /ve /d ""
    reg add "HKCR\PhotoViewer.FileAssoc.Webp\shell\open\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", -1"
    reg add "HKCR\PhotoViewer.FileAssoc.Webp\shell\open\DropTarget" /f /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".webp" /t REG_SZ /d "PhotoViewer.FileAssoc.Webp"
    
    reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /f /ve /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}"
    reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /f /ve /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}"

    setx Themes "shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}" /M
    setx AllTasks "shell:::{ED7BA470-8E54-465E-825C-99712043E01C}" /M
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="winpatch -r" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    reg delete "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /f
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "CortanaEnabled"
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "CortanaConsent"
    reg delete "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f
    reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /f
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /f /v "IsDynamicSearchBoxEnabled"
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "BingSearchEnabled"
    reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v "AllowOnlineTips"

    reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
    reg delete "HKLM\Software\Policies\Microsoft\Windows\Personalization" /f
    reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "verbosestatus"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "StartShownOnUpgrade" /t REG_DWORD /d 1
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "DisallowShaking"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "MapNetDrvBtn" /t REG_DWORD /d 0
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "AutoCheckSelect" /t REG_DWORD /d 0
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideMergeConflicts"
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "ShowEncryptCompressedColor"
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "NavPaneShowAllCloudStates"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "DisablePreviewDesktop" /t REG_DWORD /d 1
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "LaunchTo"
    reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /f
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f
    reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v "HideSCAMeetNow"
    reg delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /f
    reg delete "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /f
    reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Feeds" /f
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /f
    reg delete "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /f /v "AllowTelemetry"

    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "SeparateProcess" /t REG_DWORD /d 0
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /f
    reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /f /v "LargeSystemCache" /t REG_DWORD /d 0

    reg delete "HKCR\SystemFileAssociations\image\shell\open" /f
    reg add "HKCR\Applications\photoviewer.dll\shell\print\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1"
    reg delete "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /f /v "ApplicationDescription"
    reg delete "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /f /v "ApplicationName"

    reg delete "HKCR\PhotoViewer.FileAssoc.AnimatedCursor" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Bitmap" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Cursor" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Gif" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Icon" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.JFIF" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Jpeg" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Png" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Wdp" /f
    reg delete "HKCR\PhotoViewer.FileAssoc.Webp" /f
    reg delete "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".tiff" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff"
    reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".tif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff"

    reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /f
    reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /f

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