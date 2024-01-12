@echo off & title Execution Policies & mode con cols=120 lines=35
echo:
echo  [46m Powershell Execution Policies [0m
echo: 
echo [90m   [Undefined][0m
echo     - There is no execution policy set in the current scope.
echo     - If the execution policy in all scopes is Undefined, the policy is set to default.
echo:
echo [94m   [Restricted][0m
echo     - Permits individual commands.
echo     - Prevents running of all script files.
echo:
echo [96m   [Default][0m
echo     - Restricted for Windows clients.
echo     - RemoteSigned for Windows servers.
echo:
echo [92m   [AllSigned][0m
echo     - Requires all scripts files be signed, including scripts written on the local computer.
echo     - Prompts you before running scripts from publishers that you haven't yet classified as trusted or untrusted.
echo:
echo [93m   [RemoteSigned][0m
echo     - Requires a signature on scripts downloaded from the internet.
echo     - Doesn't require a signature on scripts written on the local computer.
echo     - Runs unblocked, unsigned scripts downloaded from the internet.
echo:
echo [91m   [Unrestricted][0m
echo     - Unsigned scripts can run.
echo     - Warns the user before running non-local scripts.
echo:
echo [95m   [Bypass][0m
echo     - Nothing is blocked and there are no warnings or prompts.
echo     - There is a risk of running malicious scripts. 
echo:
pause