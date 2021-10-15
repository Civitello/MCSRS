#!/bin/bash
#Create and mount ramdisk to existing minecraft directory.
mount -t tmpfs -o size=16000M tmpfs /var/minecraft/Tracker1.16/minecraft
#Copy the minecraft installation to the ramdisk.
cp -R /var/minecraft/Tracker1.16/unused/. /var/minecraft/Tracker1.16/minecraft
#Start minecraft and resetting
systemctl start minecraft.service
#Start backup service
systemctl start backup.service
