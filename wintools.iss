[Setup]
Uninstallable=yes
AppName=WinTools
AppVersion=1.3.0
AppPublisher=Sythatic
CreateAppDir=no
OutputDir=.\
OutputBaseFilename=wintools-installer
Compression=none
SolidCompression=yes
DefaultDirName={win}\wintools\
SetupIconFile=.\files\program\wintools\icon.ico
DiskSpanning=no
UninstallDisplayName=WinTools
UninstallFilesDir={win}\wintools
UninstallDisplayIcon={win}\wintools\unins000.exe

[Files] 
Source: ".\files\start\*"; DestDir: "{commonprograms}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\files\program\*"; DestDir: "{win}"; Flags: ignoreversion recursesubdirs createallsubdirs 