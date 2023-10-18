---
title: Week One - Step Two
---

# Step Two: Setup and Configuration
Now that we have the programs installed using the default options, we need to make some configuration changes and setup some options within the softward. We will be mostly working inside of R Studio for this, but first we need to make a change in an R file controlling where the program installs the libraries we will be using.
## R Library Setup
R uses the idea of libraries as a means to expand what the program can do. Libraries are created by users and approved by the R developers and then hosted on the CRAN site for individuals to download and plug into R. Another aspect of how R works is that when the base R is updated and you install the new version, it DOES NOT overwrite the previous version, rather it installs the new version along side the older version. The reason for this is that some of the libraries fall out of use and are not updated for new R versions. If that is the case, you will be unable to use them in the new version; however, you can use them in the older versions of R. This is typically not an issue we will encounter so we will just ignore this possibility. 
A direct consequence of the way R installs updates, if you update R to a new version, you will need to reinstall of your libraries under that version unless you store them in a centralize location other than within the current version of R. This may sound like work; however, it can be done automatically by making a single change in the main R file, called Rprofile.R, that is run everytime R starts. You can find this file (on PC) at `C:/Program Files/R/*current install*/library/base/R`. Navigate here and then find the file Rprofile.R and right-click and choose to edit with Notepad++ or other text editor. When it opens, scroll all the way down to the bottom and then add the following text.
```R
#My Stuff

myPaths <- c("C:/Users/HP/Documents/R/userLibrary", .libPaths())
.libPaths(myPaths)
```
This code is creating editing an object called "myPaths" and adding the user defined folder named "userLibrary". In this text I have placed it in my Documents folder under my username and a subfolder called R. You can put this anywhere on your computer. The second line runs a command that updates the paths where R will look for libraries. Also note that we listed our new library first because that will also be the default location for installation.

## R-Studio and Git/GitHub
Now we need to set up R-Studio to be able to utilize Git and access GitHub. We will discuss R-Studio more later, but it is basically a Graphic User Interface (GUI) that combines several data tools and allows use to more easily interact with R which has no native GUI. After you open R-Studio, go to the menu across the top of the screen and locate `TOOLS --> GLOBAL OPTIONS` and a smaller screen will open.
[Insert graphic]
Along the left side, click on the part that states `GIT/SVN` and then make sure the box at the top is checked and then in the area below "Git Executable" you need to navigate to the git.exe file. Typically, on a PC, it will be located at `C:/Program Files/Git/bin/git.exe`. Once this is done, click Apply and then Okay.

Next, we need to allow GitHub and R-Studio to talk to each other securely and for that we need a personal passkey. Fortunately someone wrote a library and program in R for that purpose, but since we only need this once every so often, we are not going to actually download and install the library. To use a library without installing it, we use the command `usethis::` so type the following command in the console (the large window on the left side) of R-Studio.
```R
usethis::create_github_token()
```
This should open up GitHub on your browser and ask you to log in. Once you do that, name your passkey whatever you want and then click on the drop-down menu and choose at least 90 Days. Scroll to the bottom and click Generate Token and you will get a sting of letters and numbers. This is Hexidecimal text and make sure to copy this and then paste it either in a Word file or a text file because once you close this window, you will NEVER get this token back. If you lose it; however, you can just generate a new one and use it. 
Once you have copied the code somewhere else, go back to R-Studio and then type the following in the console.
```R
gitcreds::gitcreds_set()
```
You should see a set of options and you should choose `2` and then when it asks for the token, paste the hexidecimal code you copied and press enter. This will save the passkey in the R system files and you will only need to do this again if your code expires or, sometimes, when you update R.

