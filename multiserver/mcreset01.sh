#!/bin/bash
MC_FOLDER="/var/minecraft/minecraft01"
while true
do
service minecraft01 status | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        mv "$MC_FOLDER/world" "$MC_FOLDER/old_world_$(date +%H:%M)"
        sudo service minecraft01 restart > /dev/null
fi
done
