#!/bin/bash
#script to watch minecraft server log for "send PRIVATEIPADDRESS" and start the same world on the target server.
#Folder locations are assuming https://github.com/andpenguin/AA-Coop-Tracker 1.16 is installed.
#loop until address variable is filled
while [ -z "$address" ]
do
#make the address variable: search latest.log for line containing the word “send” | isolate ip address from line
address="$(grep -o 'send .*' /var/minecraft/Tracker1.16/minecraft/logs/latest.log | cut -f2- -d" " )"
echo waiting for send command
done
#prevent server from restarting on stop
sudo systemctl stop mcreset
#stop and save server
mcrcon -H 127.0.0.1 -P 25575 -p password stop
#wait until "Thread RCON Listener stopped" appears in latest.log
while [ -z "$serverfinished" ]
do
serverfinished="$(grep -0 'Thread RCON Listener stopped' /var/minecraft/Tracker1.16/minecraft/logs/latest.log)"
echo waiting for server to stop
done
echo server stopped
#move world folder to sendable location
sudo mv /var/minecraft/Tracker1.16/minecraft/world/ /home/ubuntu/world/
#send world folder
scp -r -o StrictHostKeyChecking=no /home/ubuntu/world ubuntu@$address:/home/ubuntu/world
#move world folder to minecraft folder
ssh -o StrictHostKeyChecking=no -t ubuntu@$address "sudo mv  /home/ubuntu/world/ /var/minecraft/Tracker1.16/unused/world/"
#fix ownership of minecraft directory
ssh -o StrictHostKeyChecking=no -t ubuntu@$address "sudo chown minecraft.minecraft -R /var/minecraft/"
#start server
ssh -o StrictHostKeyChecking=no -t ubuntu@$address "sudo systemctl start minecraft"
