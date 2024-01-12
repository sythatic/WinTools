@echo off
reg delete "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "CortanaEnabled"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "CortanaConsent"
reg delete "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /f
reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /f /v "IsDynamicSearchBoxEnabled"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /f /v "BingSearchEnabled"
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v "AllowOnlineTips"
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\Personalization" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "verbosestatus"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "StartShownOnUpgrade" /t REG_DWORD /d 1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "DisallowShaking"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "MapNetDrvBtn" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "AutoCheckSelect" /t REG_DWORD /d 0
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideMergeConflicts"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "ShowEncryptCompressedColor"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "NavPaneShowAllCloudStates"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "DisablePreviewDesktop" /t REG_DWORD /d 1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "LaunchTo"
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v "HideSCAMeetNow"
reg delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Feeds" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /f /v "AllowTelemetry"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "SeparateProcess" /t REG_DWORD /d 0
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /f /v "LargeSystemCache" /t REG_DWORD /d 0
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /f
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /f
    
reg delete "HKCR\SystemFileAssociations\image\shell\open" /f
reg add "HKCR\Applications\photoviewer.dll\shell\print\command" /f /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\rundll32.exe \"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\", ImageView_Fullscreen %1"
reg delete "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /f /v "ApplicationDescription"
reg delete "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" /f /v "ApplicationName"
reg delete "HKCR\PhotoViewer.FileAssoc.AnimatedCursor" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Bitmap" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Cursor" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Gif" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Icon" /f
reg delete "HKCR\PhotoViewer.FileAssoc.JFIF" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Jpeg" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Png" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Wdp" /f
reg delete "HKCR\PhotoViewer.FileAssoc.Webp" /f
reg delete "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".tiff" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff"
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /f /v ".tif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff"