#!/bin/bash
#Create and mount ramdisk to existing minecraft directory.
sudo mount -t tmpfs -o size=16000M tmpfs /var/minecraft/Tracker1.16/minecraft
#Copy the minecraft installation to the ramdisk.
sudo cp -R /var/minecraft/Tracker1.16/unused/. /var/minecraft/Tracker1.16/minecraft
#Start minecraft and resetting
sudo systemctl start minecraft.service
#Start backup service
sudo systemctl start backup.service
