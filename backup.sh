#!/bin/bash
#backup loop, should switch to rsync
while true
do
sleep 240
cp -R /var/minecraft/minecraft /var/minecraft/backup
done
