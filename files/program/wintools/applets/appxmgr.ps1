# Script by ThioJoe - https://github.com/ThioJoe
# Updated & Adapted by Sythatic - https://github.com/sythatic

# Display AppX packages that are installed
Get-AppxPackage | Select-Object Name | Out-Host
Write-Host "Input the package names you want to remove, one per line."
Write-Host ""
Write-Host "Press [enter] to add each package to the list."
Write-Host "Press [enter] on an empty line to continue."
Write-Host ""

# Define the file path and content
$appList = ".\applist.log"

# Create the text file with the specified content
Set-Content -Path $appList

Write-Host ""
Write-Host "Then press any key to begin..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Read from the file
$lines = Get-Content -Path 'applist.log'

# Create an array to hold unsuccessful attempts
$notFound = @()

# Process each line
foreach ($line in $lines) {
    # Trim any leading or trailing white space
    $line = $line.Trim()

    # Ignore empty lines
    if (-not [string]::IsNullOrWhiteSpace($line)) {
        # Get the package, if it exists
        $package = Get-AppxPackage | Where-Object { $_.Name -eq $line -or $_.PackageFullName -eq $line }
		
		# If package was found, proceed to remove it, otherwise add it to list of apps not found
        if ($package) {
			# Try to remove app, and if error occurs display it, but will keep going to the next ones
            try {
                $package | Remove-AppxPackage -ErrorAction Stop
            } 
            catch {
                Write-Host "Error while trying to uninstall $($line): $_"
                $notFound += $line
            }
        } 
        else {
            $notFound += $line
        }
    }
}

# If there were unsuccessful attempts, print a warning
if ($notFound) {
    Write-Host "[WARNING] - The following packages were not found and could not be uninstalled:"
    Write-Host ""

    # Print each package name that was not found
    foreach ($package in $notFound) {
        Write-Host "`t$package"
    }
    Write-Host ""
    Write-Host "Please check the package names and ensure they match exactly."
}

Write-Host ""
Write-Host "Process completed."
Write-Host ""
Write-Host "Then press any key to exit..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Remove-Item -Path $appList -Force