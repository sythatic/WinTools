taskkill /f /im explorer.exe
cd /d %userprofile%\AppData\Local
del IconCache.db /a
cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer
attrib –h iconcache_*.db
del iconcache_*.db
cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer
attrib –h thumbcache_*.db
del thumbcache_*.db
start explorer.exe