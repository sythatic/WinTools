if /i "%modify%"=="clripsw" (
    echo:
    cd /d "%LOCALAPPDATA%\Packages\AppleInc.iTunes_nzyj5cx40ttqa\LocalCache\Roaming\Apple Computer\iTunes\iPhone Software Updates"
    del "*.ipsw"
    cd /d "%LOCALAPPDATA%\Packages\AppleInc.AppleDevices_nzyj5cx40ttqa\LocalCache\Roaming\Apple\AMPDevicesAgent\iPod Software Updates"
    del "*.ipsw"
    cd /d "%APPDATA%\Apple Computer\iTunes\"
    del "*.ipsw"
    cd /d "%APPDATA%\Apple Computer\iTunes\iPhone Software Updates"
    del "*.ipsw"
    echo:
    goto prompt
)





if /i "%modify%"=="rdport" (
    echo:
    powershell "%SystemRoot%\wintools\applets\rdport.ps1"
    echo: 
    goto prompt
)

# Script by Sythatic - https://github.com/sythatic

$getPortNumber = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"
$oldPortNumber = (Get-ItemProperty -Path $getPortNumber).PortNumber

Write-Host "  Current Port Number: $oldPortNumber"

$newPortNumber = Read-Host "  New Port Number"

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "PortNumber" -Value $newPortNumber 

New-NetFirewallRule -DisplayName 'RDPPORTLatest-TCP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol TCP -LocalPort $newPortNumber 
New-NetFirewallRule -DisplayName 'RDPPORTLatest-UDP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol UDP -LocalPort $newPortNumber