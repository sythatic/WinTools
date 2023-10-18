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

   - Command: `admin -y` (Enable) or `admin -n` (Disable)
   - Description: Enables or disables the built-in Administrator account.

**Appx Package Uninstaller:**

   - Command: `appxmgr`
   - Description: Uninstall Appx and provisioned packages.

**Windows Advanced Startup:**

   - Command: `bootops`
   - Description: Initiate an advanced startup.

**Clear Icon Cache:**

   - Command: `clrico`
   - Description: Clears the icon cache to resolve issues with icon display.

**Deployment Image Servicing and Management:**

   - Command: `dism`
   - Description: Performs a system health check and repairs corrupted files.

**Add an Environment Variable:**

   - Command: `envar`
   - Description: Allows the user to add environment variables to the system. 

**HTTP Index Downloader:**

   - Command: `indexdl`
   - Description: Recursively download files from a webserver's "Index of" page.

**Suspend File Explorer:**

   - Command: `killfe`
   - Description: Terminates the File Explorer process and restarts it upon user input.

**Get OEM Product Key:**

   - Command: `prodkey`
   - Description: Retrieves the OEM product key of the Windows installation.

**Set Powershell Execution Policy:**

   - Command: `pspedit`

**Set Remote Desktop Port:**

   - Command: `rdport`
   - Description: Allows the user to change the default RDP port.

**System File Checker:**

   - Command: `sfc`
   - Description: Scans and repairs protected system files.

**Reboot to UEFI/BIOS:**

   - Command: `sysfw`
   - Description: Reboots the system to the UEFI/BIOS.

**Set System Information:**

   - Command: `sysinfo`
   - Description: Allows the user to set system information, such as manufacturer, model, and support URL.

**Bypass TPM Appraisers:**

   - Command: `tpmbypass`
   - Description: Allows the installation of Windows 11 on unsupported PCs.

**Patch Windows 11:**

   - Command: `winpatch`
   - Command: `winpatch -r`
   - Description: Applies or removes various modifications that modify the Windows 11 experience to better mimic the functions of Windows 10 and earlier.

## Important Notes:

- Use the commands carefully, as some operations may have permanent effects on your system.
- Always create a backup before running commands that modify system settings.
