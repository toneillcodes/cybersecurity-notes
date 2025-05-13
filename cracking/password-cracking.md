# Password Cracking
Generic password cracking reference<br>
## john the ripper
Classic tool for password cracking
```
john hashes.txt -w=/usr/share/wordlists/rockyou.txt
```
Example output:
```
$ john hashes.txt -w=/usr/share/wordlists/rockyou.txt 
Using default input encoding: UTF-8
Loaded 1 password hash (krb5tgs, Kerberos 5 TGS etype 23 [MD4 HMAC-MD5 RC4])
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
MYpassword123#   (?)     
1g 0:00:00:10 DONE (2025-01-02 20:15) 0.09960g/s 1080Kp/s 1080Kc/s 1080KC/s MZCARMAL..MYfamiLY4377
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
                                                                                                                                                                    $ 
```
## hashcat
Password cracking with enhanced functionality and GPU support
Cracking NTDIS hashes
```
$ hashcat -m 1000 hashes.txt /usr/share/wordlist/rockyou.txt
```
```
$ hashcat -m 1000 hashes.txt /usr/share/wordlist/rockyou.txt --show
```
Example output:
```
$ hashcat -m 13100 hashes.txt /usr/share/wordlists/rockyou.txt 
hashcat (v6.2.6) starting

OpenCL API (OpenCL 3.0 PoCL 6.0+debian  Linux, None+Asserts, RELOC, LLVM 17.0.6, SLEEF, DISTRO, POCL_DEBUG) - Platform #1 [The pocl project]
============================================================================================================================================
* Device #1: cpu-sandybridge-AMD Ryzen 5 4500 6-Core Processor, 1438/2941 MB (512 MB allocatable), 2MCU

Minimum password length supported by kernel: 0
Maximum password length supported by kernel: 256

Hashes: 1 digests; 1 unique digests, 1 unique salts
Bitmaps: 16 bits, 65536 entries, 0x0000ffff mask, 262144 bytes, 5/13 rotates
Rules: 1

Optimizers applied:
* Zero-Byte
* Not-Iterated
* Single-Hash
* Single-Salt

ATTENTION! Pure (unoptimized) backend kernels selected.
Pure kernels can crack longer passwords, but drastically reduce performance.
If you want to switch to optimized kernels, append -O to your commandline.
See the above message to find out about the exact limits.

Watchdog: Temperature abort trigger set to 90c

Host memory required for this attack: 0 MB

Dictionary cache hit:
* Filename..: /usr/share/wordlists/rockyou.txt
* Passwords.: 14344385
* Bytes.....: 139921507
* Keyspace..: 14344385

Cracking performance lower than expected?                 

* Append -O to the commandline.
  This lowers the maximum supported password/salt length (usually down to 32).

* Append -w 3 to the commandline.
  This can cause your screen to lag.

* Append -S to the commandline.
  This has a drastic speed impact but can be better for specific attacks.
  Typical scenarios are a small wordlist but a large ruleset.

* Update your backend API runtime / driver the right way:
  https://hashcat.net/faq/wrongdriver

* Create more work items to make use of your parallelization power:
  https://hashcat.net/faq/morework

$krb5tgs$23$*sqlservice$MARVEL.LOCAL$MARVEL.local/sqlservice*$58aaaa1277471a3bdd1bf2b6f09bff7b$b5e27ab7b2a67aa7b1b5ce7e289a94fb243388d84856e9a80e0f65999276e6bc5ade03459deeb646968092b742f6b48a5a4c57f9ac7078d2056842fb6a017887c857e8d112d5104f00354cd14bd09221addbbb87469c794867d87024b5a05a1864a2322052f2c771ab81d2b33f7ad4f5879d8cce73bc81e9b7bf5f930abfb0046f55993ff999eff03e3734ff2fe2fe18d1ff5c3fa118340608fb8ae00ce165b3fdfbf8b91115d474a2131566d27aca5cd504057e05238707b498a9ff7ee9a7059cc55bc64ced040c5316c24f1dae574498de0db4956be575c5e3fb066c94e0de343e4b1c5dbd8ac8d0c60dd1b6bc22e3d7fbdde14e585a4ed86d0a6f2d3d59b2d6ae5a7fee84f6b08271b7155b1cca5ba3c7670667506c0f382c291b55c830a5833deae3ef5957dae4e579a1248b382884bc2e0142a420d9c07888de5b1ac4569ca666aaf556ed39d27ecdc7b7cd9c34244f844b708cf13cf11ed0dcd2b8c396459d2457aeb2eaf6b1f4e239a336724131dfa8fa07f02542be7fc183c4922c4ad0b3bba107cd887666e7ca3bfd73a70cf210a6b435550714776e6434f41bad760ed123557b8b0587449c66768188ff82b1c3da5e68c1ff23a536a58020cc6653904191d15c4aee526ba94f177e38d19180f979274ac748e8bc6724a83c9f5aad13c868f690e401efb942a0aebcd90691e7925f3d46ab4b50df5a8d3413add89f42455d222a200a62a70b6c3a7b192ba52138c0b438cad328006ad1887284a24c0abc0a7089177c7aa66092f30f464049d113b0454f0f967b657ad5d135396a94e5712fc9c298798032259c63564235bbb7f47faeee7d7030ad0aa75f0d85753eecb741b4c152ba5765dffdbcb9a8fb96d0287e4f264f2fc1e9b5feefec9bca6439c03f6be695cf87cffa83a4f639676936b49672a11b126d4b49fa4d510d7465394374ec98b114d7a8095587b1f687f5f0238147b9a12744c18bb9df06dcd9bfebad18c71813b56206c2c2ebd1bd138cbd0d7c857ccaece7e1ccc8f69c59134839c098112006bb75472a7e77f723fa0cc66dc4bde42264d97c558efc743e58d3a7eb780b28e53d3e69cc9a479606b3272f6989b1ec1863d47aaaa0412b4c89bf45696ce418ab91f3bcaaf2168fff2e8b2d44a179ebd1e3ab97e5e89474b7ae69be44afc2a8fd2208cf55a2a599053767e0f8047a40c780465698d161fa1194a9bb5edabc768a8479dd98d4352d31b5d2cb605fdfbd24ccda202760e48ed108473d355365f7c95a6d1c012c16272ee6820b705649e50f71b122fcea4b5f5d7db5ca47ef49cbfa61284a838ce32badfcee0811d3c0bca4b13514439dad3053dc7493008264098477899333b4d714246fe5bb317ee29f4bfeed3fe41ea19c63e418d0dc00c8c5fbfb8f69a74024e6656d16772a19fe08c01262fd7d018d9b75d6ae962cc46f2fc9ba4326d37792ad40a95aebd3b2e45105915ac63acb388638c6c5404139379959718c504ce6ed:MYpassword123#
                                                          
Session..........: hashcat
Status...........: Cracked
Hash.Mode........: 13100 (Kerberos 5, etype 23, TGS-REP)
Hash.Target......: $krb5tgs$23$*sqlservice$MARVEL.LOCAL$MARVEL.local/s...4ce6ed
Time.Started.....: Thu Jan  2 20:14:04 2025 (19 secs)
Time.Estimated...: Thu Jan  2 20:14:23 2025 (0 secs)
Kernel.Feature...: Pure Kernel
Guess.Base.......: File (/usr/share/wordlists/rockyou.txt)
Guess.Queue......: 1/1 (100.00%)
Speed.#1.........:   824.5 kH/s (0.46ms) @ Accel:256 Loops:1 Thr:1 Vec:8
Recovered........: 1/1 (100.00%) Digests (total), 1/1 (100.00%) Digests (new)
Progress.........: 10846208/14344385 (75.61%)
Rejected.........: 0/10846208 (0.00%)
Restore.Point....: 10845696/14344385 (75.61%)
Restore.Sub.#1...: Salt:0 Amplifier:0-1 Iteration:0-1
Candidate.Engine.: Device Generator
Candidates.#1....: MYrockyou82 -> MYSELFonly4EVER
Hardware.Mon.#1..: Util: 70%

Started: Thu Jan  2 20:14:03 2025
Stopped: Thu Jan  2 20:14:24 2025
                                                                                                                                                                    
$
```
### hashcat modes
- 0: md5
- 100: SHA1
- 1000: NTLM
- 1400: SHA-256
- 3200: bcrypt
- 10900: PBKDF2-HMAC-SHA256
- 13100: KRB5
- 18200: AS-REP
## wordlists
Kali wordlists
```
sudo gunzip /usr/share/wordlists/rockyou.txt.gz
```
- /usr/share/wordlists/rockyou.txt
- https://github.com/danielmiessler/SecLists/tree/master/Passwords
