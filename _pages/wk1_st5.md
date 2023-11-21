---
title: Week One, Step Five
author: Jeremy R. Groves
---

# Week One - Step Five

## Your First Project and Script

Now let's write our first script. To do this we need to access the script editor in the upper-left by choosing the down arrow next to the white sheet of paper in the icon bar in the upper-left and choose "R Script". This will open a new window, similar to our text editor window, in the upper-left with our console being pushed below. One important element with research is reproducibility and that is important for not just you, but also anyone else that my come along later (even older you). Additionally, you want to know when and where you are working on things so it is always good to start each new script with comments. In R, the `#` is the comment indicator. ANYTHING on a any line after the hash mark will be viewed by R as a comment and thus ignored. You can also use the hash mark to section off your code by placing five hash marks at the end of the comment, but we will wait until later to discuss this.

At the top of your code you should list point of this script, your name, and the data you created it. You can do something like this:  

```R
#This is the script for the first project in ECON 691 with R
#Jeremy R. Groves
#Created on: November 8, 2023
```

The next thing you want to do is clear your environment and make sure there is nothing hanging out somewhere that might mess up your code. The command to completely clear the environment is `rm(list=ls())` with the `rm()` command denoting **remove** and then the object(s) you want removed. Here we are telling R to create a list of everything in the environment and then to remove everything on that list. This should ALWAYS and ONLY be at the top of a script. Everything before this (such as our comment, which R already ignores) is now gone from R's memory and thus, from R's perspective, no longer exists. Now you want to start populating your environment with the items you are going to need to carry out your analysis. Generally the list is going to include: packages, data, functions, and code. We will look at each in turn.

### Packages

R is a simple and very basic program. There are basic tasks it can perform, however, the real power comes from the packages that other create for specific tasks that can be added to the library. While you can install a package anytime in a code, it is best to install them first because it ensures you do not try to use a command before R knows it and it ensures that anyone else using the script can see what packages they may need to install to replicate your work. Since the first step of most data analysis is to clean and organize the data, the first package we will talk about will likely be the most common one you will use and that is the [*tidyverse*](https://www.tidyverse.org/) package. This package is actually a "universe" of packages created by several users and finally combined into a single package. Before we can use this package, we must download it similar to what we did earlier when we set up the GitHub connection by going to the *Tools -> Install Packages* in the main menu and then search for *tidyverse*. After it is installed on your computer, we need to let R know we want it install this package into the library along with the base R commands using the library command `library()`. Note that if you clear the memory after this command, the package will be "forgotten" by R so do not clear the memory in this script again.

One element that is pivotal to the *tidyverse* packages is the use of "pipped code" which is where we can tread a series of commands together in a nested fashion of sorts which both simplifies our code and makes it more readable. The key to piped code is the piped syntax `%>%` which you can read as something similar to "and then". There are also many commands you can use in a given package and even when you use it frequently, there will be times when you just can't recall the syntax of a command. This is why cheat sheets are invaluable for coding. In our case, the part of *tidyverse* that deals with data cleaning and organizing was originally called *dplyr* and there is a [cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf) for this part of *tidyverse*. If you recall the command, but not the syntax or you are getting an error message, you can also go to the lower-left panel in R Studio and click on the "Help" tab. Once there, enter the command in the search box. To see this work, let's enter the command `mutate()` into the search box. Several items will come up, but we know that this is part of the *dplyr* package so we look for the entry *dplyr::mutate* and click that. The new screen tells us everything we need to know on mutate. Finally, we can also do a google search and find something similar to what we just found in the "Help" tab.

### Data

When working with data, it is a best practise to always start with the data in its most basic form and then manipulate, clean, and organize everything in code. This is compared to the case of opening the data in something like Excel, making changes, and then working on it with scripts. The reason is replication and transparency. By doing everything in a script, neither you or anyone else has to remember what you "did to make it work" not to mention is provides transparency to ensure that you did not "rig" your data. This also gives us an opportunity to talk about project file structure, which is important for both replication and understanding. Projects can be as small as a single script with a single dataset or as complex and one with multiple codes, functions, and various data sources, so we want to have some type of rational organization to help figure out where things are. Additionally, we want to ensure that anyone with access to our repository can quickly download the information needed and replicate the work without having to retype all the directory locations in the code. Projects help us do that in R Studio along with the File tab in the lower-right window. 

Click on the Files tab and you should see something similar to this:  

![image](https://github.com/jrgroves/ECON691/assets/52717006/710a7919-2d86-48e0-b965-dc663631f7be)

First, notice that next to the nice house icon you will see **Home > Projects > ECON691JRG** and this tells you where you are on your device. Recall, I put all my projects in a **Projects** subdirectory and that the name of this project is "ECON691JRG". The two files that you see in the image are the ignore files and we will do just that right now. You should also see on your screen the README.txt file we created earlier. Just above the pretty house you can see some file manager commands and we will use the "New Folder" button to create a new folder inside our project directory and we will call it **Build**. Now use the same method to create a folder called **Analysis**. We will put all the raw data and scripts cleaning the raw data in the build folder and then the scripts and output from our analysis in the analysis folder. I typically also add a **Paper** folder since most projects are going to result in an essay being written. Now click on the **Build** folder and you will be inside another empty folder. Create the following folders in this **Build** folder: **Code**, **Input**, and **Output**. I am assuming you can guess what will go inside these folders. You can also add the same folders to the **Analysis** folder as well if you like. 

We need data to do some analysis too and so we will download some data from the BLS Quarterly Census of Employment and Wages. If you are going to modify data and then import it into R, it is best to save the data you will import as a CVS file which is a comma separated file. Saving in text files is preferred because they are "basic" and any computer can read them without the need for other programs. If I tried to open an Excel file on a computer not connected to the Internet and without Excel, nothing would happen. If I try to open any text file on any computer, the built-in text editor can read it. If I tried to do that with Excel data, the file would be gibberish. Please download the file at the link below and save the data in the folder "**Build/Input**".

[BLS Quarterly Census of Employment and Wages - March 2023](https://github.com/jrgroves//ECON691JRG/Build/Input/BLS March QCEW.csv)

Now if you use your file manager in R Studio to navigate to the **Build/Input** folder, you will see the data. To read it into R we would just click it here, but we want to keep track of what we do by using scripts. Therefore we will add the following command in the script after our library commands.  

```R
library(tidyverse)

#Read in Data
qcew <- read.csv(file="./Build/Input/BLS March QCEW.csv")
```

Looking at this code, the command `read.csv()` is what instructs R to look for the csv file and different file types will use different commands. Furthermore, if you have unique file times (Excel, etc.) there are usually packages for handling those as well. The most important part of the command, however, is how we reference the location of the file. This is another advantage of having projects because the "." is telling R to look at where the project is located on the specific device that is running the code. What this does is keeps other users from having to retype your code to account for where they put their projects compared to where you put them. This is even more helpful with Git and version control because when I pull down your repository, if you have typed your code as such, then my system know that it is go wherever the project is located and start there as the working directly.  

Running this will read the data file into the R environment creating a dataframe called *qcew* with the information in our data. To verify this happens we need to actually run the script. At this point we have simply been typing the commands but not running them. We can run a script a few ways. The "in-progress" method is to put your cursor on the line you want to run and then use "CRTL-ENTER" on your keyboard and this will run this line (or lines if there is pipped code) only. You can accomplish the same thing using the "Run" button in the upper-right of the script editor window and/or by highlighting the code you wish to run with your mouse and then using either 'CTRL-ENTER' or the "Run" button. Another means is by clicking the "Source" button in the script window. If we do this, it will run the entire code in the script. If we push this, notice we get a window telling us to save the current script so let's do that in the **Build/Code** folder and let's call this "script 1". Once the code runs, we can make sure it worked by first seeing if the object qcew is in our environment and then by typing `head(qcew)` in the console and seeing what happens.  

### Functions

Functions are not something you will use often, but knowing how to use them can be helpful if you have a task that you are forced to do multiple times. A function is another type of object, just rather than having data in the object, it has a set of commands that are performed on another object. For this example, we will create a function that will print the names of the columns and number of rows and columns of any dataframe. The basic syntax for a function is similar to any assignment only we are going to use curly brackets `{  }` to denote the range of commands for R to consider as part of the function. If you have a function in the script, R will not run the function, but it will read it into the environment to be used at any time in the future when you call the function. To actually use the function, you have to call it using the name you assigned to the function. Furthermore, if you change any element of the function, you MUST re-run the function part of the script to update what is in the R environment.  

```R
info <- function(x){
  print(names(x))
  print(ncol(x))
  print(nrow(x))
}
```

We see the function name is going to be *info* and there will be a single argument (the "x") input into the function. We then type the open curly brackets ({) and then move to the next line. I like to tab over so that I can see what is in my function more quickly, but it is no necessary. The `print()` command tells R to display in the console what is being fed to the command. In the first command we are having R list the names of the columns of our object. Next we are doing the same for the number of columns (`ncol()`) and then the number of rows `nrow()`. Once we are done with our command, we go to a fresh line and enter ONLY the close curly brackets which tells R we are now done with our series of commands. When we run the function (we must put the cursor on the first line to capture the open curly bracket so R know to keep going until the close curly brackets) we will see a new part in our Environment tab called Functions and see the object info. See the function at work by typing `info(qcew)` in the console. 

Return to the script editor and remove the two lines that print the number of columns and number of rows and replace it with the following:

```R
  temp <- paste0("The object ", print(deparse(substitute(x))), " has ",nrow(x)," rows and ",ncol(x)," columns")
```

The `paste0()` command is similar to concatenate in Excel and it combines several things into a single character string. The parts in quotations are the text objects and the items without quotes are the commands we use from R to get that information. There is also a `paste()` command and the difference is that the former does not have a separator that it places between each element whereas in the latter you would need to define the separator with the added element `, sep = )` at the end of the text string you are creating. Now return to console and push the up arrow on your keyboard the R Studio will recall the last command input. If you continue with pressing the up arrow, it will continue to scroll through the previous commands in order. You want to get the `info(qcew)` command and then hit enter. Notice you get the same output as before. This is because we have changed the function in the script, but we have not sent that change to R so it is still using the original version. If we place our cursor on the first line and hit run, the function will be re-read into the R environment. Push the up arrow again and you should see ONLY the names of the columns and nothing else. 

This is highlighting the idea of the "local" and "global" environments. Once we enter a "function" we have entered a local environment were we can create new objects and modify existing objects. Notice, however, that the object we created, *temp* is not in the environment. This is because it only exists in the local function environment. While it can be accessed and used at anytime while R is running the function `info()`, once it is completed the function, it forgets anything that it created or did in the local environment unless it is instructed to return those things to the global environment. For example, if I added the line `x <- NULL` the function will, in the local environment, replace the object *qcew* with the empty set. Since I did not tell it to return that change back to the global environment, it forgets that operation and qcew is not changed. To prove it did what we told it to do, we can add `print(names(x))` after we clear the data and then run the function and see that there are no names because the dataset is the empty set. 

Rather than do this, however, and risk loosing our data, let us remove these (if you put them in the function) and simply add the command `return(temp)` to the end of function. Running this will output the sentence now, but still not save the object temp in the global environment. To get R to move the temp from the local to the global we need to modify our assignment syntax to `<<-`. The double arrow tells R to create an object in the global environment that follows the assignment for temp. If you add this double arrow to the function, refresh it in R, and then call it, you will now see the object temp as a value (specifically it is a character vector with one object).

### Code  

Now we code. We noticed that two the names are the same and that one of the names has spaces, both things that will cause confusion. Again, there are numerous ways to do this, but we will use the most straight forward way here by simply changing the fourth, fifth, and sixth object of the names(qcew) object as follows:  

```R

names(qcew)[4] <- "PctChg_Emp"
names(qcew)[5] <- "Avg_Wage"
names(qcew)[6] <- "PctChg_Wage"

```

Use our function `info()` and see the names changed.

The next command we are going to learn is the `mutate()` which is part of the *tidyverse* package and it does just that, mutates or changes an object. This is the command we can use to create or alter an existing column of data. In our case, we see that number of establishments is VERY large so to scale it down we want to divide it by 1,000 and do the same thing with employment.  We use the following code to changes there variables:  

```R
bls <- qcew %>%
  mutate(Establishments = Establishments / 1000,
         Employment = Employment / 1000)
```

Dissecting this code we see our assignment and we are choosing to assign these changes to a different version of our data in case we make a mistake we do not have to reload the original data. Next we have our pipped syntax telling R that we are not done yet and then we call the `mutate()` command. The advantage of using the pipped technique is that we do not have to tell R what dataframe we are altering because we did that in the first line. It knows that everything we do is going to be done to the qcew object. This also helps when we are calling on specific columns because we can simply refer to them by name rather than using the dollar sign syntax or something else. Finally, we are assigning all of these changes to a new dataframe, but we could have overwritten the original one by assigning the changes to the original object name. When we call the mutate command we see that we want to mutate the Establishment and Employment columns by taking that same column and dividing by 1000. We do not have to call the mutate command again because we can just place a comma, which tells R there is more to come, start a new line and type out the next mutation.

We can verify we have done what we think we have done by using the `head(qwce)` command and we notice that the first entry is not a state, but the national average. We want to get rid of this and there are a few ways to do this using the tidyverse and base commands in R. One approach would be to use the locational elements and simply overwrite the dataframe. That could be done with the code `qcew <- qcew[2:52,]` which overwrites our original object with only rows two through fifty-two and all the columns. The problem with using this is that as you modify your code, the national average might move and no longer be in the first position meaning this code no longer is doing what you want it to do. Therefore, we use our *tidyverse* package and its commands to solve the problem and we can do it by simply adding a new command to our existing pipped set of commands that clean up our data. 

```R
bls <- qcew %>%
  mutate(Establishments = Establishments / 1000,
         Employment = Employment / 1000) %>%
  filter(!grepl("United", State))
```

We can then copy and paste our text from our console or we can use other elements within the *tidyverse* pacakge that deals with character strings (originally the package *strngr*). In this case we are using the exclamation point (!) as a "not" logical argument and we use the command `grepl()` to find all the cases where the text string "United" can be found. In the `grepl()` command, there are two arguments. The first is the string pattern we are looking for and the second (after the comma) is the column we want to look in. Since we are using the "not" operator, we are telling R to filter (or keep) all the rows of STATE that DO NOT contain the pattern "United" in it. Once we run this and use the commands `head(bls)` and `head(qcew)` you should see the differences between the two objects. 


### Saving and Pushing

We are done. Save this script by clicking the disk button in the script editor and then click Source to run it. You should then by able to type `summary(bls)` in the console and see that the columns names have changes and the values of the Establishment and Employment variables have been divided by 1,000. This command also reports the summary statistics for any numeric variables. If we wish to save the _bls_ object, we use the command `save()` with the syntax `(object name, file="")`. For us we will put our bls object inside our **Build/Output** folder so we will use the command `save(bls, file="./Build/Output/bls.RData")`. Since we are done, let us go to the upper-left window, click on the Git tab, stage and commit both our data and our script file and then push this to our repository.

[Click to Start Week Two](wk2_pt1.md)

