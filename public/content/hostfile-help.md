Chapter 1: Hostfile Help
------------------------

Host files are used by operating system to map hostnames to specific **ip addresses.** When we create a new host file entry we bypass the **Domain Name System** (DNS)
which is used to resolve domain names to ip addresses.

Host files are like an address book, when you type an URL in your browser your computer will try to 
resolve that url into a valid IP Address to establish a connection. There are two ways hostnames and urls are resolved, the first and most commonly used is called DNS (Domain Name System).

Going into detail about DNS and it's role as the internet backbone is a bit outsite the scope of this article, for now is only important to understand that the host files
override DNS and we will be using them setup our staging domains.

Depending on the operating system that you are currently using the host file will be located in different directories.

##### **Windows**
- Open C:\system32\drivers\etc\hosts in notepad
- Add the following line at the end of the file:

````
    192.168.36.1 magento.localhost.com
````

##### **Unix/Linux/OSX**
- Open /etc/hosts using nano:

````
    $ sudo nano /etc/hosts
````

- Add the following line at the end of the file:

````
    192.168.36.1 magento.localhost.com
````