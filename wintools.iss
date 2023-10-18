[Setup]
Uninstallable=yes
AppName=WinTools
AppVersion=22H2
AppPublisher=Sythatic
CreateAppDir=no
OutputDir=.\
OutputBaseFilename=wintools-installer-22H2
Compression=none
SolidCompression=yes
DefaultDirName={win}\wintools\
SetupIconFile=.\files\program\wintools\icon.ico
DiskSpanning=no
UninstallDisplayName=WinTools
UninstallFilesDir={win}\wintools
UninstallDisplayIcon={win}\wintools\unins000.exe

[Files] 
Source: ".\files\start\*"; DestDir: "{commonprograms}\Administrative Tools"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\files\program\*"; DestDir: "{win}"; Flags: ignoreversion recursesubdirs createallsubdirs 