---
title: Getting our Feet Wet
---


# Project Management and GitHub

Whether you are by yourself, working with a team, or, more to your cases, working with an advisor, having an effective "project" setup will help you organize your thoughts and ideas and provide an much easier way to interact with an advisor or co-author. While `R Studio` has a built-in project system, we are going use this in conjunction with `GitHub` to ensure there is a copy of our information we can always get to if needed. Organization also helps you work with others and remember what you did and why when you revisit a project either an hour or a year after you started it. Organization also helps you should you need to prove or verify your work either to a professor or a journal when you submit for publication. This later issue, that of reproducability, is becoming even more important given the number of cases of academic misconduct being uncovered, even among Nobel Prize winners. We are going to organize our project in `R Studio` and then back it up in a GitHub Repository for both protection and for easier remote access by ourselves or co-workers. We start the process in reverse however.

## Create Repository on GitHub

A Repository is a place on the GitHub cloud where you can keep relevant files for any given project. You have each setup a profile on `GitHub` and are all part of the GitHUb Classroom environment for this class. Go there and check out the "Groves_R" assignment to close a local copy of the repository for this class. Now go to [GitHub](www.github.com), log into your account, and find the new local repository for the Groves_R assignment on the left-side menu and click it. To ensure you are doing this correctly, you should see a message in the README.TXT file that indicates this is the Repository for the in-class work for the Introduction to R part of Economics 691. 

## Create Project in R-Studio

As mentioned, `R Studio` has a system built into it that acts as a means for keeping information and data on a project together called *PROJECTS*. We can create a project on our computer only, or we can link it to a GitHub or similar type repository. Creating projects, however, is of little use if we do not know where we left them so we are going to use the File Explore feature in `R Studio` to create a **Projects** directory somewhere on our computer. To do this, navigate to the *Files* tab in the lower-right screen in `R Studio` and navigate to where you want your **Projects** directory to be located. Once there, click on the *New Folder* icon across the type of the *Files* tab and create a **Projects** directory.

Next we will return to that drop-down arrow in the upper-right corner that says **PROJECT(none)**. Click on this and choose "New Project". A small screen will open on your computer and you need to click the Version Control banner and then click on the Git banner.  

<p align="center">
  <img src="https://github.com/jrgroves/ECON691/assets/52717006/64332c4b-b877-40b7-bc5b-a5c91569ecc3"/>
</p>

The window that is now open is asking for the URL from the repository that you created on `GitHub` which you can get by simply navigating to the repository in your web browser and copy the URL from the location bar at the top of the browser. Once copied, you can paste in the URL space and that will typically auto populate the Project Name dialog box below it. The third box is were it will live on your computer and if not already showing your **Projects** directory, click the browse button and navigate to that directory. Once you are there and click open, click the "Create Project" button on the screen.  

<p align="center">
  <img src="https://github.com/jrgroves/ECON691/assets/52717006/6a2e5628-6035-4016-9ab1-997a0459726a"/>
</p>

Once you hit "Create Project" it will appear that `R Studio` reloads and we will be ready to start working. The other thing this action does is "clones" the repository at that URL you listed and populates your computer with anything located in that reponsitory. You can verify this by looking at the *Files* tab and notice that it now switches to a newly created directory within your **Projects** directory with the same name as your repo on GitHub and sets the working directory in `R` to that location. To verify this, type the `getwd()` in the console and see what is reported.  The last thing you should notice that is different is that there is now a new tab in the upper-right window of `R Studio` called *Git*. Under this tab is one way we can interact with both `Git` and GitHub.

## Your First Push
Version control allows us to keep track of changes both by us and anyone else that has permission to access our repository. It does not, however, keep track of all of our key strokes and it can only track what we tell it to track and it takes a "snapshot" only when we tell it to. Whenever we create or modify a file, version control, or in this `Git` will recongize that it is different than what is currently in the repository, but that is the extent of what it will do on its own. We we complete our modifictaions and want to update what we have on our main or branch, we must first "stage" the files. 

We can stage as many files as we want and we can think of "staging" as placing our newly changed files in an envelop that we are going to "mail" to our repo. To actually submit the changes so that version control will commit them to "memory", we have to commit them. When we commit a set of changes, we have the option to add a comment to our commit to tell ourselves or others what we changed in this part that is being committed. Once we commit, version control creates a new "version" of the project using those files and creates a history which contains the older versions of our project prior to those changes that were committed. To summarize the process using an example, lets say we have a some sort of project that is out in the world, such as a software program. Overtime we decide we need to add features, remove obsolute features, or fix errors, but we do not want to mess up what we have that works. This is where creating a "branch" comes into play. A branch starts with a copy of what we currently have "out in the world" and we can "check out" the program, make changes, and then commit those changes to the branch. Let's say our changes are going to take a month to finish; we would want to commit our work each day or couple of hours so we do not loose anything, but by committing it via version control, if we every realize we were going in the wrong direction, we can always recover some previous version. Only after we have made all of our changes and run the branch program to test it, will we merge our branch back to our main which then replaces the original program with the new version while still keeping a historical version of the original. 

To pratice this in our example, we are going to modify our README.md file inside of `R Studio`. The easiest way to do this is to double-lick on the *README.md* file in the file manger and notice that a new screen opens at the top of the left-side of `R Studio` and you should see the following:

```bash 
# Groves_R
This is the in-class work for the Introduction to R in Economics 691. You will need to copy of the location or URL of this repository which you will find in the address bar of the browser.
```
Using what you recall from previous classes on markdown, add a sub-heading with your last name and then a line under that indicating in some way that this is you copy of the class repository and then save this new file using the disk icon in the upper-left of the editor window. If you get lost or do not recall, an example is below.
<details>
  <summary> Example: Push and Pull #1 </summary>
  
```bash

# Groves_R
This is the in-class work for the Introduction to R in Economics 691. You will need to copy of the location or URL of this repository which you will find in the address bar of the browser.

## Groves_R
This is my own personal copy of the main repository for the Introduction to R in Economics 691 taught by the balding guy!
```
</details>

We will notice when we save this file that we get some action in the *Git* tab in the upper-right "enviornment" window. You should now see the "README.md" file in the window with a blue square to the left of the file name with a white "M" in the box. This indicates that a file that is part of the repository has been modified but has not yet been staged or commited. To verify this, return to the web browser and look at the "README.md" file and notice your new line is not present. The same would be true if we look at the local repository on your computer; however, the local version of the "README.md" file saved to your computer would have changed. To get this change to the local repository, we need to stage and then commit the change. If you click on the empty box in front of the "README.md" file you will see the blue box shift to the left side indicating that it is now staged and ready to commit. To "commit" this file we click on the *Commit* icon which will then open a new window. In this new window, we will see three smaller panels. The upper-left shows us all the files that are staged, the upper-right is going to be where we can add our comment, and the lower panel is a "comparison" or "dif" that shows us additions, deletions, and what remains unchanged bewteen the stagged file and the one in the previous commit. 

You should see the original text in gray and your new addition highlighted in green. Had we deleted something from the what was originally opened, we would see that highlighted in red. We will add the comment "Added our personal touch" to the comment box and then click on the *Commit* button. What this has done is taken a snapshot of everything we had stagged and "committed" it to the local repository. Switch over to your web browser and refresh your `GitHub` reponsitory for our project and notice that nothing changed! This is because our commit ONLY added our changes to the version control tracking files on our local computer. If we want to send these changes, along with updating the files in our repository, we have to "Push" them up to the cloud. If you return to `R Studio` you will notice in the *Git* tab an icon that says "Push" and by licking this, it will send our version control file and copies of the updated files in our project that we had committed, to the cloud. Now return to the web browser, refresh, and notice the "README.md" file has changed.

## Your First Pull

Since you do not have a co-author on this project, we need to simulate someone making a change to the files on the repo. To simulate this, go to the main page of the responsitory on your web browser and notice the structure already cloned there includes a directory called "Data." For our purposes this is going to be home to all of our raw data from which we will work and that we obtained elsewhere. If you click here you will see a single ".csv" file that we will use in our work and assignments already present. Returning to the home directory by clicking the link at the top next to the branh ID, click on the "Add file" button and create a new file. File organization is also extrememly important and so we will start setting up our project directory here on the web version of our repository. Generally we want to keep our work local, but this is a way to simulate a co-author or advisor making a change. Where you place the name of file type the following: ``Build\Code\First.R``. This is going to create a new directory, a sub-directory, and a new file called "First" and it will create it as an `R script` file. Copy the code from the box below into the open editor and then commit the changes. You do not have enter a commit comment, but something like "first commit" would be fine. 

```R
rm(list=ls())
A <- "Hello world!"
A
```
You have created a new script file and placed it in the directory structure **Build --> Code** which is where we will hold all of our code that we use to clean and construct the core dataset for our project. Switch over to `R Studio` and look in the *Files* tab in the auxilary window, navigate to and double-click "First.R". You can't can you? This is because the only place the changes are held are on the cloud and possibly a co-author's local system. You need to get the updated version of the project down to your local system and you do that my pulling it from the repository. Above the directory window in the environment panel of `R Studio` under the **git** tab you will see a button with a down arrow and the work "pull". CLick that.

Now you will see the new directory **BUILD** and if you double-click that you will see the **Code** directory and in there you will find your "First.R" file. Click this and it will open in your editory window. What this code will do is the following:

- The first line will completely clear the environment. The *rm()* command will remove anything within its arguement (inside the parenthesis) and the text `list = ls()` is using the *ls()* command to list everything in the environment (because the argument space is left to the default by leaving it empty).
- The second line assigns the character string "Hello world!" to the object **A**. `R` is an object based language and so anything that `R` uses must be assigned a unique name and that "thing" can be any number of types of objects or classes. What we have here is a string. Notice that we use the syntax "<-" to assign the character string to the object **A**. This is because the syntax "=" indicates an equality and that is not what we are doing, we are assigning.
- The third line then recalls the object **A** and the output is printed in the console. We can now refer to the character string "Hello world!" by its object assignment.

To run this script, we "source" the script. We can do this two ways: via the editor and via the console. With the editor we only need click the button labled "Source" in the upper-right side of the editor. This will run the script and "echo" each step in the console meaning it will print each line of code (up to some limit). You should see the following in your console after you click on the button.

```R
> rm(list=ls())

> A <- "Hello world!"

> A
[1] "Hello world!"
```

A second way is to source the script directly in the console which is basically what the button did for us. If you look at your output, at the top you will see `source("~/Projects/Groves_R/Build/Code/First.R", echo=TRUE)`. What the *source()* command does is runs the file that is listed in its arguement and, in this case, the option "echo" is set equal to TRUE which means it is "turned on" so we see each line of output. We also see that in the file name we have to list the exact location of the file and in that text we see the tilda symbol (\~). This represents the main path that is currently saved in the R profile. You can find this by using the command *path.expand('~')*. While this is fine, it is not good to use this if you are going to be working with others because their computer structure may not be the same as yours. 

To enhance the reproducability of any path that we use, we want to instead refer to the current workind directory which we can find using the command *getwd()*. The advantage of using projects in `R Studio` is that the working directory is set for us as the location of this particular project so what you should see is the main path from above along with the location of where you decided to place your projects on your local computer followed by the name of the project. We can access this in our code by using the period syntax. Therefore, to run our script, we can instead type `source("./Build/Code/First.R")` in the console. Notice when we hit return, nothing happens really. This is because the default option for "echo" in the *source()* command is set to FALSE or "off". However, something did happen because if we now type `A` in the console and hit enter, you will see your message.

