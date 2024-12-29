# LLMNR Poisoning
## Attack overview
1. Run Responder
```
sudo responder -I tun0 -dPv
```
2. Capture hash from traffic
3. Crack hash using hashcat (maybe)
4. Utilize hash to login
## Tools
- Responder
- Hashcat
