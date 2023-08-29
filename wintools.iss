[Setup]
Uninstallable=yes
AppName=WinTools
AppVersion=1.0.1
AppPublisher=Sythatic
CreateAppDir=yes
OutputDir=.\
OutputBaseFilename=wintools-installer
Compression=none
SolidCompression=yes
DefaultDirName={win}\wintools\
SetupIconFile=.\files\icon.ico
DiskSpanning=no
UninstallDisplayName=WinTools
UninstallDisplayIcon={app}\unins000.exe

[Files] 
Source: ".\files\start\*"; DestDir: "{commonprograms}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\files\wintools\*"; DestDir: "{win}"; Flags: ignoreversion recursesubdirs createallsubdirs 
