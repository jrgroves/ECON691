# Week One

## Setup and Configuration
Now that we have the programs installed using the default options, we need to make some configuration changes and setup some options within the software. 

### GIT Identification
The first thing we need to do is to identify yourself to `GIT` show that when we commit changes, we can know *who* made those changes. We will do this using `GIT Bash` which is the command line or shell version of `GIT` (similar to what we did in an early Tech Taco Tuesday). If you look at the set of files installed when you installed GIT on your machine, one option will be `GIT Bash`. Once that window has popped up, you are given the command prompt where you need to input the two lines of command. Use your own name and email address that corresponds to your GitHub account.

```bash
git config --global user.name "Jeremy R. Groves"
git config --global user.email "jgroves@niu.edu"
```
This will now tag all of your `GIT` work with your name and email so that we can make sure we know who has submitted what changes.

### R Library Setup
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

### R-Studio and Git/GitHub
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

## Navigating R Studio

`R Studio` is a GUI, or Graphic User Interface, and allows us to access a command-line type program such as `R` in a more familure windows-esk environment. When you first open `R Studio` you will typically see the screen split into two panels with a long window on the left and another split-panel on the right.

<p align="center">
  <img src="https://github.com/user-attachments/assets/dc5e7e76-d5f0-40aa-9913-1de3d301d3d9"/>
</p>

The left panel is our Console and this is what `R` is reporting. You can use this to enter single commands to `R` and then see the output from `R`. One of the key elements in this screen is the version located at the top of the print out. On the right side we have two panels, each with a variety of tabs. The upper-right panel is typically showing the *Environment* for `R`. This shows that "exists" in `R` in terms of objects or functions. With a fresh start such as this, the environment is barren and so `R` can not perform any analysis or do much because there is nothing to do anything to. Other tab of interest to us is the *History* tab. This allows us to access a log of all commands issued to `R` in our session.

The lower-right panel acts as a auxiliary system that contains a file explorer, graphic viewer, and help screen. Again there are a set of tabs and the standard default is usally the *Files* tab. This is just like your file management system on your computer or windows explorer on a PC. The default location is typically the *Documents* folder on your system, but to see, we can go to the Console side and type the command `getwd()` which tells us the current working directory. Quickly notice thas as you started typing the console, `R Studio` tried to guess what you wanted in order to speed things up. This can be both a benefit and a curse so be aware and wary of it. Whatever the output shows, that is what is showing in the default view of the *Files* tab. 

If you click on the *Plots* tab, you will see a blank screen. This tabs shows us any visualizations that we create in `R`. Remember that `R` is a command-line type language so it is text based and visualizations do not get "printed" in the output. Rather `R` saves the "code" for a visulization and then either saves it as an external file (.png, .jpeg, etc.) or just keeps the code in the environment. You need a seperate program to translate the code into something visual and that is what the *Plot* tab does for us. Next is the *Packages* tab which shows all of the packages you have installed in your library and allows you to manage them here if you wish. We will not use this. The more useful tab is the next one labeled *Help*. We can input any command in the textbox in the upper-right cornor of this tab and `R` will search through all of the packages and base `R` on our system and give us information and examples of that code. To see an exammple, type in the `getwd` command and see what help shows us. The last two tabs are used if you are doing `LaTeX` or `R Markdown` in `R Studio` which we do not have time to get into. 

Across the top of the screen we see the standard "windows" type file system with our usual suspects: *File* and *Edit* all the way to *Help*. For our purposes we will mostly use the *Files* and the *Tools* command blocks. If you look to the far right along the top, you will see a drop-down arrow with the phrase **Project: (None)**. We will revisit that in a bit. Instead, click on the *Files* with your mouse and move down to the *New Files* item. This opens us a list of all the different types of files we can create within `R Studio` and you can see there is quite a bit which is why `R Studio` is so versitile. We will just lick the top choice of an *R Script*. When you click this the console window will shrink and slide down with a new window opening on the top-left side. This is, for all intense and purposes, a text editor and is where we will type our "script" that we want to run in the `R` environment. In this window, you will notice some icons across the top of the tab. The disk is to save the file and the *Run* icon will run the line the curser is located on whereas the *Source* icon will run the entire script. If we open additional scripts, they will show up in this window under different tabs along with any data views we use. 

## Project Management

### Create Repository on GitHub

A Repository is a place on the GitHub cloud where you can keep relevant files for any given project. I advise that you create a Repository for any and every project you work on as it will allow you to both maintain version control and ensure everything is located in one place and has a backup. While there are several ways to start a repository, we will utilize the GitHub page to start. 
Go to [GitHub](www.github.com), log into your account, and click on the green NEW button. In the top dialog box, input the name of your responsitory (ECON691_ABC - with ABC being your initials) and then, further down the page, click on the radio button for **README** file. Finally, ensure this is a public repository and then scroll to the bottom and click on create. This will take you to your repository page. This should look very close to the screen we used when learning markdown in GitHub and you can modify files here just as you did in that exercise. We, however, are going to use `R Studio` to do our editing. 

### Create Project in R-Studio

`R Studio` has a system built into it that acts as a means for keeping information and data on a project together called *PROJECTS*. We can create a project on our computer only, or we can link it to a GitHub or similar type repository. One of the powerful features of `R Studio` is that it can also be used as a file manager. Notice in the lower-right windowTo start a project, go to `R Studio` and in the upper-right corner you will see a button that says **PROJECT(none)**. Click on this and choose "New Project". A small screen will open on your computer and you need to click the Version Control banner and then click on the Git banner.  

<p align="center">
  <img src="https://github.com/jrgroves/ECON691/assets/52717006/64332c4b-b877-40b7-bc5b-a5c91569ecc3"/>
</p>

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
