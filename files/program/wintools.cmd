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
echo   [90m23H2 [0m
echo:
echo   [97mExit WinTools                            [93m[exit] [0m
echo   [97mList all commands                        [93m[help] [0m
echo:
:prompt
cd %SystemRoot%
set "modify="
set /p modify="[0m  $: "
if /i "%modify%"=="exit" exit
if /i "%modify%"=="help" (
    echo: 
    echo   [7m Commands [0m
    echo:
    echo   [97mToggle Built-in Administrator            [93m[admin] [0m    {-y/n}
    echo   [97mAppx Package Manager                     [93m[appxmgr] [0m
    echo   [97mReboot to Advanced Startup Options       [93m[bootops] [0m  {-fw}
    echo   [97mClear Icon Cache                         [93m[clrico] [0m
    echo   [97mAdd an Environment Variable              [93m[envar] [0m
    echo   [97mHTTP Index Downloader                    [93m[indexdl] [0m
    echo   [97mSystem Recovery                          [93m[osfix] [0m    {-sfc -dism} 
    echo   [97mGet OEM Product Key                      [93m[prodkey] [0m
    echo   [97mSet Powershell Execution Policy          [93m[pspedit] [0m  {-?}
    echo   [97mRestart/Suspend File Explorer            [93m[respring] [0m {-s}
    echo   [97mSet System Information                   [93m[sysinfo] [0m
    echo   [97mBypass TPM Appraisers                    [93m[tpmbypass] [0m
    echo   [97mRestore Old UI Elements                  [93m[uipatch] [0m  {-r}

    echo   [97mList Batch Color Code                    [93m[colors] [0m
    echo   [97mExit WinTools                            [93m[exit] [0m
    echo:
    goto prompt
)
if /i "%modify%"=="admin" (
    echo:
    echo [93m    [MISSING / INVALID PARAMETER] [0m
    echo:
    echo        use [93m[admin -y][0m to enable 
    echo        use [93m[admin -n][0m to disable
    echo:
    goto prompt
)
if /i "%modify%"=="admin -y" (
    echo:
    net user administrator /active:yes
    echo:
    goto prompt
)
if /i "%modify%"=="admin -n" (
    echo:
    net user administrator /active:no
    echo:
    goto prompt
)
if /i "%modify%"=="appxmgr" (
    echo:
    echo [94m    [NOTICE] [0m
    echo:
    echo        - To select multiple packages, hold the [ctrl] key while selecting.
    echo        - You may need to select 'Provisioned Packages' to uninstall some apps.
    echo:
    echo [96m    [PRESS ANY KEY TO START] [0m
    echo:
    powershell "%SystemRoot%\wintools\applets\appxmgr.ps1"
    echo: 
    goto prompt
)
if /i "%modify%"=="bootops" (
    shutdown /r /o /t 00
    exit
)
if /i "%modify%"=="bootops -fw" (
    shutdown /r /fw /t 00
    exit
)
if /i "%modify%"=="clrico" (
    echo:
    taskkill /f /im explorer.exe
    cd /d %LOCALAPPDATA%\Microsoft\Windows\Explorer
    attrib -h "iconcache_*.db"
    del "iconcache_*.db"
    cd /d %LOCALAPPDATA%\Microsoft\Windows\Explorer
    attrib -h "thumbcache_*.db"
    del "thumbcache_*.db"
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="colors" (
    start cmd /c "%SystemRoot%\wintools\applets\colors.cmd"
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
    echo: 
    goto prompt
)
if /i "%modify%"=="osfix" (
    echo:
    echo [93m    [MISSING / INVALID PARAMETER] [0m
    echo:
    echo        use [93m[osfix -sfc][0m to run "System File Checker"
    echo        use [93m[osfix -dism][0m to run "Deployment Image Servicing and Management"
    echo:
    goto prompt
)
if /i "%modify%"=="osfix -dism" (
    echo:
    dism /Online /Cleanup-Image /RestoreHealth
    echo:
    pause
    echo:
    goto prompt
)
if /i "%modify%"=="osfix -sfc" (
    echo:
    sfc /scannow
    echo:
    pause
    echo:
    goto prompt
)
if /i "%modify%"=="prodkey" (
    echo:
    wmic path Softwarelicensingservice get OA3xOriginalProductKey
    echo:
    goto prompt
)
if /i "%modify%"=="pspedit" (
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
if /i "%modify%"=="pspedit -?" (
    start cmd /c "%SystemRoot%\wintools\applets\psphelp.cmd"
    goto prompt
)
if /i "%modify%"=="respring" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="respring -s" (
    echo:
    taskkill /f /im explorer.exe
    echo:
    pause
    echo:
    start explorer.exe
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
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /f /v "Manufacturer" /d "%brand%"
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /f /v "Model" /d "%model%"
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /f /v "SupportURL" /d "%url%"
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="tpmbypass" (
    echo:
    taskkill /f /im explorer.exe
    reg add "HKLM\System\Setup\LabConfig" /f /v "BypassTPMCheck" /t REG_DWORD /d 1
    reg add "HKLM\System\Setup\LabConfig" /f /v "BypassRAMCheck" /t REG_DWORD /d 1
    reg add "HKLM\System\Setup\LabConfig" /f /v "BypassSecureBootCheck" /t REG_DWORD /d 1
    reg add "HKLM\System\Setup\MoSetup" /f /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d 1
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="uipatch" (
    echo:
    taskkill /f /im explorer.exe
    start cmd /c "%SystemRoot%\wintools\applets\patch.cmd"
    start explorer.exe
    echo:
    goto prompt
)
if /i "%modify%"=="uipatch -r" (
    echo:
    taskkill /f /im explorer.exe
    start cmd /c "%SystemRoot%\wintools\applets\unpatch.cmd"
    start explorer.exe
    echo:
    goto prompt
) else (
    echo:
    echo [93m    [COMMAND NOT FOUND]
    echo:
    goto prompt
)
echo:
echo [91m    [ERROR]
echo: