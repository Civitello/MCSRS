#!/bin/bash
#turn off autosave to prevent conflicts.
mcrcon -H 127.0.0.1 -P 25575 -p strong-password save-off
#backup loop, should switch to rsync
while true
do
sleep 300
#initiate minecraft server save to ramdisk
mcrcon -H 127.0.0.1 -P 25575 -p PASSWORD save-all
#copy from ramdisk to backup
cp -R /var/minecraft/minecraft /var/minecraft/backup1
#update latest.txt
echo "The latest backup is /backup1" > latest.txt
#delete out of date backup
rm -r /var/minecraft/backup2
sleep 300
#initiate minecraft server save to ramdisk
mcrcon -H 127.0.0.1 -P 25575 -p PASSWORD save-all
#copy from ramdisk to backup
cp -R /var/minecraft/minecraft /var/minecraft/backup2
#update latest.txt
echo "The latest backup is /backup2" > latest.txt
#delete out of date backup
rm -r /var/minecraft/backup3
sleep 300
#initiate minecraft server save to ramdisk
mcrcon -H 127.0.0.1 -P 25575 -p PASSWORD save-all
#copy from ramdisk to backup
cp -R /var/minecraft/minecraft /var/minecraft/backup3
#update latest.txt
echo "The latest backup is /backup3" > latest.txt
#delete out of date backup
rm -r /var/minecraft/backup1
done
