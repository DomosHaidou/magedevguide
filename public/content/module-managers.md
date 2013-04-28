Chapter 7: Module Managers
---------------

Distributing and Managing Magento extension used to be a difficult and error prone process, that 
involved manually changing, uploading and updating files in more than one occasion that has resulted 
in unexpected promotions or deletions; sometimes permanent.

### Composer

Recently Composer has been getting a lot of attention from the Magento community, and with good reason
composer simplifies deployment and extension management. 

### Modman

Modman by Collin Mullenhour, Modman was a tool born out of necesity and is one of my prefered deployment
tools both on development and production environments.

One of the more interesting features of modman is the ability to create symlinks to the particular 
Magento installation, I have found this feature to be particulary usefull for testing extensions across 
multiple magento installations. 

Instead of having multiple copies of the extension deployed across multiple development environments we 
can  just reference a single common point through the symlinks. Any updates or changes that are made into 
this single point immediatly take effect on all the symlinked installations.



### Magento Connect

Magento Connect is the name both used for the Magento extension market place and the package manager 