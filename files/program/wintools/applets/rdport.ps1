# Script by Sythatic - https://github.com/sythatic

$getPortNumber = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"
$oldPortNumber = (Get-ItemProperty -Path $getPortNumber).PortNumber

Write-Host "  Current Port Number: $oldPortNumber"

$newPortNumber = Read-Host "  New Port Number"

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "PortNumber" -Value $newPortNumber 

New-NetFirewallRule -DisplayName 'RDPPORTLatest-TCP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol TCP -LocalPort $newPortNumber 
New-NetFirewallRule -DisplayName 'RDPPORTLatest-UDP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol UDP -LocalPort $newPortNumber