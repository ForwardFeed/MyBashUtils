### What is this?

Simply allows you to have acces to websites under a DNS blocking from your ISP.


### Why ?

Because some retards in my governement seems to find it funny to block access to some websites.
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
However the script is quite simple, it's just a bit tricky.
And that's it afaik, a lot of people trust Google DNS and else you could use mozzila ones 1.1.1.1 and to be fair my friend, it's better to have mozzilla having your DNS requests than google but since i'm a troll i'm gonna let every people use googles ones by default.

##### Can it bypass an applicative firewall

No but you can take the IP and put it in the web browser tab.
It won't Work every time because of some multiple hosting and reverse proxy magic
example:  Error 1003
And i have no idea how to circumvent this without using a proxy or other solutions that might exist require a service on it's own.
