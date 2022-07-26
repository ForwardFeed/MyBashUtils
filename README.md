# MyBashUtils
Here will be posted some linux utilities i made.
Mostly scripts i think

### DNSRestrictionBypass
It's a script that helps bypassing the DNS restriction that i had.

### Killcord
Simply kills your discord app, not just close it and having it running in backgrounds, it just terminates it.
Usefull because it use a considerable amount of RAM

### MultiThreader
something like xargs but with multithreads on.
I like to multithread long executions in bash so i made a function to import for that instead of doing it manually each time.\
This function will take:
  1) an array of arguments
  2) a numbers of threads
  3) a name of function to execute the splitted arguments on
  4) a boolean:\
      True) Each thread will send tons of subprocess without waiting for the previous to exit to launch the next\
      False/unspecified) Will have to wait the last function has been fully executed before launching the next\


### PotentialbashMONKEYlogger
I wanted to make a keybinder with bash but i somewhat made a keylogger.\
You don't have the key like "A" or "Ctrl" you have an intermediary value that is meaningfull only for the kernel. It will only find your keyboard automatically and print out the decimal keycode/keysyms.\
Of course you can translate it but it's not what i found interesting here, which is the fact i managed to interact with binary data in bash which is not meant at all to be.\

### SteamActivityStalk
This is a tool for spying the activity of a steam account.\
My original problem was that i couldn't check if someone was playing a steam game or not if this person was in invisible.\
/!\ if the profile of the person is not in public anything will work.\
so there is three settings:\
APPID="" #This is the ID of the steam game you want to keep an eye on.\
USERID="" #this is the id of the account you want to spy.\
logfile="" #this is the name of the logfile with all the informations in.\

The format of the output is this way:\
time : hours_played_during_the_past_two_weeks total_hours_played

You can guess for example if someone is playing. If the recent amout of time played is going up (Steam refresh it every 10 minutes).\
If you see the past_two_weeks going down that mean the user isn't currently playing but was playing at this moment two weeks ago<br />
If you see the past_two_weeks staying still that mean the user is currently playing and was playing at this moment two weeks ago<br />
If you see the past_two_weeks going up that mean the user is currently playing<br />

### FokinCPL
My Power Line Communicators are a bit buggy for some unknown reason and randomly cut my internet.\
So i found a solution: restarting my internet interface with a systemd service.\

### ClickDl (for Freetube)
I like to download music from youtube and i was lazy to click copy link each time.\
So i made a script for that which when using Freetube (a youtube front end) use a X11 "macro" that copy the link of a video from just a miniature and download it.\
Note that i use it with a keybind. \
Also assume it works only with X11 because i use xdotools\
