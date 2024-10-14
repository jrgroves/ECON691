


# Setup, Configuration, and Brief Tour
Now that we have the programs installed using the default options, we need to make some configuration changes and setup some options within the software. 

## GIT Identification
The first thing we need to do is to identify yourself to `GIT` show that when we commit changes, we can know *who* made those changes. We will do this using `GIT Bash` which is the command line or shell version of `GIT` (similar to what we did in an early Tech Taco Tuesday). If you look at the set of files installed when you installed GIT on your machine, one option will be `GIT Bash`. Once that window has popped up, you are given the command prompt where you need to input the two lines of command. Use your own name and email address that corresponds to your GitHub account.

```bash
git config --global user.name "Jeremy R. Groves"
git config --global user.email "jgroves@niu.edu"
```
This will now tag all of your `GIT` work with your name and email so that we can make sure we know who has submitted what changes.

## R Library Setup
`R` is a solid program for data analysis; however, most of its power comes in its ability to use libraries. These are add-ons created by other users that expand what the program can do or simplify the way a script is written. Most of these packages are located at the CRAN website; however, others can be found on GitHub. To use them, they must first be downlaoded and then installed into `R`. Another aspect of how `R` works is that when the base `R` is updated and you install the new version, it DOES NOT overwrite the previous version, rather it installs the new version along side the older version. The reason for this is that some of the libraries fall out of use and are not updated for new `R` versions and so having an older version allows users to access those tools. The tradeoff to this system is that the libraries are installed in the version specific folder so when you update `R`, you must also reinstall all libraries. Since we do not typically run into the version problem, it becomes helpful to place all of your libraries into one common directory and then just update where `R` looks for the library files.  

To make this change, we first need to find the `Rprofile.R` file on your computers. For PC users you can find this file at `C:/Program Files/R/*current install*/library/base/R`. Navigate here using your file explorer program and then find the file Rprofile.R and right-click and choose to edit with Notepad++ or other text editor. When it opens, scroll all the way down to the bottom and then add the following text.  

```R
#My Stuff
myPaths <- c("C:/Users/HP/Documents/R/userLibrary", .libPaths())
.libPaths(myPaths)
```

Within this code, the command `.libPaths()` holds the location of where `R` looks for library files when you use the `library()` command in your script. This code updates that object by adding the user defined library location. My listing this one first, it also designates our user defined library as the default location when we install libraries for `R` to use. By placing this command in the `Rprofile.R` script, which is a script `R` runs on start up, we are always updating this variable everytime we start up `R`. 

Now lets go ahead and install a couple of libraries by opening `R Studio` and looking in the window on the left side. At the cop should be three tabs: "Console", "Terminal", and "Background Jobs". The console, which is the default, is the communications channel with `R` where we can input individual commands and see the otuput and is the most commonly used tab for us. To install our first package, we will use the base-R command `install_packages()` and the package we will install is *usethis*. To complete the task, enter the command `install_packages("usethis")` at the carrot-prompt in the console and hit enter. It may ask you to choose a CRAN site and you should just need to enter the number for your choice. Different CRAN sites will have different archieves of past versions, but all will have the most recent version of any given package. You will see some feedback in the console showing you that `R` is donwloading the package and installing it in your library file. Note that this simply installs it on your system, to use it in `R` we will still need to load it into the environment and we will do that later.

Another nice package we will use frequently is the *tidyverse* package which is a collection of several packages that make getting, clearning, manipulating, and visualizing data of various types (numbers, character strings, dates, ect.) much easier and intuitive. How do you think you would install this package?

<details>
  <summary> Example </summary>
  
```R 
install_packages("tidyverse")
```
</details>

## R-Studio and Git/GitHub
Next we want to link `R Studio` with `Git` and allow it to access GitHub. We will discuss `R Studio` more later, but it is basically a Graphic User Interface (GUI) that combines several data tools and allows use to more easily interact with `R` which is a command-line based program. We do not have to use `R Studio` to utilize the feature of Git or GitHub because we can use the command line prompts (Git Bash) for that as well. Since `R Studio` provides a standard means of interacting with `R`, especially for novice users, we will continue to use this. With `R Studio` still open, go to the menu across the top of the screen and locate `TOOLS --> GLOBAL OPTIONS` and a smaller screen will open. Along the left side, click on the part that states `GIT/SVN` and then make sure the box at the top is checked and then in the area below "Git Executable" you need to navigate to the `git.exe` file. On a PC, it will be located at `C:/Program Files/Git/bin/git.exe`. You can either type this address in or you can naviagate to it via the Browse button. Once this box is filled in, click Apply and then Okay.

<p align="center">
  <img src="https://github.com/jrgroves/ECON691/assets/52717006/668fbf18-bb98-414e-9b94-d79e1ea9aa00"/>
</p>

Next, we need to allow GitHub and `R Studio` to talk to each other securely and for that we need a personal passkey. Fortunately someone wrote a library and program in `R` for just that purpose. Since we are not going to download the full library with these commands in them, we can use the `usethis::` command prefix and then use the command `create_github_token()`. 

```R
usethis::create_github_token()
```

This should open up GitHub on your browser and ask you to log in. Once you do that, name your passkey whatever you want and then click on the drop-down menu and choose at least 90 Days. Scroll to the bottom and click Generate Token and you will get a sting of letters and numbers. This is Hexadecimal text and make sure to copy this and then paste it either in a Word file or a text file because once you close this window, you will NEVER get this token back. If you lose it; however, you can just generate a new one and use it. Once you have copied the code somewhere else, go back to R-Studio and then type the following in the console.

```R
gitcreds::gitcreds_set()
```

You should see a set of options and you should choose `2` and then when it asks for the token, paste the hexadecimal code you copied and press enter. This will save the passkey in the R system files and you will only need to do this again if your code expires or, sometimes, when you update R.  

# Navigating R Studio

`R Studio` is a GUI, or Graphic User Interface, and allows us to access a command-line type program such as `R` in a more familure windows-esk environment. When you first open `R Studio` you will typically see the screen split into two panels with a long window on the left and another split-panel on the right.

<p align="center">
  <img src="https://github.com/user-attachments/assets/dc5e7e76-d5f0-40aa-9913-1de3d301d3d9"/>
</p>

The left panel is our Console and this is what `R` is reporting. You can use this to enter single commands to `R` and then see the output from `R`. One of the key elements in this screen is the version located at the top of the print out. On the right side we have two panels, each with a variety of tabs. The upper-right panel is typically showing the *Environment* for `R`. This shows that "exists" in `R` in terms of objects or functions. With a fresh start such as this, the environment is barren and so `R` can not perform any analysis or do much because there is nothing to do anything to. Other tab of interest to us is the *History* tab. This allows us to access a log of all commands issued to `R` in our session.

The lower-right panel acts as a auxiliary system that contains a file explorer, graphic viewer, and help screen. Again there are a set of tabs and the standard default is usally the *Files* tab. This is just like your file management system on your computer or windows explorer on a PC. The default location is typically the *Documents* folder on your system, but to see, we can go to the Console side and type the command `getwd()` which tells us the current working directory. Quickly notice thas as you started typing the console, `R Studio` tried to guess what you wanted in order to speed things up. This can be both a benefit and a curse so be aware and wary of it. Whatever the output shows, that is what is showing in the default view of the *Files* tab. 

If you click on the *Plots* tab, you will see a blank screen. This tabs shows us any visualizations that we create in `R`. Remember that `R` is a command-line type language so it is text based and visualizations do not get "printed" in the output. Rather `R` saves the "code" for a visulization and then either saves it as an external file (.png, .jpeg, etc.) or just keeps the code in the environment. You need a seperate program to translate the code into something visual and that is what the *Plot* tab does for us. Next is the *Packages* tab which shows all of the packages you have installed in your library and allows you to manage them here if you wish. We will not use this. The more useful tab is the next one labeled *Help*. We can input any command in the textbox in the upper-right cornor of this tab and `R` will search through all of the packages and base `R` on our system and give us information and examples of that code. To see an exammple, type in the `getwd` command and see what help shows us. The last two tabs are used if you are doing `LaTeX` or `R Markdown` in `R Studio` which we do not have time to get into. 

Across the top of the screen we see the standard "windows" type file system with our usual suspects: *File* and *Edit* all the way to *Help*. For our purposes we will mostly use the *Files* and the *Tools* command blocks. If you look to the far right along the top, you will see a drop-down arrow with the phrase **Project: (None)**. We will revisit that in a bit. Instead, click on the *Files* with your mouse and move down to the *New Files* item. This opens us a list of all the different types of files we can create within `R Studio` and you can see there is quite a bit which is why `R Studio` is so versitile. We will just lick the top choice of an *R Script*. When you click this the console window will shrink and slide down with a new window opening on the top-left side. This is, for all intense and purposes, a text editor and is where we will type our "script" that we want to run in the `R` environment. In this window, you will notice some icons across the top of the tab. The disk is to save the file and the *Run* icon will run the line the curser is located on whereas the *Source* icon will run the entire script. If we open additional scripts, they will show up in this window under different tabs along with any data views we use. 

# Project Management

To run an effective project, be it research or homework, you need to be organized. Organization also helps you work with others and remember what you did and why when you revisit a project either an hour or a year after you started it. Organization also helps you should you need to prove or verify your work either to a professor or a journal when you submit for publication. This later issue, that of reproducability, is becoming even more important given the number of cases of academic misconduct being uncovered, even among Nobel Prize winners. We are going to organize our project in `R Studio` and then back it up in a GitHub Repository for both protection and for easier remote access by ourselves or co-workers. We start the process in reverse however.

## Create Repository on GitHub

A Repository is a place on the GitHub cloud where you can keep relevant files for any given project. I advise that you create a Repository for any and every project you work on as it will allow you to both maintain version control and ensure everything is located in one place and has a backup. While there are several ways to start a repository, we will utilize the GitHub page to start. 
Go to [GitHub](www.github.com), log into your account, and click on the green NEW button. In the top dialog box, input the name of your responsitory (ECON691_ABC - with ABC being your initials) and then, further down the page, click on the radio button for **README** file. Finally, ensure this is a public repository and then scroll to the bottom and click on create. This will take you to your repository page. This should look very close to the screen we used when learning markdown in GitHub and you can modify files here just as you did in that exercise. We, however, are going to use `R Studio` to do our editing. 

## Create Project in R-Studio

`R Studio` has a system built into it that acts as a means for keeping information and data on a project together called *PROJECTS*. We can create a project on our computer only, or we can link it to a GitHub or similar type repository. Creating projects, however, is of little use if we do not know where we left them so we are going to use the File Explore feature in `R Studio` to create a **Projects** directory somewhere on our computer. To do this, navigate to the *Files* tab in the lower-right screen in `R Studio` and navigate to where you want your **Projects** directory to be located. Once there, click on the *New Folder* icon across the type of the *Files* tab and create a **Projects** directory.

Next we will return to that drop-down arrow in the upper-right corner that says **PROJECT(none)**. Click on this and choose "New Project". A small screen will open on your computer and you need to click the Version Control banner and then click on the Git banner.  

<p align="center">
  <img src="https://github.com/jrgroves/ECON691/assets/52717006/64332c4b-b877-40b7-bc5b-a5c91569ecc3"/>
</p>

The window that is now open is asking for the URL from the repository that you created on GitHub which you can get by simply navigating to the repository in your web browser and copy the URL from the location bar at the top of the browser. Once copied, you can paste in the URL space and that will typically auto populate the Project Name dialog box below it. The third box is were it will live on your computer and if not already dhowing your **Projects** directory, click the browse button and navigate to that directory. Once you are there and click open, click the "Create Project" button on the screen.  

<p align="center">
  <img src="https://github.com/jrgroves/ECON691/assets/52717006/6a2e5628-6035-4016-9ab1-997a0459726a"/>
</p>

Once you hit "Create Project" it will appear that `R Studio` reloads and we will be ready to start working. The other thing this action does is "clones" the repository at that URL you listed and populates your computer with anything located in that reponsitory. YOu can verify this because a thrid thing that happens is that the *Files* tab switches to a newly created directory within your **Projects** directory with the same name as your repo on GitHub and sets the working directory in `R` to that location. To verify this, type the `getwd()` in the console and see what is reported.  The last thing you should notice that is different is that there is now a new tab in the upper-right window of `R Studio` called *Git*. Under this tab is one way we can interact with both `Git` and GitHub.

## Your First Push
Version control allows us to keep track of changes both by us and anyone else that has permission to access our repository. It does not, however, keep track of all of our key strokes and it can only track what we tell it to track and it takes a "snapshot" only when we tell it to. Whenever we create or modify a file, version control, or in this `Git` will recongize that it is different than what is currently in the repository, but that is the extent of what it will do on its own. We we complete our modifictaions and want to update what we have on our main or branch, we must first "stage" the files. 

We can stage as many files as we want and we can think of "staging" as placing our newly changed files in an envelop that we are going to "mail" to our repo. To actually submit the changes so that version control will commit them to "memory", we have to commit them. When we commit a set of changes, we have the option to add a comment to our commit to tell ourselves or others what we changed in this part that is being committed. Once we commit, version control creates a new "version" of the project using those files and creates a history which contains the older versions of our project prior to those changes that were committed. To summarize the process using an example, lets say we have a some sort of project that is out in the world, such as a software program. Overtime we decide we need to add features, remove obsolute features, or fix errors, but we do not want to mess up what we have that works. This is where creating a "branch" comes into play. A branch starts with a copy of what we currently have "out in the world" and we can "check out" the program, make changes, and then commit those changes to the branch. Let's say our changes are going to take a month to finish; we would want to commit our work each day or couple of hours so we do not loose anything, but by committing it via version control, if we every realize we were going in the wrong direction, we can always recover some previous version. Only after we have made all of our changes and run the branch program to test it, will we merge our branch back to our main which then replaces the original program with the new version while still keeping a historical version of the original. 

To pratice this in our example, we are going to start a script file so go to the File --> New File --> R Script and start a fresh script in our editor window. When writing a script, everything we type is going to be "read" by `R` as a command unless we tell it otherwise. This is where commenting comes in. Commenting allows us to leave notes for ourselves or others about what is going one in the program to help both ourselves and others remember or understand what is going on. In an `R` script we can "comment" out a line by starting it with **#** (hash mark) and then everything after that mark will be ignored by `R`. note that we can put this at the start of the line to have `R` ignore everything or we can place it anywhere else on the line to have `R` ignore everything to the right of the mark. In the spirit of readability and reproducability, we should always start a new script with some basic information telling a reader what this script is supposed to do, note anything that should be done prior to running this script, who wrote the script and when, and any updates or major changes. So in your editor, input the following lines with the relevant information.

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

