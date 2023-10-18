<div align="center">
    
# `WinTools`
![Static Badge](https://img.shields.io/badge/22H2-RELEASE-brightgreen)
#### WinTools is a batch script designed to perform various system maintenance tasks on a Windows computer. The script is intended to be run with administrative privileges to ensure that it can execute the required commands successfully. It provides a simple command-line interface where users can choose from a selection of commands to perform specific tasks.
</div>

## How to Use:

1. Right-click on the script file and choose "Run as Administrator."
2. Once executed, the script will display a list of available commands.
3. Enter the desired command's keyword and press Enter to execute the selected task.

## List of Available Commands:

**Enable Built-in Administrator:**

   - `admin -y` (Enable) or `admin -n` (Disable)
   - Enables or disables the built-in Administrator account.

**Appx Package Uninstaller:**

   - `appxmgr`
   - Uninstall Appx and provisioned packages not normally removable by the user.

**Windows Advanced Startup:**

   - `bootops`
   - Reboots the system to advanced startup options.

**Clear Icon Cache:**

   - `clrico`
   - Clears the icon cache to resolve issues with icon display.

**Deployment Image Servicing and Management:**

   - `dism`
   - Performs a system health check and repairs corrupted files.

**Add an Environment Variable:**

   - `envar`
   - Allows the user to add environment variables to the system. 

**HTTP Index Downloader:**

   - `indexdl`
   - Recursively download files from a webserver's "Index of" page.

**Suspend File Explorer:**

   - `killfe`
   - Suspends File Explorer and restarts it upon user input.

**Get OEM Product Key:**

   - `prodkey`
   - Retrieves the OEM product key of a Windows installation.

**Set Powershell Execution Policy:**

   - `pspedit`

**Set Remote Desktop Port:**

   - `rdport`
   - Allows the user to change the default RDP port.

**System File Checker:**

   - `sfc`
   - Scans and repairs protected system files.

**Reboot to UEFI/BIOS:**

   - `sysfw`
   - Reboots the system to the UEFI/BIOS.

**Set System Information:**

   - `sysinfo`
   - Allows the user to set system information, such as manufacturer, model, and support URL.

**Bypass TPM Appraisers:**

   - `tpmbypass`
   - Allows the installation of Windows 11 on unsupported PCs.

**Patch Windows 11:**

   - To install, use `winpatch` To remove, use `winpatch -r`
   - Applies or removes various modifications that modify the Windows 11 experience to better mimic the functions of Windows 10 and earlier.

## Important Notes:

- Use the commands carefully, as some operations may have permanent effects on your system.
- Always create a backup before running commands that modify system settings.
