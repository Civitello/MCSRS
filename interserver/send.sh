#!/bin/bash
#ask for speedrun server ip address
echo What is the private IP address of the speedrun server? (xxx.xxx.xxx.xxx)
read varaddress
#check if address is valid by contacting server
$varaddress
#If address invalid throw error.
#stop and save server
mcrcon -H 127.0.0.1 -P 25575 -p strong-password stop
#send world folder
