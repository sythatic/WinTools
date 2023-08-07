<div align="center">
    
# `WinTools`
<a href="https://github.com/sythatic/WinTools/releases/latest"><img height="480" src="https://github.com/sythatic/WinTools/assets/77679172/79a92333-9612-47fd-8f0b-c2ca4e91cbe1">
</a>
#### WinTools is a batch script designed to perform various system maintenance tasks on a Windows computer. The script is intended to be run with administrative privileges to ensure that it can execute the required commands successfully. It provides a simple command-line interface where users can choose from a selection of commands to perform specific tasks.
</div>

## How to Use:

1. Right-click on the script file and choose "Run as Administrator."
2. Once executed, the script will display a list of available commands.
3. Enter the desired command's keyword and press Enter to execute the selected task.
4. Some commands may require additional input from the user (e.g., system information for the "sysinfo" command).

## List of Available Commands:

1. **Enable Built-in Administrator:**

   - Command: `admin -y` (Enable) or `admin -n` (Disable)
   - Description: This command enables or disables the built-in Administrator account.

2. **Clear Icon Cache:**

   - Command: `clrico`
   - Description: This command clears the icon cache to resolve issues with icon display.

3. **Deployment Image Servicing and Management:**

   - Command: `dism`
   - Description: This command performs a system health check and repairs corrupted files.

4. **Suspend File Explorer:**

   - Command: `killfe`
   - Description: This command terminates the File Explorer process and restarts it.

5. **Get OEM Product Key:**

   - Command: `prodkey`
   - Description: This command retrieves the OEM product key of the Windows installation.

6. **System File Checker:**

   - Command: `sfc`
   - Description: This command scans and repairs protected system files.

7. **Set System Information:**

   - Command: `sysinfo`
   - Description: This command allows the user to set system information, such as manufacturer, model, and support URL.

8. **Patch Windows 11:**

   - Command: `winpatch`
   - Description: This command applies various modifications to customize the Windows 11 experience.

## Important Notes:

- Use the commands carefully, as some operations may have permanent effects on your system.
- Always create a backup before running commands that modify system settings.
