---
title: Week One - Step Two
---

# Step Two: Setup and Configuration
Now that we have the programs installed using the default options, we need to make some configuration changes and setup some options within the softward. We will be mostly working inside of R Studio for this, but first we need to make a change in an R file controlling where the program installs the libraries we will be using.
## R Library Setup
R uses the idea of libraries as a means to expand what the program can do. Libraries are created by users and approved by the R developers and then hosted on the CRAN site for individuals to download and plug into R. Another aspect of how R works is that when the base R is updated and you install the new version, it DOES NOT overwrite the previous version, rather it installs the new version along side the older version. The reason for this is that some of the libraries fall out of use and are not updated for new R versions. If that is the case, you will be unable to use them in the new version; however, you can use them in the older versions of R. This is typically not an issue we will encounter so we will just ignore this possibility. 
A direct consequence of the way R installs updates, if you update R to a new version, you will need to reinstall of your libraries under that version unless you store them in a centralize location other than within the current version of R. This may sound like work; however, it can be done automatically by making a single change in the main R file, called Rprofile.R, that is run everytime R starts. 
