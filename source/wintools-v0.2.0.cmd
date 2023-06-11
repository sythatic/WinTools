@echo off
:top
echo:
echo   [104m WinTools [0m
echo   [90mv0.2.0 [0m
:prompt
echo:
echo   [97mExit [93m[X] [0m
echo:
echo   [7m Applet Commands [0m
:help
echo:
echo   [97mClear Icon Cache                            [93m[clrico]
echo   [97mDeployment Image Servicing and Management   [93m[dism]
echo   [97mChange Program Files Location               [91m[pgrmdir]
echo   [97mGet OEM Product Key                         [93m[prodkey]
echo   [97mSystem File Checker                         [93m[sfc]
echo   [97mSet System Information                      [93m[sysinfo]
echo   [97mPatch Windows 11                            [93m[winpatch]
echo:
:cmd
set /p modify="[0m  $: "
if /i "%modify%"=="X" exit
if /i "%modify%"=="help" ( goto help)
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
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /v Manufacturer /d "%brand%" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /v Model /d "%model%" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /v SupportURL /d "%url%" /f
    echo:
    goto prompt
)
if /i "%modify%"=="prodkey" (
    echo:
    wmic path softwarelicensingservice get OA3xOriginalProductKey
    echo:
    goto prompt
)
if /i "%modify%"=="pgrmdir" (
    echo:
    echo   [7m Enter New Program Location [0m
    echo:
    echo   [43m This Applet is currently disabled and will not do anything [0m
    echo:
    set /p newpgrmdir="[0m  Path: "
    echo:
    echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /f /v "ProgramFilesDir" /t REG_SZ /d "%newpgrmdir%"
    echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /f /v "ProgramFilesDir (x86)" /t REG_SZ /d "%newpgrmdir% (x86)"
    echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /f /v "ProgramW6432Dir" /t REG_SZ /d "%newpgrmdir%"
    echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /f /v "CommonFilesDir" /t REG_SZ /d "%newpgrmdir%\Common Files"
    echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /f /v "CommonFilesDir (x86)" /t REG_SZ /d "%newpgrmdir% (x86)\Common Files"
    echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /f /v "CommonW6432Dir" /t REG_SZ /d "%newpgrmdir%\Common Files"
    goto prompt
)
if /i "%modify%"=="winpatch" (
    echo:
    reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
    reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /v "" /t REG_SZ /d ""
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /f /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /f /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d 0
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "BingSearchEnabled" /t REG_DWORD /d 0
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
    mkdir "C:\Windows\allctrl.{ED7BA470-8E54-465E-825C-99712043E01C}"
    echo:
    goto prompt
)
if /i "%modify%"=="clrico" (
    echo:
    taskkill /f /im explorer.exe
    cd /d %userprofile%\AppData\Local
    del "IconCache.db" /a
    cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer
    attrib -h "iconcache_*.db"
    del "iconcache_*.db"
    cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer
    attrib -h "thumbcache_*.db"
    del "thumbcache_*.db"
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="sfc" (
    echo:
    sfc /scannow
    echo:
    pause
    echo:
    goto prompt
)
if /i "%modify%"=="dism" (
    echo:
    dism /Online /Cleanup-Image /RestoreHealth
    echo:
    pause
    echo:
    goto prompt
) else (
    echo:
    echo [91m    [Command Not Found]
    echo:
    goto cmd
)
goto prompt
