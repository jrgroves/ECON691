---
title: The X Files
---

# Getting Data

The core of any emperical research project is the data and, depending on your project and level of analysis, obtaining that data can be easy or hard. Chances are, at least in Microeconomic analysis, the easier the data is to obtain, the less ripe that avenue of research is. More often than not, the data you want is not going be a simple point-and-click away, you are going to need to find creative means to put the data together and so we will look at some various means of getting data. Additionally, it is more than likely that you will be bringing some of the data in from elsewhere and so we need to see how to read data into our `R environment` so that we can use it for our analysis. Finally, we will likely need to join up data from a variety of different sources to get the full dataset we need to perform a correct analysis. 

Another important factor to keep in mind is that of the need for reproducability. In terms of obtaining, cleaning, and merging datasets, that means that we want to keep the data we bring into our analysis as raw as possible and do any manipulation and merging within `R` via a script. This not only preserves the original copy of the data, but also ensures we have a written record, via the script of what we did and how we got the data we eventually used. 

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

To get some practise with what we have done so far, use the green plus in the upper-left side of the `R Studio` window and choose "R Script" to creat a new script. In the fresh tab that opens in the editor, type of the code to clear the environement and then read in the "scrubbed.csv" file into the environment as the object **ufo**. Try to do it yourself, but the code is below to help.

<details>
  <summary>Example: Scripting the X Files</summary>

  ```R
    rm(list = ls())
    ufo <- read.csv(file = "./Data/scrubbed.csv", header = TRUE, as.is = TRUE)
```  
</details>

## API Downloads

Another means of obtaining data, especially commonly sourced data, is to use an Application Programming Interface (API) command. An API is an interface between two programs to exchange information.[^1] The most common type of API is a REST API which uses commands such as *get()*, *put()*, and *delete()*, to transfer data via HTTP protocals. Each different API will have different requirements to setup communications; however, most use some sort of key and then a means of sending the *get()* command to obtain data. 

[^1]: https://aws.amazon.com/what-is/api/#:~:text=API%20stands%20for%20Application%20Programming,software%20with%20a%20distinct%20function.

In our case, we are going to access the U.S. Census API which allows us to code downloads of data from the decinial census and the American Community Survey (ACS). This is such a common occurance, that there is a package writen to simplify the communication between our `R` environment and the Census servers, called *tidycensus*.[^2] The code below is an example of what we would use to download data from the 2020 five-year data file from the ACS server.

```R
cen.stat <- get_acs(geography = "state", 
                   variables = "B01003_001E", 
                   year = 2020,
                   survey = "acs5",
                   geometry = TRUE)
```
[^2]: https://walker-data.com/tidycensus/articles/basic-usage.html

Breaking down this command, we first choose the geographic level of the data we are seeking, in this case, the level of the state. If we wanted a specific state, we could add the option "state = ##" where would choose the state FIPS code. All census geographics can be uniquely identified with a FIPS code. For example, the FIPS code for the DeKalb county is 17037. In this case the '17' is the State code for Illinois and '037' is the County code for DeKalb. The next option is "variables" which is where we indicate what data we wish to download. Unfortunately there is a great deal of possible data and finding the right dataset is not always simple. That said, the *tidycensus* package as a means to filter the possbilities using the API and R.

Copy and paste the following code:
```R
data.list <-  load_variables(2020, "acs5", cache = TRUE)
```
Breaking down this code we see the command *load_varaibles()* with the first option showing the year we want the list of possible datasets, the second denoting the survey, here the 5-year ACS files, and the final places the data in our computers cahce for future use. We will learn how to filter this very large object to find the varaibles that will fit out needs. For now just know that the variable name we have put in our *get()* command will give us the total population.

The next two options, we have mostly covered already. The option "year" denotes the year of the data we wish and the option "survey", again, denote the specific survey we want to use. Finally, we have the option "geometry" set equal to TRUE. This will download the TIGER map files for this data and turn out standard dataframe into an "sf" object which stands for "simple feature" object. Specifically, it will allow us to plot a map. 

Using our *head()* command, we see the dataframe contains a column for the GEIOD (which is the FIPS code), the name of the state, the variables we downloaded, in this case just one, the estimate of that varaible, the margin of error for that estimate, a column called geometry which contains the corridants needed to plot the map of the states. 
```R
plot(cen.stat$geometry)
```
Using this will create a plot of the United State in the viewer of `R Studio`.

## Web Scrape

Another, and more complicated, means of obtaining data is through web scraping. This is the action of utilization of the fact that website are nothing but code that is translated by your browser into a visual form. As a result, there are methods of coping the html code into a program, such as R, and then filtering the code for the information you are looking for. We are not going to do an example of this given the complexity, but there are several sources of tutorials that can be found by searching for web scraping in `R`.[^3] 

[^3]: https://statsandr.com/blog/web-scraping-in-r/

# Cleaning Data

When we get data, in whatever, form, it is never going to be in the exact form that we need leading us to to clean and masage the data into a form that we can use. The best package for doing this in `R` is the package *tidyverse*.[^4] Another nice element of *tidyverse* is that we can "pipe" commands which makes our script both more readable and easier to write. An example of a piped code line is shown below for you to copy and run in your console.
[^4]: https://www.tidyverse.org/ 

```R
ufo.us <- ufo %>%
  filter(country == "us") %>%
  select(-comments) %>%
  mutate(date = as.Date(str_split_i(datetime," ", 1), "%m/%d/%Y"),
         year = year(date),
         decade = year - year %% 10) %>%
  filter(decade > 1959)
```
Looking more closely at the code we see the first line is our assignment of our newly modified dataframe **ufo** to the new object **ufo.us** followed by the string `%>%`. This is the pipe symbol can be thought of as an alternative to a function in that we are going to be running a series of commands on the dataframe assuming the above line has been completed. One of the key benefits is that we do not have to keep writing the dataframe name as the piped code assumes it is the same core dataframe used in the assignment line. 

The second line of code filters the dataframe to keep only the values where the country is designated as being within the United States. The next line allows us to select which columns we wish to keep in the dataframe. Notice, however, that we use the syntax "-comments" meaning "everything but comments". This syntax is an alternative to writing all of the columns we want to keep and is useful when we want to keep all but a few columns. If we have more than one column we wanted to drop, we could combine then using the *c()* command. Now, after removing the comments column, we want to create a column that tells me the decade in whcih the sighting occured. Inside of the *tidyverse* package is another package called *Luberdate* which helps us to use and manipulate dates by essentially creating a new class of objects that are dates. In otherwords, if we create the date as a date and then try to determine the number of days between October 1 and December 25, we would get the correct number of days accounting for the fact that October has 31 days while November only has 30. This line is also an example of a nested code line where we perform several actions on a single object in the same line and we read nested code from the inside out, similar to the orders of operations in math.

We start with the command *str_split_i()* which is a command that manapulates strings of characters and, in this case, the string that is found in the "datetime" column. If you use the `head(ufo$datetime)` command in your terminal you will an example of what is included in this column. 

> NOTE: rather than using the `head(ufo)` to get the head of the entire dataframe, we use the "$" to denote the specific column within the dataframe we want to see. This is one way to refer to a specific dataframe column. An alternative is to use the numercial location of the column we wish to view. Since the "datetime" column is the first column of the dataframe, we could reference it with `head(ufo[,1])` where the brackets denote the "[row, column]" location and a missing value instructs `R` to return all of that row or column.

We see that the data column contains a date and time, but we really only want the time. Fortunately for us, the two pieces of information are seperated by a space and so we can split the string based on that element and that is what the second arguement of the *str_split_i()* command is telling `R`. Finally, this is a special version of the command because we only care about a subset of the string, specifically the first part of the split, and this is what the thrid option does for us. This leaves us with a date but it is still in the form or a character string and we want to be able to treat it as a date so we can, for example, order by date or translate to this a decade. One approach would be to split the string again.

> **Exercise**:
> How would you write the code to pull out the year from the date using the *str_split_i()* command?

We will use an alternative approach of turning the chracter string into an object of the class "date" by using the *as.Date()* command. This command has to main parts: the string identification and the formate of the string. We have already told the command to use the first element of the split string of the "datetime" column and we now need to tell `R` how the date is formatted in this character. Specifically it is in month ("%m"), day ("%d%"), four-digit year ("%Y%) with slashes ("\") divisions. If we had text for the month we would use either "%B" if the full month is written out or "%b%" for the three letter abbreviation and if it was a two-digit year, we use "%y". Finally, this is nested in the *mutate()* command which is native to the *tidyverse* packages and is used to create new data columns in a dataframe. 

Since we want to create another new column, rather than end the mutate command, we simply place a comma at the end of the line and hit return. Notice how `R Studio` indents the next row of text to line up with the start of the previous start of the mutate command to help with readability. Here we use another of the *Luberdate* commands to pull the year from the date that we just defined and then follow that up with a final mutate command to create a new columns called "decade" which creates the decade by subtracting from the year the remainder from the year divided by 10. The "%%" tells `R` to use the Modulo Operator which is the mathematical operation of returning the remainder from a division problem.[^5] Finally we want to filter the dataframe once more to include only sightings that have occured since the 1960's.

[^5]: https://en.wikipedia.org/wiki/Modulo 

> **Exercise**:
> Let's practice what we have learned about pipped commands and data cleaning. When you used the census API to create the object **cen.stat** you also pulled down the data necessary to create a map of the United States. To create this map, use the following code: `plot(cen.stat$geometry)`. Notice that beyond the continental U.S., we get an odd looking image because we have the Alaskan island on the far right and also have the Hawiian Islands and Peurto Rico.
>
> You exercise is to write and run a code that will create a dataframe that we can map only the contenial U.S. with. The new dataframe should be named **cen.map**, contain only the columns GEOID, NAME, and geometry. To check your work, use the command *plot(cen.map)*.



