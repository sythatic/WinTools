# Script by Sythatic - https://github.com/sythatic

Write-Host "Input the package names you want to remove, one per line."
Write-Host ""
Write-Host "Press [enter] to add each package to the list."
Write-Host "Press [enter] on an empty line to continue."
Write-Host ""

# Display AppX packages that are installed
Get-AppxPackage | Select-Object Name, PackageFullName | Out-GridView -PassThru | Remove-AppxPackage -AllUsers -ErrorAction Stop

Write-Host ""
Write-Host "Process completed."
Write-Host ""
Write-Host "Then press any key to exit..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")