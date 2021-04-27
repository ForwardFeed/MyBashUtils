### What is this?

Simply allows you to have acces to websites with a DNS blocking.


### Why ?

Because some retards in my governement seems to find it funny to block access to some websites by.
So i edited myself my Domain Name Table in a way.


### How to use it?

first you need to format your /etc/hosts file
add a ```#Hosts```  line and it's good, else it won't work

then chmod u+x the script "dnsbypass"
and run it this way

```
#To add a website to bypass
sudo ./dnsbypass <your domain name>
example: sudo ./dnsbypass github.com

#To remove a website
sudo ./dnsbypass -remove <your domaine name> 

#(optional)
#you can specify a specific DNS to be used instead of the google's 8.8.8.8 as a proxy this way
sudo ./dnsbypass <your domain name> <the DNS proxy>
```

and then you can acces your previously redirected/blocked website

why sudo? because afaik you can't write the /etc/hosts file without root acces.


### FAQ

##### Is there a security issue?

You are running a script you found on the internet in sudo. it's a problem.
But the script is quite simple, it's just a bit tricky.

