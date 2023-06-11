# ** Must be run as administrator **

This batch script is a menu-based tool called "WinTools" with version number 0.2.0. It provides various commands for performing different system operations and tweaks in Windows.

Here's a breakdown of the script:

1. The `@echo off` command turns off the command echoing in the console.

2. The `:top` label marks the beginning of the main loop.

3. Several `echo` statements display the tool's title, version, and available commands.

4. The `:prompt` label displays the prompt symbol.

5. The `:help` label displays a help section that lists all the available commands with their descriptions.

6. The `:cmd` label waits for user input using the `set /p` command and assigns it to the `modify` variable.

7. Conditional statements (`if /i`) check the value of the `modify` variable and perform the corresponding action or jump to a specific label.

8. The available commands and their corresponding actions are as follows:

   - `sysinfo`: Allows the user to enter system information (manufacturer, model, support URL) and updates the registry accordingly.

   - `pgrmdir`: Currently disabled command for changing the program files location. It displays a message but doesn't perform any action.

   - `winpatch`: Applies various registry changes to tweak Windows settings, such as disabling certain features and modifying system behavior.

   - `clrico`: Clears the icon cache, restarts the Windows Explorer process, and prompts the user to continue.

   - `sfc`: Runs the System File Checker (`sfc /scannow`) command and prompts the user to continue.

   - `dism`: Runs the Deployment Image Servicing and Management (`dism /Online /Cleanup-Image /RestoreHealth`) command and prompts the user to continue.

   - If none of the recognized commands are entered, an error message is displayed, and the user is prompted again.

9. The `goto prompt` command at the end of each action or error handling section returns to the prompt label, restarting the loop.

10. The `goto top` command at the end of the script jumps back to the top label, creating an infinite loop until the user chooses to exit.

Overall, this script provides a simple text-based menu system for running various system commands and tweaks in Windows.
