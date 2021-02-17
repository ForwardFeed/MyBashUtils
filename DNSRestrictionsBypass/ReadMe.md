### What is this?

basicaly i made a script that with a domain name will lookup to it's IP thanks to a random website i found using duckduckgo.
Then write it to your /etc/hosts file.


### Why ?

Because some retards in my governement seems to find it funny to block access to some websites by restricting my ISP forcefully provided DNS.
So i made my own Domain Name Table in a way.


### How to use it?

first you need to format your /etc/hosts file
add a ```#Hosts```  line and it's good, else it won't work

then chmod u+x the script
and run it this way

```
sudo ./dnsbypass <your domain name>
example: sudo ./dnsbypass github.com
```

and then you can acces your previously redirected/blocked website

why sudo? because it's the magic word i guess, smh i hate using sudo


### FAQ

##### Is there a security issue?

You are running a script you found on internet in sudo, so far it's two lines of code mostly regex.
If for some reasons the website that i trust to redirect me has been compromised well that could be a possible "DNS hijacking", but i have no clue if it's a low or high severity security issue:x
