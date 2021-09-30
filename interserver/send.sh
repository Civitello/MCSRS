#!/bin/bash
#loop until address variable is filled
while [ -z "$address" ]
do
#make the address variable: search latest.log for line containing the word “send” | isolate ip address from line
address="$(grep -o 'send .*' latest.log | cut -f2- -d" " )"
done
#prevent server from restarting on stop
sudo systemctl stop mcreset
#stop and save server
mcrcon -H 127.0.0.1 -P 25575 -p allblack stop
#move world folder to sendable location
sudo mv /var/minecraft/minecraft/world/ /home/ubuntu/world/
#send world folder
scp -r -o StrictHostKeyChecking=no /home/ubuntu/world ubuntu@$address:/home/ubuntu/world
#move world folder to minecraft folder
ssh -o StrictHostKeyChecking=no -t ubuntu@$address "sudo mv  /home/ubuntu/world/ /var/minecraft/minecraft/world/"
#start server
ssh -o StrictHostKeyChecking=no -t ubuntu@$address "sudo systemctl start minecraft"
