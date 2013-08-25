Challenge 4.3: Controller Actions
---------------

While creating our gift registry controllers you probably noticed that there is some code duplicity between 
the editPostAction() and the newPostAction() 

<script src="https://gist.github.com/amacgregor/6217086.js"></script>

As we can see both actions are doing pretty much the same thing, the only difference is that when we call the editAction 
we are checking to see if the registry actually exist. 

In this case modifying our action post is very simple, we just need to add some extra logic so the PostAction can handle 
the model creation or update.

Now since we removed the **newPostAction** controller, we need to modify our layout for the newAction so it loads the edit 
blocks and forms.

We also need to be able to identify if the requested registry currently exists or if it's a new registry.

<script src="https://gist.github.com/amacgregor/6262552.js"></script>

The **_initModel()** function allow us to check if the requested Id matched an existing registry or if we should instantiate a 
new model. In order for each of the actions to work properly we need to call the _initModel() function, like so:

<script src="https://gist.github.com/amacgregor/6335929.js"></script>

Next, we need to replace each of the PostAction methods with a single abstraction action method called saveAction(); this 
new action will handle the post data for both the new and edit action methods. 

<script src="https://gist.github.com/amacgregor/6335746.js"></script>

As we can see we are also calling the initModel() function, this is to make sure we are loading the proper model or creating a new
one depending of the situation.

Now we can safely remove the **newPostAction()** and the **editPostAction()** from our controller. The final controller code should look something like this.

<script src="https://gist.github.com/amacgregor/6335944.js"></script>

There is one last set of changes that we need to apply to our layout and templates, to make sure the changes we made actually work.

Since both the edit and new actions are using the same save action there is no need to have 2 different sets of templates so let's edit our layout file:

<script src="https://gist.github.com/amacgregor/6335998.js"></script>

In the layout file we are referencing a new template file called **form.phtml** let's create the template file:

<script src="https://gist.github.com/amacgregor/6336008.js"></script>

# Conclusion

With this challenge we learned the value of refactoring our code to make easier to update and reduce its complexity.