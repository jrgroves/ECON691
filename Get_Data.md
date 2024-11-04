---
title: Getting the X Files
---

# Getting Data

The core of any empirical research project is the data, and depending on your project and level of analysis, obtaining that data can be easy or hard. In microeconomic analysis, the easier the data is to obtain, the less ripe that avenue of research is likely to be. More often than not, the data you want is not going to be a simple point-and-click away. You'll need to find creative means to put the data together, so we'll look at various methods for obtaining data.

Additionally, it is more than likely that you will be bringing in some of the data from elsewhere, and so we need to learn how to read data into our `R environment` for analysis. Finally, we will likely need to join data from various sources to get the full dataset needed for a correct analysis.

Another important factor to keep in mind is the need for reproducibility. In terms of obtaining, cleaning, and merging datasets, we should keep the data we bring into our analysis as raw as possible and do any manipulation and merging within `R` via a script. This not only preserves the original copy of the data but also ensures we have a written record, via the script, of what we did and how we got the data we eventually used.

## Delimited Files

The best way to store raw data is in an independent form such as a delimited file, also known as delimiter-separated value, which is a text version of a file with some special character, commonly a "tab" or a "comma" used to seperate elements of an observation with each observation being on a single line. Data kept in propriety form will add a barrier to reproducability, especially if that program is no longer widely avalible whereas data in simple text of deliniated form can always be read. The most common form of data is saved as a .csv file which is a text file where each "column" of data is seperated by a comma. In this case you can simply use the *read.csv()* command to read the data into the global environment of `R`. As a project for our examples and assignments we will be utilizing data which tracts UFO sighting across the global from about 1910 which I obtained from the kaggle website[^1]. Using the command below will read the .csv file into the environment and saved to the object "ufo".

[^1]: https://www.kaggle.com/datasets/NUFORC/ufo-sightings?resource=download 

```R
ufo <- read.csv(file = "./Data/scrubbed.csv", header = TRUE, as.is = TRUE, sep = ",")
```

Before breaking down this command, there is one note we should make; there is an alternative version called *read.csv2()*. The difference is that the command above treates commas as sperators and periods as decimals whereas the latter assumes that periods are the seperators while commas are used as decimals. Now diving into the command we see first we list the location of the file and filename we want to read. Again we notice the use of the period to indicate the current working directory. Next we set the option "header" to TRUE to indicate that the first row of the data are column headers and thus should be used as the column names in the resulting dataframe. Next we tell `R` to read the file as it is formated meaning that characters are read as character and numbers are read as numeric. Finally, we have the option "sep" which sets the seperator for the deliminated file. The default is the comma, however, we can also use other options such as the bar "|". Running this command creates the object **ufo** and assign the data from the file "scrubbed.csv".  

Recall that `R` is an object-based language and the most common form of an object is a vector. This is what we created with our first script we wrote when we created the object **A**. The thing about vectors, however, is that they must be constructed of a single type of data meaning that we can not mix numerical and character data within the same vector (unless we translate the numerical data to a character type). You either still have the A in your environment or you can replace it by openeing the file "First.R" and then placing your curser in the editor window on the line that assigns the object **A** and clicking the "Run" button at the top of the editor window. Once this is done, type `is(A)` into the console and you will see 

```R
> is(A)
[1] "character"           "vector"              "data.frameRowLabels" "SuperClassMethod"
```

The key information here is that this is a "character" type and that A is a vector. We can add to this vector using the code `A[2]<-"Goodbye"` and now if we type **A** into the console we see we have both "Hello world!" and "Goodbye". We have a vector with two pieces of data, both of which are characters, and we can access them using the brackets and numbers just like with matrix vectors. Now type `A[3] <- 50` and hit enter and you see see that "50" is not listed in the environment as part of the vector object **A**. Finally, type `A[3]/5` and see what happens; you should get an error message. This is because a vector can only be of one type of data and when we entered 50 into a vector that is already made up on character types, R automatically assumed we meanth the character 50, not the number 50. 

Now type `B <- 50` and then type `B[1]`. You should get a read out in the console of 50 without quotation marks as quotations is a visual cue that the output is character not numeric. Now type `B[1]/5` and you should get 10. To see why, use the *is()* command to determine what object **B** is. You should see if it a numeric vector.

> What do you think will happen if you try to add the phrase "Over the Hill" to object B?

Typically, as is the case of our **ufo** object, we will need something with both numberical and character data along with other types and classes. To contain this, we need something else called a dataframe. Using the *is()* command we see that our object **ufo** is a dataframe made up of vectors. You can think of this as a matrix type element constructed of column vectors where each column vector contains data of a similar type. Another way to think of it is like an Excel spreadsheet. Because the object is a dataframe or a set of vectors, each vector or column of our dataframe has a name by which we can access and manipulate that vector. To get a list of names we simply use the command *names()* and input our dataframe (or other object) as the arguement. 

```R
> names(ufo)
 [1] "datetime"             "city"                 "state"                "country"             
 [5] "shape"                "duration..seconds."   "duration..hours.min." "comments"            
 [9] "date.posted"          "latitude"             "longitude"
```
We see that our dataframe contains information about the date and time of the sighting, the city, state, and country of the sighting, the shape of the object seen, how long it was visable in both seconds and hours, some comments about the sighting, the date the information was posted in the main dataset and finally the latitude and longitude of the sighting location. 

> NOTE: DO NOT use spaces in names of objects or vectors within a dataframe. Either use camelBack (capitlization of each word with no spaces), periods, or underscores. While it is possible to use spaces, it can create major complications and more often than not will lead to errors in running your code and confusion in reading your code.

To see our dataframe we can access it in a few ways. The worse way would be to simply type in **ufo** into the console. The method we use should be dictated by the goal. If we are simply checking to make sure all is well with the data, we can use the *head()* or *tail()* command. Using this for any object will hgive you the first six rows of the dataframe or last six rows, respectively. This gives us a feel for our data. If we want to see the entire dataframe, we can use the command *view()* which will open a spreadsheet like tab in our editor window space in which we can scroll through the entire dataframe. We can only view this, however, we can not edit anything. We can open a special editing window, but remember, we want to track all of our edits so we will avoid doing that. 

To get some practise with what we have done so far, use the green plus in the upper-left side of the `R Studio` window and choose "R Script" to creat a new script. In the fresh tab that opens in the editor, type of the code to clear the environement and then read in the "scrubbed.csv" file into the environment as the object **ufo**. Once you complete this, save it as "setup" using the blue disk in the editor. Try to do it yourself, but the code is below to help.

<details>
  <summary>Example: Scripting the X Files</summary>

  ```R
    rm(list = ls())
    ufo <- read.csv(file = "./Data/scrubbed.csv", header = TRUE, as.is = TRUE)
```  
</details>


## API Downloads
Another means of obtaining data, especially commonly sourced data, is to use an Application Programming Interface (API) command. An API is an interface between two programs to exchange information.[^2] The most common type of API is a REST API which uses commands such as *get()*, *put()*, and *delete()*, to transfer data via HTTP protocals. Each different API will have different requirements to setup communications; however, most use some sort of key and then a means of sending the *get()* command to obtain data. 

[^2]: https://aws.amazon.com/what-is/api/#:~:text=API%20stands%20for%20Application%20Programming,software%20with%20a%20distinct%20function.

For our work, we will learn to access the U.S. Census API which allows us to code downloads of data from the decinial census and the American Community Survey (ACS). This is such a common occurance, that there is a package writen to simplify the communication between our `R` environment and the Census servers, called *tidycensus*.[^3] The code below is an example of what we would use to download data from the 2020 five-year data file from the ACS server.

[^3]: https://statsandr.com/blog/web-scraping-in-r/

### Working with Census Data via API

Specifically the census data that we are going to working with is the ACS or American Community Survey. This is data collected by the Census every year and is used to fill in the gaps bewteen the full 10-year census carried out. In short, they do sample surveys of areas and utilize statistics to infer the population level statistics and then report them, at various geographic levels, along with the margin of error. While the data is collected every year, the more detailed the geographic unit being reported, the more survey years that are merged and reported. For example, State and National data are released every year; however, census tract or census block group data is reported every year but the data is a five-year moving average. Additionally, datasource is that is already linked to Geographic Information System (GIS) data so we can also use these files to draw maps as a means of visualizing the data or use geography as the necessary common element to merge data from different sources. 

This will also give us a opportunity to start working with packages which are add-ons to the base `R` that really give `R` its power. These are created by other users and can commonly be found and installed from either `GitHub` or the Comprehensive R Archive Network (CRAN). What is good about obtaining a package from CRAN over GitHub is that the former ensures that the package operates within the current version of `R` and adds a since of security. That said, obtaining a package from `GitHub` is not unheard of and should not be instantly ruled out. Utilizing any package requires two key steps: installing it on your local devise and loading it into the `R` environment. Everything we had done so far is included in what is called "base R" but that is very limited. There are two ways to install a package onto your local machine: via the command line and via `R Studio`. We will do both. 

For a command line install, we use the command *install.packages()* and then input the name of the package, in quotations, as the arguement. So in your console type `install.packages("tidycensus")` and hit enter. You will either get some red text or a list of CRAN archieve mirrors from which to choose. If the latter, then make a choice (preferably within the US since that is where we are located) and hit enter. If the former, ignore the text "WARNING: Rtools is required..." because we will not be creating any packages ourselves so we do not need this additional package. The rest of the text should tell you from where the package is being downloaded and where it is being installed. Finally it sould tell you the package was upacked sucessfully and the MD5 sums check out indicating it is not currupted. The alternative method is to move you mouse to the menu across the top of `R Studio` to "TOOLS --> INSTALL PACKAGES...". In the window that opens, type "tidycensus" in the blank spot. The top option is either a CRAN location or local package and the lower option is where to install it. This should be in the local directory for our library we set up in our previous lecture. If you do this, you will see a similar output as we did using the command line. 

The next task is to load this library into the current environment so we can use its commands. One command we will use is *get_acs()* and notice if you type it in the console now, you get an error stating that `R` can not find this command. The command to load an package is *library()* with the package name (not in quotations) as the argument. Since we are keeping track of what we are going, open the script "setup", if not still open, and go to the top. Add a few empty lines under the command `rm(list = ls())` and in one of those, add the command `library(tidycensus)` and then save the file. Now source the script to run the entire thing. In the environment tab you should see your object **ufo** and nothing else. To verify that the library was loaded, use the *get_acs()* command again and notice the different error message. 

> NOTE: The clean environment command MUST be at the top of the script and everything, including loading packages, must come after, otherwise they too will be removed. The clear environment does exactly that: it wipes EVERYTHING except base `R` from the current R memory.

Everytime we access the Census API, like any other, we will have to identify ourselves with our key. You should have received and saved an email from the U.S. Census with this key in it. While we could add the key to the *get()* command everytime we use it, a better alternative is to simply install the key into our perment R enviornment much the same way we changed the location of our package library. Fortunately for us, however, the creators of *tidycensus* created a function (or command) to do this for us. To utilize this, type the following into the console (because we only need do this once) and replace the text 'key' with the key you received (but keep the quotations because you are entering as a character). If this is the first time, set the install option to TRUE and the overwrite to FALSE. If you just want to temporarily change the key (for whatever reason), you would reverse those option settings. 

```R
census_api_key("key", overwrite = FALSE, install = TRUE)
```

The syntax of the *tidycensus* package is based on an API call and you can choose from two different sources at this time: "acs" and "decinial". The former is what we will use and the latter is the data from the 10-year population census. The ACS data only goes back to about 2001 (depending on the level you are looking for) and the decinial API only have 1990, 2000, 2010, and some 2020 data. The basic command we will be using is:
```R

acs <- get_acs(geography = "county",	#defines geography level of data 
               variables = vars,	    #specifics the data we want 
               state = 17,	          #denotes the specific state 
               year = 2021,	         #denotes the year
               geometry = TRUE)	     #downloads the TIGER shapefile data  
```

The command `get_acs` is the command to pull data from the ACS API and then we have to fill in the necessary elements to help the software find our data. The first is `geography` and this denotes what level of analysis we want. What we put here will dictate which of the surveys (1-Year of 5-Year) the API will pull from. Next we have our `varaibles` and we will return to that momentarily. Notice, however, that rather than a character string, we have an object here because we have defined an object previously that gives a list of the varaibles we want. We do this for simplicity and to limit out calls to the API. Next up we have our `state` and notice that we have a number, not a name or an object. Every geographic level of analysis that the census (and most every other federal data source created) as a unique identifier called FIPS Code. The FIPS stands for Federal Information Processing System and the code can be from two to (I think) thirteen characters long with the longer codes referencing more fine level data. For example, DeKalb County has a FIPS code of 017037 with the first three numbers indicating the state (Illinois and the leading zero is usually dropped) and the next three indicate the county (DeKalb County). If we looked at finer levels within the county, we would see additional values added to this code to inditify them. Based on this information, we can see that we are looking for the state of Illinois by using its FIPS code of 17. Next we have the `year` and this indicates what year were want the data from. We are asking for data from 2021 and, except for the 1-Year data files, this is the most recent that has been released at this point. Since we will be pulling from the 5-Year data files, we know that the data is from the surveyes dating from 2021, 2020, 2019, 2018, and 2017. Finally we have a command `geometry` and it is a logical arguement set to "TRUE". This will pull the necessary data to create polygons for each county. If we only want the data, we can set to this FALSE, but since we want to visualize the data we will keep it set to TRUE.

> NOTE: A comment about what is *NOT* here. For example, we have no entry for which `county` we want and this is because we want all counties within our state. If we only wanted a subset of counties, we could either create a character vector with the FIPS codes for the counties we want or listed their names (however, FIPS code ensure fewer errors). Another case where we might need to designate a specific county is if we choose "block group" as our geography level. Block Groups are a unit comprise of several census blocks and when one combines several block groups, one gets the census tract. For example, inside of DeKalb County, there are twenty-one census tracts composed of sixty block groups each. The FIPS code for block group 4 within census tract 9 of DeKalb County is 170370009004. Breaking this down, we have "17" as the state, "037" as the county, "0009" as the census tract and "004" as the block group. If we were to simply replace "county" with "block group" in the above code, we would download the entire set of blockgroups for the entire state of Illinois (a dataset with 9,691 observations).

### Variables and the Census  

The U.S. Census has data on several different aspects of american life, but they can mainly be broken down into demographic characteristics (items about the people in the population) and housing characteristics (items about the structures in the built enviornment). Finding the "name" of the data that you want is not necessarily the easiest thing to do, but there are a few tools to help you. One is to use the [Census website data center](https://data.census.gov/table/) and use this to search for your data. Another is built into the *tidycensus* package which allows us to create an object with the names and ids for all of the data series avaliable for any given year and any given survey, along with the smallest geography reported. To crate such an object, use the command below in the console. 
```R
acs <- load_variables(year = 2021, dataset = "acs5"))
```

Using the *head()* command we get:

```R
> head(acs)
# A tibble: 6 × 4
  name        label                                   concept                  geography
  <chr>       <chr>                                   <chr>                    <chr>    
1 B01001A_001 Estimate!!Total:                        SEX BY AGE (WHITE ALONE) tract    
2 B01001A_002 Estimate!!Total:!!Male:                 SEX BY AGE (WHITE ALONE) tract    
3 B01001A_003 Estimate!!Total:!!Male:!!Under 5 years  SEX BY AGE (WHITE ALONE) tract    
4 B01001A_004 Estimate!!Total:!!Male:!!5 to 9 years   SEX BY AGE (WHITE ALONE) tract    
5 B01001A_005 Estimate!!Total:!!Male:!!10 to 14 years SEX BY AGE (WHITE ALONE) tract    
6 B01001A_006 Estimate!!Total:!!Male:!!15 to 17 years SEX BY AGE (WHITE ALONE) tract
```

We can again, use the command *view()* and then hit CTRL+F to open the "find" task in the viewer and type in "Education" to highlight the different variables measuring eductiaon attainment. Our goal is to find the name that we will use to get the required data for our purposes. To get a feel for using this command, however, copy the following code block. Before you do that, use the viewer and finding tool to figure out what dataset we are getting with this code.

```R
cen.stat <- get_acs(geography = "state", 
                   variables = "B01003_001E", 
                   year = 2020,
                   survey = "acs5",
                   geometry = TRUE)
```
Finally, for a bit of fun, type `plot(cen.stat$geomerty)` and hit enter. What happens?

## Web Scrape

Another, and more complicated, means of obtaining data is through web scraping. This is the action of utilization of the fact that website are nothing but code that is translated by your browser into a visual form. As a result, there are methods of coping the html code into a program, such as R, and then filtering the code for the information you are looking for. We are not going to do an example of this given the complexity, but there are several sources of tutorials that can be found by searching for web scraping in `R`.[^3] 



# Cleaning Data

When we get data, in whatever form, it is never going to be in the exact form that we need leading us to to clean and massage the data into a form that we can use. The most comprehensive package for doing this in `R` is the package *tidyverse*[^1]. Another nice element of *tidyverse* is that we can "pipe" commands which makes our script both more readable and easier to write. An example of a piped code line is shown below for you to copy and run in your console.

[^1]: https://www.tidyverse.org/ 

## Tidy-ing things up

Let's start with our *setup.R* script and scourse the entire script to ensure we are up-to-date. We have an object called **ufo** which we know contains information on the sightings of UFOs globally. Our long range goal is to do the following:

- Limit the data to only the contential U.S.
- Aggregate the data to the level of decade while maintaining the year of the sighting as well.
- Be able to link the data to State level census population characteristics.
- Be able to create a map of the contential U.S. despicting the occurences in a given decade by year.
- Keep our file size as small as possible.

With those goals in mind, we will look at what we have in the data. Again, using the *head()* command, the first thing that sticks out is the fact that we do not need the data recording information about the sightings (although that could be an interesting source of information such as looking for key or common words or phrases--and there is a package for that). This means we will want to remove this column. We also see that the recorded date of the sighting is combined with the time and so we need to the year out of that vector and turn it into something useful. Finally, we see that there is latitude and longitude so we need to figure out how to get that into a form that is also useful. The code that will do most of this work is in the block below and you should copy this below the point in the script where we read in our data.

```R
ufo.us <- ufo %>%
  filter(country == "us") %>%
  select(-comments) %>%
  mutate(date = as.Date(str_split_i(datetime," ", 1), "%m/%d/%Y"),
         year = year(date),
         decade = year - year %% 10) %>%
  filter(decade > 1959)
```
## We will return after these breif comments
At this point, our code is starting to get a bit complex and so we need to make sure we remind ourselves of what we are doing and keep ourselves organized. To do this in a script, we add comments which is text that we can read in the script, but which `R` completely ignores. Just like it is important to have good file organization in a project, it is also vital to have good script organization and notation. Remember, we are trying to keep readability and reproducability in mind. To that end, we will add some comments to our script by adding text proceeded with the \#. 

The hashtag (\#) is the indciation to `R` to ignore what comes next on the current line as it is for humans only. We can use comments to title our script, remind us what it does, list any scripts that should be run prior to the current script, keep notes for ourselves and co-authors about key element in the script, and even create collapsable sub-groupings within a script. The first thing we will add is header information which should include what the current script does, the author, the creation date, and a discription and date for any subsequent updates or changes. Add the following lines to your script at the top of the page, either before or after the clear command.

> NOTE: We can place this information before the clear command because it is not used in the computation or even read by the program and thus is never put into the memory so cannot be cleared out.

 ```R
#This script is used to input, clearn and prepare our UFO sighting data for use in analysis
#
#By: *Your Name*
#Date: *Today's Date*
```

Next, we will divide our scipt up into sections. The first section we will title Loading Data and within that section we will load any external data. The next section we will title CLearning the Data and we will include the code block from above in that section. Your exercise is to input these titles as comments in the appropriate places. The answer is below.
<details>
  <summary>Exercise: Tracking our Path</summary>

  ```R
#Loading Data#####

#CLeaning the Data####
```
</details>

What you likely did not include, because you did not know, is the set of five hashmarks after the comment. Notice that when you type this, you will notice a "drop down arrow" appear on the far left side by the line numbers of the editor. Clicking this will collapse all the code either to the end of the script or the start of the next section. 

### Returning to our chores

Now if we run the script we will quickly find that we fail because of an error. Can you tell me why we have the error and what to do to fix it?
<details>
  <summary>Exercise: The Error of our Ways</summary>
  The error occurs becaue we are using commands native to the *tidyverse* package, but we have not either installed or loaded the the package into enviornment.

  The solution is to first install the package via one of the two methods we learned (either using the menu method or the *install_packages()* command) and then add the code line `library(tidyverse)' at the top of the script with our previous library loads. 
</details>

Once we accomplish that solution, when we run the code we get a new object named **ufo.us** that is smaller than our original version. Using the *head()* command we see we have accomplished several of our goals. To better understand this, however, let's break the code down, line-by-line. As a reminder, the code was:

```R
ufo.us <- ufo %>%
  filter(country == "us") %>%
  select(-comments) %>%
  mutate(date = as.Date(str_split_i(datetime," ", 1), "%m/%d/%Y"),
         year = year(date),
         decade = year - year %% 10) %>%
  filter(decade > 1959)
```

The first line is our assignment of our soon-to-be modified dataframe **ufo** to the new object **ufo.us** followed by the string `%>%`. This is the pipe symbol and can be thought of as an alternative to a function in that we are going to be running a series of commands on the dataframe assuming the above line has been completed. One of the key benefits is that we do not have to keep writing the dataframe name as the piped code assumes it is the same core dataframe used in the assignment line. 

The second line of code filters the dataframe to keep only the values where the country is designated as being within the United States. The next line allows us to select which columns we wish to keep in the dataframe. Notice, however, that we use the syntax "-comments" meaning "everything but comments". This syntax is an alternative to writing all of the columns we want to keep and is useful when we want to keep all but a few columns. If we have more than one column we wanted to drop, we could combine then using the *c()* command. Alternatively we could have replace the "-" with "!" which is the code to indicate "negate" or "not" so we would be telling `R` to select "not comments". Now, after removing the comments column, we want to create a column that tells me the decade in which the sighting occured. The *tidyverse* package is in realiaty a "universe" of packages that have been combined into a signle package to do various things. For example, the package *ggplot2* will allow us to create and customize graphics while the package *stringr* allow us to perform several key operations on character strings. Another package included is called *Luberdate* which helps us to use and manipulate dates by essentially creating a new class of objects that are dates. In otherwords, if we create the date as a date and then try to determine the number of days between October 1 and December 25, we would get the correct number of days accounting for the fact that October has 31 days while November only has 30. 

This line is also an example of a nested code line where we perform several actions on a single object in the same line and we read nested code from the inside out, similar to the orders of operations in math. Starting with the command *str_split_i()* which splits strings of charcters based on some pattern. The string we want to manapulate is the "datetime" column. To see our goal, type the code `head(ufo$datetime)` command in your terminal to see the first six rows of this column. 
> NOTE: rather than using the `head(ufo)` to get the head of the entire dataframe, we use the "$" to denote the specific column within the dataframe we want to see. This is one way to refer to a specific dataframe column. An alternative is to use the numercial location of the column we wish to view. Since the "datetime" column is the first column of the dataframe, we could reference it with `head(ufo[,1])` where the brackets denote the "[row, column]" location and a missing value instructs `R` to return all of that row or column.

We see that the data column contains a date and time together, but we really only want the date. Fortunately for us, the two pieces of information are seperated by a space and so we can split the string based on that element or pattern and that is what the second arguement of the *str_split_i()* command is telling `R`[^2]. Finally, this is a special version of the command because we only care about a subset of the string, specifically the first part of the split, and this is what the thrid option does for us. This leaves us with a date but it is still in the form or a character string and we want to be able to treat it as a date so we can, for example, order by date or translate to this a decade. One approach would be to split the string again. How would you write the code to pull out the year from the date using the *str_split_i()* command?

[^2]: When manipulating and analizing strings, we can more percision using a type of coding referred to as Regular Expressions. More information can be found at https://r4ds.hadley.nz/regexps.

<details>
  <summary>Exercise: Continuing to excise the year</summary>
  ```R
  str_split_i(str_split_i(datetime, " ", 1), "\", 3)
  ```
</details>

We will use an alternative approach of turning the chracter string resulting from our split into an object of the class "date" by using the *as.Date()* command. This command has to main parts: the string identification and the format of the string. We have already told the command to use the first element of the split string of the "datetime" column and we now need to tell `R` how the date is formatted in this character. Specifically it is in month ("%m"), day ("%d%"), four-digit year ("%Y%) with slashes ("\\") divisions. If we had text for the month we would use either "%B" if the full month is written out or "%b%" for the three letter abbreviation and if it was a two-digit year, we use "%y". Finally, this is nested in the *mutate()* command which is native to the *tidyverse* packages and is used to create new data columns in a dataframe. 

Once we get the date of the sighting, we want to get the year from that date and then assign that year to the correct decade. We could do this as nested code again, but remember that we want to also have the year of the sighting within that decade so we will use *mutate()* to create two new data columns. Rather than end the mutate command and type it again, we simply place a comma at the end of the line and hit return. `R` will typically treat commas and plusses as indicators that the code line is continuing and ignore the carage return. A nice feature of `R Studio` is how it automatically indents the next row of text to line up with the start of the previous start of the mutate command to help with readability. Here we use another of the *Luberdate* commands to pull the year from the date that we just defined and then follow that up with a final mutate command to create a new columns called "decade" which creates the decade by subtracting from the year, the remainder from the year divided by 10. The "%%" tells `R` to use the Modulo Operator which is the mathematical operation of returning the remainder from a division problem.[^3] Finally we want to filter the dataframe once more to include only sightings that have occured since the 1960's.

[^3]: https://en.wikipedia.org/wiki/Modulo 

<details>
  <summary>Exercise: Cleaning up the census</summary>
  
Let us practice what we have learned about pipped commands and data cleaning. When you used the census API to create the object **cen.stat** you also pulled down the data necessary to create a map of the United States. To create this map, use the following code: `plot(cen.stat$geometry)`. Notice that beyond the continental U.S., we get an odd looking image because we have the Alaskan island on the far right and also have the Hawiian Islands and Peurto Rico. Your exercise is to write and run a code that will create a dataframe that we can map only the contenial U.S. with. The new dataframe should be named **cen.map**, contain only the columns GEOID, NAME, and geometry. To check your work, use the command *plot(cen.map)*.

</details>

<details>
  <summary>Answer</summary>
  First we look up on Google the FIPS code for the three territories we want to remove and see that Alaska is '02', Hawaii is '15' and Puerto Rico is '72'. We then use the following code.
    
  ```R
    cen.map <- cen.stat %>%
      filter(GEOID != "02",
             GEOID != "15",
             GEOID != "72") %>%
      select(-c(variable, estimate, moe)) %>%
      arrange(GEOID)
```
</details>



