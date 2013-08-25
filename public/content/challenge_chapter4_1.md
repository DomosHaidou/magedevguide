Challenge 4.1: Installer Script
---------------

As we learned previously Magento SQL scripts are useful for creating tables and setting data when an extension is installed.
In the book example we only included the for creating the **registry\_entity** table.

But we are missing two related table **registry\_type** and **registry\_items**. Let's take a look at each of the missing tables and breakdown the code:


<script src="https://gist.github.com/amacgregor/6216016.js"></script>


## Breakdown 
The registry type table is used to identify the different types of registries (Wedding, Baby Registry, Birthday, Bachelor(ed) Part, and so on)


<script src="https://gist.github.com/amacgregor/6216028.js"></script>


## Breakdown 
The item table is used to to store the relationship between a product and a registry. This table is very simple and only stores the **product\_id** and the matching **registry\_id.**



## Conclusion 

Once we had added the previous code to our installation script we should have the following file:

<script src="https://gist.github.com/amacgregor/6216036.js"></script>
