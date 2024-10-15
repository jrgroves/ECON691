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
  Let's practice what we have learned about pipped commands and data cleaning. When you used the census API to create the object **cen.stat** you also pulled down the data necessary to create a map of the United States. To create this map, use the following code: `plot(cen.stat$geometry)`. Notice that beyond the continental U.S., we get an odd looking image because we have the Alaskan island on the far right and also have the Hawiian Islands and Peurto Rico. Your exercise is to write and run a code that will create a dataframe that we can map only the contenial U.S. with. The new dataframe should be named **cen.map**, contain only the columns GEOID, NAME, and geometry. To check your work, use the command *plot(cen.map)*.
</details>
<details>
    <summary>Answer</summary>
    First we look up on Google the FIPS code for the three territories we want to remove and see that Alaska is '02', Hawaii is '15' and Puerto Rico is '72'. We then use the following code;
    ```R
    cen.map <- cen.stat %>%
      filter(GEOID != "02",
             GEOID != "15",
             GEOID != "72") %>%
      select(-c(variable, estimate, moe)) %>%
      arrange(GEOID)
    ```
</details>
