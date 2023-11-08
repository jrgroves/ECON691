---
title: Week One, Step Three
author: Jeremy R. Groves
---

# Week One - Step Three
## Your First Repository

Now we will create our first repository on GitHub and then pull that onto our personal computer. This is where we will store all of the codes for our projects and it will be the way that I will grade your assignments. Your first repository will be called *ECON691_###* where the three hash marks are your initials. To create a repository, go to [GitHub](www.github.com), log into your account, and click on the green NEW button. In the top dialog box, input the name and then, further down the page, click on the radio button for README file. After making sure this is a public repository, scroll to the bottom and click on create. This will take you to your repository page. You can directly edit items here, but that is beyond the scope of what we are doing so we will skip that. 

### Create Project in R-Studio

To some extent, we are duplicating work because R-Studio has a system where it will keep track of *PROJECTS* which are the same, essentially, as our repositories. To start a project, go to R-Studio and in the upper-right corner you will see a button that says +PROJECT(none)+ Click on this and choose "New Project". A small screen will open on your computer and you need to click the Version Control banner and then click on the Git banner.  

![image](https://github.com/jrgroves/ECON691/assets/52717006/64332c4b-b877-40b7-bc5b-a5c91569ecc3)  

In the next screen you will copy and paste the URL from the repository that you created on GitHub and that will typically auto populate the Project Name dialog box. The third box is were it will live on your computer. I keep mine in a directory in my Documents folder called "Projects" and that is where each of my research projects live. If you want to change the default, do so, but it makes little difference.  

![image](https://github.com/jrgroves/ECON691/assets/52717006/6a2e5628-6035-4016-9ab1-997a0459726a)  

Once you hit "Create Project" it will appear that R-Studio reloads and we will be ready to start working with R-Studio.  

### A Quick Additional Git Setup

One thing you will notice different is in the upper-right window in R-Studio you have a new tab. Specifically the tabs are "Environment", "History", "Connections", and "Tutorial". Now there is a new tab called "Git". Click on that tab.  

![image](https://github.com/jrgroves/ECON691/assets/52717006/b5a48908-8a66-4075-b261-cae64add552d)  

The button we want to use first is the "MORE" button which will drop a menu down. Select "New Terminal" on that drop down menu.  

![image](https://github.com/jrgroves/ECON691/assets/52717006/57778b3e-eae4-412a-86a9-840459593640)  

You will see a new tab open in the right-side of R-Studio that you will use to type in commands to the main Git interface.  

![image](https://github.com/jrgroves/ECON691/assets/52717006/77557241-2543-43cf-93cd-89083ace16f7)  

What we want to do is to tell Git who we are on our computer via the two command lines below. Git will recognize names, but the more important aspect is the use of the email address.  

```Git
git config --global user.name "Jeremy R. Groves"
git config --global user.email "jgroves@niu.edu"
```

You can close out this terminal by clicking the small 'X' next to the name in the tab.

### Your First Pull - Push
Return to the upper-right window with the Git tab and notice there is a button called `Pull`. This does exactly what it would imply, it "pulls" from the repository what is new and different which, in this case is going to be the README.txt file that is in our repository. To see what I mean, go to the lower-right window and click on the FILE tab. Here we are using R-Studio's version of File Manager to see on our own computer the folder where we put our project. It should be empty at this point with the exception of a file called `.Rhisotry` and `.gitignore`. Return to the upper-right Git tab and click on the Pull button and then, when the work in the new window is done, click on DONE. now, if you look in the FILES tab, you should see the addition of a `README.txt` file. What you have done is ensured that what is on your computer includes everything that is in the repository on GitHub.  

One of the great feature of R-Studio is that it will work as a combination of tools. If we double click the README.md file in the FILES tab, we will see a new window in the upper-left which is a text editor. The file extension `.md` stands for "markdown" and is a way to format text, similar to LaTeX or HTML, but much more scaled down. This is another great thing to learn, but beyond what we are doing now. The key thing is that we can type anything we want here. The `README.md` file is a great place to keep notes about your project or to provide other users with instructions for what to do. Right now, we want to just put a simple message here so type in the following the editor.

```
This is the repository for Economics 691 taught in the Fall 2023 semester. My name is Jeremy Groves and will eventually graduate with a Ph.D. or M.A. in Economics.
```

Now save this using the save icon in the editor and notice over in your Git tab the `README.md` file has appeared with a blue M next to it. This indicates that this file is now different from what is in the repository or at least according to the latest version you pulled. What we want to do now is "stage" this file by clicking on the white box next to the file. When you do, the blue box shifts to the left side. When working with version control, it only keeps tract of changes that have been "committed" to the record. If we were to close this right now, delete the README.md file from our computer and pull down the repository again, our text would not be there. In order for the version control to remember our text, we have to commit it. We do this by staging the file first (we just did that) and then click the Commit button in our Git tab.  

A new window will open that will show us a comparison of what we have and what we are committing. The red shaded areas are things that are deleted and the green shaded areas are things that have been added. In the upper-left of this new window we will see all of our files in the repository with an indication of what is staged and what is not and in the upper-right we will have a dialog window were we can input something about this commit. These comments are ways to remember and track what we are doing so we will just enter something like "Initial Commit with new README" and then click on commit. Once that is finished, we need to "PUSH" this to the GitHub repository which we do by simply pushing the PUSH button at the top of the screen. You can verify this by returning to your GitHub page, looking at your repository, and you will see the updated README file there with your text.

[Go to Step 4](w1.st4.md)
