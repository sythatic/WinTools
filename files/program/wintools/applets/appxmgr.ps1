# Script by Sythatic - https://github.com/sythatic

$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
$options = "Appx Packages", "Provisioned Packages"
$selectedOption = $options | Out-GridView -Title "Select Appx Packages to Uninstall" -PassThru
if ($selectedOption -eq "Appx Packages") {
    Get-AppxPackage | Select-Object Name, PackageFullName | Out-GridView -Title "Select Appx Packages to Uninstall" -PassThru | Remove-AppxPackage
    Write-Host ""
    Write-Host "Process completed."
} elseif ($selectedOption -eq "Provisioned Packages") {
    Get-AppxProvisionedPackage -Online | Select-Object DisplayName, PackageName | Out-GridView -Title "Select Appx Provisioned Packages to Uninstall" -PassThru | Remove-AppxProvisionedPackage -Online
    Write-Host ""
    Write-Host "Process completed."
} else {
    Write-Host ""
    Write-Host "The operation failed or was cancelled."
}