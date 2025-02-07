## sshuttle
Transparent proxy
```
sshuttle -r root@10.0.2.7 10.10.10.0/24
````
Example with identity file
```
sshuttle -r root@10.0.2.7 10.10.10.0/24 --ssh-cmd "ssh -i pivot_id"
````
