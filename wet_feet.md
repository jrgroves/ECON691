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

[detail

start a script file so go to the File --> New File --> R Script and start a fresh script in our editor window. When writing a script, everything we type is going to be "read" by `R` as a command unless we tell it otherwise. This is where commenting comes in. Commenting allows us to leave notes for ourselves or others about what is going one in the program to help both ourselves and others remember or understand what is going on. In an `R` script we can "comment" out a line by starting it with **#** (hash mark) and then everything after that mark will be ignored by `R`. note that we can put this at the start of the line to have `R` ignore everything or we can place it anywhere else on the line to have `R` ignore everything to the right of the mark. In the spirit of readability and reproducability, we should always start a new script with some basic information telling a reader what this script is supposed to do, note anything that should be done prior to running this script, who wrote the script and when, and any updates or major changes. So in your editor, input the following lines with the relevant information.

```R
#This is my first script file for Economics 691
#Your Name
#Today's Date
```

Before we save this file, we want to put it in the "right" spot so that we keep our space organized. Look down into the *Files* tab in the auxilery window and click the **New Folder** icon and create a folder called **Build**. Next create three more folders called **Analysis**, **Data**, and **Paper**. What is going to go in each of these folders should be obvious. Once done creating the folders, double-click on the **Build** folder and then create another set of folders named **Code** and **Output**. The former is where we will store all of the code we use to "build" and clean our raw data and the latter will hold any data files created in this process that we will eventually use for our analysis. Once these folders are created, return to our script window and either click on the disk icon or click File --> Save As... on the menu. The file window should open in the working directory and you should see your four folders you first created. Navigate to **Build** and then **Code** and save your file as "First". `R Studio` will automatically affix the extension ".R" on your file to indicate it is an `R` script file. You can verify it saved if you double-click the **Code** directory in the *Files* tab in your auxilary window.

Another place you can see some activity is in the *Git* tab in the upper-right "enviornment" window. You should now see the "Build/Code" with an empty check box and two yellow boxes with question marks in them. You may also see a file ".gitignore" and maybe a couple of others. If you click on the empty box in front of the "Build/Code" you will see it change to a checkmark and the two yellow boxes will change to a green box with an 'A' in it. You will also see the text change to "Build/Code/First.R". What you have done is completed an initial "staging" of this script file. We now must "commit" this file to `Git`'s memory and we can do that by clicking on the *Commit* icon which will then open a new window. In this new window, we will see three smaller panels. The upper-left shows us all the files that are staged, the upper-right is going to be where we can add our comment, and the lower panel is a "comparison" that shows us additions, deletions, and what remains unchanged bewteen the stagged file and the one in the previous commit. 

Because this is a new file, everything is shaded in green. We will add the comment "Initial Commit" to the comment box and then click on the Commit button. What this has done is taken a snapshot of everything we had stagged and "committed" it to `Git's` memory. Now switch over to your web browser and refresh your GitHub reponsitory for our project and notice that nothing changed! This is because our commit ONLY added our changes to the version control tracking files on our local computer. If we want to send these changes, along with updating the files in our repository, we have to "Push" them up to the cloud. If you return to `R Studio` you will notice in the *Git* tab an icon that says "Push" and by licking this, it will send our version control file and copies of the updated files in our project that we had committed, to the cloud. Now return to the web browser, refresh, and notice the new directory **Build** which if you double-click, contains a directory **Code** which contains a file "First.R".

But we made four directories on our compuater, why are they not here? Simple, we did not "stage" them and thus we did not tell `Git` to track them. This is actually helpful because we may not want to "track" via `Git` any raw data files because there are more complex ways you need to deal with very large datafiles and because the raw datafiles should never change anyway so tracking them with `Git` just makes `Git`'s job harder for no reason. What you can do is upload a copy of the files to your GitHub repo directly through the browser so that you have a backup, but then to also have a copy on your local computer with which you will work. 

## Your First Pull

Since you do not have a co-author on this project, we need to simulate someone making a change to the files on the repo. To simulate this, double-click on the "First.R" file and then click on the pen in the upper-right cornoer of the GitHub page. This will enter you into the editor in GitHub. Once here, enter the following commands in the script.

```R
rm(list=ls())
A <- "Hello world!"
A
```

Now click on the "Commit Changes" button and in the pop-up leave the comment "Co-author's change" and then click Okay. You have changed changed and committ that change of the "First.R" file to your GitHub repo. Switch over to `R Studio` and click on the small 'x' next to the "First.R" and then, in the *Files* tab in the auxilary window, navigate to **Build --> Code** and double-click "First.R". Do you see your new code?

No, you should not because those changes are not local, they are still up in the cloud and you need to "Pull" them down. To accomplish this, close the "First.R" file again in the editor and then go to the *Git* tab in the environment window and click on "Pull". A window should pop up to show you that updates are being downloaded. Once this is finished and you close the window, reopen your "First.R" file and you should see the new code. If you then click on the "Source" icon in the editor window, you should see in your console the following output:

```R
> rm(list=ls())

> A <- "Hello world!"

> A
[1] "Hello world!"
```

Congratulations, you have completed the use of version control, created and updated a repository and `R Studio` project, and run your first `R` script! I expect to see your completed dissertations next week!

