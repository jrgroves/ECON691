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

![image](https://github.com/jrgroves/ECON691/assets/52717006/668fbf18-bb98-414e-9b94-d79e1ea9aa00)

Next, we need to allow GitHub and R-Studio to talk to each other securely and for that we need a personal passkey. Fortunately someone wrote a library and program in R for that purpose, but since we only need this once every so often, we are not going to actually download and install the library. To use a library without installing it, we use the command `usethis::` so type the following command in the console (the large window on the left side) of R-Studio.

```R
usethis::create_github_token()
```

This should open up GitHub on your browser and ask you to log in. Once you do that, name your passkey whatever you want and then click on the drop-down menu and choose at least 90 Days. Scroll to the bottom and click Generate Token and you will get a sting of letters and numbers. This is Hexadecimal text and make sure to copy this and then paste it either in a Word file or a text file because once you close this window, you will NEVER get this token back. If you lose it; however, you can just generate a new one and use it. Once you have copied the code somewhere else, go back to R-Studio and then type the following in the console.

```R
gitcreds::gitcreds_set()
```

You should see a set of options and you should choose `2` and then when it asks for the token, paste the hexadecimal code you copied and press enter. This will save the passkey in the R system files and you will only need to do this again if your code expires or, sometimes, when you update R.  

[Go to Step Three](wk1_st3.md)
