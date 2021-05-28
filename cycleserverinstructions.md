cycleserverahk.exe is a compiled AutoHotKey script to facilitate cycling through multiple servers for which the user is an operator.
To use the script the operator should do the following:
Create a list of server addresses seperated by linebreaks.
Copy that list of addresses to the clipboard, being sure to not to copy a blank line at the end.
Navigate to the Play Multiplayer screen of Minecraft, being sure not to press any keys or click anything on that screen, if you do, leave and return to that screen.
Press alt+3 on the keyboard.

The script will make Minecraft connect to the first server in the list.
Should the first server have an unsuitable world, press alt+3 again.

The script will issue the /stop command, wait 0.4 seconds to fully disconnect from the server and then connect to the second server in the list.
Each press of alt+3 will repeat this process, once the last server in the list is connected to, the next will be the first in the list.
To change the list, simply copy an edited list to the clipboard, the script will start at the beginning of that list.
