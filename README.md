# MyBashUtils
Here will be posted some linux utilities i made.
Mostly scripts i think

### DNSRestrictionBypass


### ClickDl
i assume it works only with X11 because i use xdotools\
i needed to have something that when i put my cursor onto a video miniature it click, copy the link of the video and download the music.\
i combined it with a keybind. In the end it's not very usefull lmao

### Killcord
Simply kills your discord app, not just close it and having it running in backgrounds, it just terminates it

### MultiThreader
This will take an array (just a string with spaces as separator because we're in bash lmao), a number of subprocesses (you can imagine this as being multithreading) and a function (if you use it in a script careful to source it and not use it like an external utils).\
And with this it will split all your args into X numbers of threads.\
something like xargs but with multithreads on.

### PotentialbashMONKEYlogger
i wanted to make a keybinder with bash but i made somewhat a keylogger.\
honestly this one is very interresting just technically where i managed to interact with data in binary with bash (which is a language notorious for handling anything but utf-X.\
it will just find your keyboard automatically and print out the decimal keycode/keysyms. (i haven't totally understood how keyboards works in linux)

### SteamActivityStalk
so i was looking to see if my (ex)boyfriend wasn't playing csgo instead of, i dunno, doing the things he told me he was doing, and since i'm kinda huh cringe? obsessive? i made a tool for spying on his steamaccount. Even if the person you stalk is in invisible in steam friends, you can guess when he plays with this.\
/!\ if the profile of the person is not in public anything will work.\
so there is three settings:\
APPID="" #This is the ID of the steam game you want to keep an eye on.\
USERID="" #this is the id of the account you want to spy.\
logfile="" #this is the name of the logfile it will be outputed on.\

the format of the output is this way:\
time : hours_played_during_the_past_two_weeks total_hours_played

you can guess for example if someone is playing if the recent amout of time played is going up (refreshing every 10 minutes, that's why the script is looping on each 10 minutes).\
If you see the past_two_weeks going down it mean the person was playing two weeks at the same hour and day of the week as now (kinda interresting imo)<br />
If you see the past_two_weeks staying still it's mean the person was playing two weeks ago and is currently playing.<br />
if you see the thing going up, well your buddy is playing rn.<br />

it's not very very clear and sometimes it's not smooth but you can understand quickly i'm sure.

### FokinCPL
I made a systemd service that restart my interfaces whenever my Power Line Communication start to i don't know bugging or something, anyway that's very specific to my case i guess, the code is absurdely stupid but seems to work so far lmao


### r34tagsoverlaps
Some tags on this porn website are cancer, i just wanted a tool to realize how much some tags are related to another one
You put two tags in both arguments and it compare
