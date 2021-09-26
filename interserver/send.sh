#!/bin/bash
#ask for speedrun server ip address
echo What is the private IP address of the speedrun server? (xxx.xxx.xxx.xxx)
read varaddress
#check if address is valid by contacting server
$varaddress
#If address invalid throw error and go back to line 3
#prevent server from restarting on stop
sudo systemctl stop mcreset
#stop and save server
mcrcon -H 127.0.0.1 -P 25575 -p strong-password stop
#send world folder
scp -o StrictHostKeyChecking=no /var/minecraft/minecraft/world/. ubuntu@$varaddress:/media/ramdisk/minecraft/world/.
#start server
ssh -o StrictHostKeyChecking=no -t "sudo systemctl start minecraft"
#announce success
