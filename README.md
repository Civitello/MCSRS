# MCSRS
### Minecraft Speed Running Server
##### Introducion:
This project is a set of documentation, scripts, services and more to facilitate Minecraft cooperative speedrunning. The current main feature is automatic world resetting, though I have ambitions for more exciting features. If the resetting scripts are set up and configured correctly, whenever the server is stopped (for example, when a connected operator issues the `/stop` command) the script will rename the `world` folder and restart the server with a brand new world and a brand new random seed. 

This combined with by the minute or second billing and the ability to launch as many servers as necessary in seconds offered by AWS and the like, allows for a single person to **affordably** review seeds at rates exceeding 10 per minute at a cost of a fraction of a penny per seed.

##### Compliance with speedrun.com rules:
This project has not yet been evaluated by speedrun.com staff or volunteers. Until that happens you will be using this project at your own risk. However, I have thoroughly reviewed the rules and discussed this project with other speedrunners, I am confident that this project will be approved. This project can currently only do the following:
* Start the Minecraft Server.
* Monitor the Minecraft server to see if it stops.
* Rename the world folder.

###### Future Compliance:
Future features of this project **will not** perform any calculations on coordinates (like converting between nether and overworld or calculating stronghold positions). All such calculations will be performed by runners. The ONLY commands or alterations to Minecraft files planned for this project are the `/say` command and renaming the `/world` folder. There are plans for reading the `latest.log` file for commands from users to do things like manually add items to the achievement tracker and coordinates to the map website. These will not be added without further investigation into compliance.

##### Disclaimer:
I am not an expert, my skills and knowledge in the relevant areas are limited, treat this project accordingly.

##### Contributions:
I would love help improving this project, I am looking for people who can help with reviewing my code for errors (I am inexperienced), and with implementing the planned features.

##### Sibling Projects:
https://github.com/andpenguin/AA-Coop-Tracker
AA Coop Tracker

##### Some planned future features:
* Advancement tracking website (This website will be hosted on the same machine as the Minecraft server, it will read the JSON files in the advancements folder and produce checklists based on their contents, it will need to be able to use the Mojang API to look up usernames of participants. 
* **User** generated map
* Documentation for hosts other than AWS (GCP, Digital Ocean, Azure and the like).
