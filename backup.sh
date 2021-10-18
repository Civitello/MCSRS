#!/bin/bash
#turn off autosave to prevent conflicts.
mcrcon -H 127.0.0.1 -P 25575 -p password save-off
#backup loop, should switch to rsync
while true
do
sleep 300
#initiate minecraft server save to ramdisk
mcrcon -H 127.0.0.1 -P 25575 -p password save-all
#copy from ramdisk to backup
echo backing up
sudo rsync -r /var/minecraft/Tracker1.16/minecraft/world /var/minecraft/Tracker1.16/backup1
#update latest.txt
echo "The latest backup is /backup1" > latest.txt
echo backup done
sleep 300
#initiate minecraft server save to ramdisk
mcrcon -H 127.0.0.1 -P 25575 -p password save-all
#copy from ramdisk to backup
echo backing up
sudo rsync -r /var/minecraft/Tracker1.16/minecraft/world /var/minecraft/Tracker1.16/backup2
#update latest.txt
echo "The latest backup is /backup2" > latest.txt
echo backup done
sleep 300
#initiate minecraft server save to ramdisk
mcrcon -H 127.0.0.1 -P 25575 -p password save-all
#copy from ramdisk to backup
echo backing up
sudo rsync -r /var/minecraft/Tracker1.16/minecraft/world /var/minecraft/Tracker1.16/backup3
#update latest.txt
echo "The latest backup is /backup3" > latest.txt
echo backup done
done
