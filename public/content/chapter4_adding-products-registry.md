Chapter 4: Adding products to the Gift Registry
---------------

This tutorial will pick up where we left off on **Chapter 4: Frontend  Development**, on that chapter started 
building our first Magento extension a Gift registry module; which supports the following functions:

- Store administrator can define multiple event types (birthdays, weddings, and gift registries)
- Create events and assign multiple gift registry lists to each event
- Customers can add products to their registries from the cart, wish list, or directly from the product pages
- Customers can have multiple gift registries
- People can share their registries with friends and family through e-mail and/or direct link
- Friends and family can buy the items from the gift registry

We will continue to build our extension functionality by allowing customers to add products from the store
catalog to their personal gift registries.

If you haven't done so yet, download the extension files from github https://github.com/amacgregor/mdg_giftreg/tree/chapter4

### The Items Controller

The first thing we are going to need is a new controller for managing the items inside a gift registry. The controller 
needs to have the following Actions:

- **addAction()**: Add a product from the Magento catalog to a specific registry.
- **deleteAction()**: Remove a registry item from a specific registry.
- **editAction()**: Edit a registry item, for example change the qty.

Our skeleton controller class will look like:

- Create a new file under the controllers folder called ItemController.php 
- Copy the following code:
    
<script src="https://gist.github.com/amacgregor/5306110.js"></script>

For now we will skip adding the logic to the controller actions and we will continue customizing the frontend for
allowing logged in customer to add items to the giftregistry. 

Since customers can have multiple gift registry we need to provide a small form that gives customers the option 
to select which giftregistry should the item be added. We need a new block where we can place the logic required 
for displaying the "add to registry form".

### Add To Registry Block

Let's go ahead and create our block class:

- Navigate to your extension Block folder
- Create a new file called Add.php
- Copy the following code:

<script src="https://gist.github.com/amacgregor/5306225.js"></script>

This block needs a function that returns a collection of registries from the current customer. Let's call our function
**getCustomerRegistryCollection()**, this function will referenced in the template file we will add next

This function looks for a logged in customer and if one exists it will retrive a collection of all the registries 
associated with this customer.

<script src="https://gist.github.com/amacgregor/5306447.js"></script>

### Template and Layout

At this point we added the logic that we need for retriving the associated registries with the current customer, next 
we will do the following:

- Add the block to the Magento layout.
- Create a template that will render the add to registry form.

It makes sense to render our block just below the add to cart button in the product view page, let's do it step by step:

- Create a new directory on your design/base/default/template folder called mdg
- Create a new file called add\_to\_registry.phtml
- Copy the following code:

<script src="https://gist.github.com/amacgregor/5307231.js"></script>

Inside this template file we are generating a custom form based on the current customer collection and the current product. We also
need to  modify the layout files to add a new block to the product page **\<catalog\_product\_view\>** let's take a closer
look at the layout file:

- We get the collection from the block.
- The collection is parsed into dropdown field 
- A form is created with the dropdown field and the current product_id

We are also checking to see if a customer is currently logged in, if there is not a current customer set then the add to registry 
for will not appear on the product page. 

We also need to tell Magento where to load our custom block and how to loaded, for doing that we will need to modify our custom layout 
and the product/view.phtml template file

- Navigate to the design/base/default/layout folder
- Open the file called mdg_giftregistry.xml
- Add the following code:

<script src="https://gist.github.com/amacgregor/5308960.js"></script>

What we are doing is to tell Magento that it should instantiate a new block inside the product.info block in the**\<catalog\_product\_view\>** 
page, we also need to modify the product view.phtml template to directly call for the new block we just created.


- Navigate to the design/base/default/template/catalog/product folder
- Open the file called view.phtml
- Add the following code:

<script src="https://gist.github.com/amacgregor/5309017.js"></script>

We added our new form just before the add to cart product form is crated, on a default Magento installation the resulting page should look
like this:

![Product Page](/images/chapter4/product_page.png "Product Page")

Right now if we try to add a product to the registry we should see the only a blank page, this is because our controller doesn't have any
logic yet, is just dumbly returning without rendering, redirecting or doing anything whatsoever. It's time to change that.

### Back to the Controller

Our controller action will be receiving the form data using POST, to create a new registry item we only need two variables, the registry_id 
and the product_id.

Let's go ahead and modify the controller **addAction()** 

- Navigate to the controllers folder
- Open ItemController.php 
- Add the following code to the addAction():

<script src="https://gist.github.com/anonymous/5309831.js"></script>

If we now try to add a product to our registry we will the following message 

![Product Page](/images/chapter4/added_to_the_registry.png "Product Page")

That's all what is needed to add products to our giftregistries on the next articles we will discuss how to to list them under they parent registry view.
delete them and update them.