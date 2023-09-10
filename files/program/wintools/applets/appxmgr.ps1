# Script by ThioJoe - https://github.com/ThioJoe

# Display AppX packages that are installed
Get-AppxPackage | Select-Object Name, PackageFullName | Out-Host

# Pause the script and display instructions
Write-Host "Please create a text file called list.txt, then copy the names of the packages you want to uninstall into it, one per line."
Write-Host "NOTE: Some of the packages listed above are important. Do not uninstall any packages if you're unsure about their function!"
Write-Host ""
Write-Host "Then press any key to continue ..."
Read-Host

# Check if list.txt exists
if (-not (Test-Path -Path 'list.txt')) {
    Write-Host "Error: list.txt not found. Please create it in the same directory as this script, and add the packages you want to uninstall."
    return
}

# Read from the file
$lines = Get-Content -Path 'list.txt'

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
    Write-Host "[!!!] WARNING: The following packages were not found and could not be uninstalled:"
    Write-Host ""

    # Print each package name that was not found
    foreach ($package in $notFound) {
        Write-Host "`t$package"
    }
    Write-Host ""
    Write-Host "Please re-check the names to ensure they exactly match a package's 'Name' or 'PackageFullName'."
    Write-Host "(Also check if the Full Name was truncated with '...', and if so try the shorter 'Name' string.)"
    Write-Host ""
}