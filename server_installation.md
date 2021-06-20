This document will provide instructions on how to install the Minecraft server, mcrcon and some authorized speedrunning mods. mcrcon and the mods are not required, however you will have to alter some of the steps, scripts and services to work without them.

Install Java
sudo apt -y update && sudo apt -y install default-jre screen

Create folder for minecraft
sudo mkdir /usr/games/minecraft

Go to new folder
cd /usr/games/minecraft

Download Fabric Installer
sudo wget https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.7.3/fabric-installer-0.7.3.jar

Download minecraft and run fabric installer
sudo java -jar fabric-installer-0.7.3.jar server -mcversion 1.16.1 -downloadMinecraft

Launch Fabric Minecraft Server to create mods folder and eula.txt
sudo java -Xmx14G -Xms14G -jar fabric-server-launch.jar nogui
The values here that say 14G can be raised or lowered according to your instance type, I leave 2G free, further research is required to know if leaving less would be acceptable.

Change ownership of eula.txt
sudo chown ubuntu eula.txt

Agree to eula
echo "eula=true" > eula.txt

Go to mods folder
cd mods

Download Krypton
sudo wget https://github.com/mrmangohands/krypton/releases/download/mc1.16.1-0.1.3-SNAPSHOT%2B2021-02-20/krypton-1.16.1-backport-0.1.3-SNAPSHOT+2021-02-20.jar

Download Lithium
sudo wget  https://github.com/CaffeineMC/lithium-fabric/releases/download/mc1.16.1-0.5.1/lithium-fabric-mc1.16.1-0.5.1.jar

Download Phosphor
sudo wget https://github.com/CaffeineMC/phosphor-fabric/releases/download/mc1.16.1-v0.6.0/phosphor-fabric-mc1.16.1-0.6.0+build.7.jar

Go back to minecraft folder
cd ..


Configure server.properties
sudo nano server.properties
Don't use numpad, use arrow keys to move the cursor around, your mouse will not work.

Change the following values from their default (create a new password for this):
network-compression-threshold=512
max-players=200
allow-flight=true
enable-rcon=true
Sync-chunk-writes=false
rcon.password=YOURRCONPASSWORDHERE
spawn-protection=0

Save the file:
ctrl+o
ENTER
ctrl+x

Download and Install mcrcon

cd ..

sudo git clone https://github.com/Tiiffi/mcrcon.git
cd mcrcon
sudo apt install make
sudo apt install gcc
y
ENTER
sudo make
sudo make install

Create a new user, user group and move your minecraft installation to the new user:
sudo groupadd -r minecraft
sudo useradd -r -g minecraft -d "/var/minecraft" -s "/bin/bash" minecraft
sudo mkdir /var/minecraft
sudo cp -r /usr/games/minecraft /var/minecraft/minecraft
cd /var/minecraft
sudo chown minecraft.minecraft -R /var/minecraft/

Download and install services:
cd /etc/systemd/system
sudo nano mcreset.service
Paste in the contents of this file https://github.com/Civitello/MCSRS/blob/main/mcreset.service
Save the file:
ctrl+o
ENTER
ctrl+x

sudo nano minecraft.service
Paste in the contents of this file  https://github.com/Civitello/MCSRS/blob/main/minecraft.service
Save the file:
ctrl+o
ENTER
ctrl+x

Create and set up script:
cd /var/minecraft

sudo nano mcreset.sh
Paste in the contents of this file https://github.com/Civitello/MCSRS/blob/main/mcreset.sh
Save the file:
ctrl+o
ENTER
ctrl+x

sudo chmod +x mcreset.sh

sudo systemctl daemon-reload

sudo systemctl enable mcreset
Reboot
sudo reboot now

Reconnect with ssh

Use:
systemctl status minecraft
To see the console output from minecraft
Repeat until server is started

Use:
mcrcon -p YOURRCONPASSWORDHERE
To start mcrcon
Op yourself with
op yourminecraftusername

Connect to the minecraft server with your minecraft game client

/stop

Wait

Reconnect

The world should be different

Stop the reset script from ssh:
sudo systemctl stop mcreset

Stop minecraft (use your minecraft game client or mcrcon)

Use:
systemctl status minecraft
To check that minecraft has stopped and stayed that way, the last line should end with Succeeded.

cd /var/minecraft/minecraft

Get a list of the contents of this directory
ls

sudo rm -r world 
sudo rm -r OLDWORLDDIRECTORYNAMESHERE

You now have a fully configured and tested server, return to the documentation for your host to learn how to save your work. Proceed to operation documentation to learn how to use the server.
