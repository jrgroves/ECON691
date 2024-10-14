# Getting Data

The core of any emperical research project is the data and, depending on your project and level of analysis, obtaining that data can be easy or hard. Chances are, however, that the easier the data is to obtain, the less ripe that avenue of research is, although that is not always the case. More often than not, the data you want is not going be a simple point-and-click away, you are going to need to find creative means to put the data together. One of the key elements that you need to keep in mind is the need for reproducability and that means keeping your data in its rawist form and track, preferablly via code, any changes you make to that raw data. 

## Delimiated Files

The best way to store raw data is in an independent form such as a text or deliniated file. Data kept in propriety form will add a barrier to reproducability, especially if that program is no longer widely avalible whereas data in simple text of deliniated form can always be read. The most common form of data is saved as a .csv file which is a text file where each "column" of data is seperated by a comma. In this case you can simply use the *read.csv()* command to read the data into the global environment of R. Using the command below will read the .csv file into the environment and saved to the object "ufo".

```R
ufo <- read.csv(file = "./Data/scrubbed.csv", header = TRUE, as.is = TRUE, sep = ",")
```

Looking at this command, there is one note we should make; there is an alternative version called *read.csv2()*. The difference is that the command above treates commas as sperators and periods as decimals whereas the latter assumes that periods are the seperators while commas are used as decimals. Now diving into the command we see first we list the location of the file and filename we want to read. Again we notice the use of the period to indicate the current working directory. Next we set the option "header" to TRUE to indicate that the first row of the data are column headers and thus should be used as the column names in the resulting dataframe. Next we tell `R` to read the file as it is formated meaning that characters are read as character and numbers are read as numeric. Finally, we have the option "sep" which sets the seperator for the deliminated file. The default is the comma, however, we can also use other options such as the bar "|". 

Running this command creates the object **ufo** and assign the dataframe from the file "scrubbed.csv" and we can read the heading of this file using the *head()* command. 

## API Downloads

Another means of obtaining data, especially commonly sourced data, is to use an Application Programming Interface (API) command. An API is an interface between two programs to exchange information.[^1] The most common type of API is a REST API which uses commands such as *get()*, *put()*, and *delete()*, to transfer data via HTTP protocals. Each different API will have different requirements to setup communications; however, most use some sort of key and then a means of sending the *get()* command to obtain data. 

[^1]: https://aws.amazon.com/what-is/api/#:~:text=API%20stands%20for%20Application%20Programming,software%20with%20a%20distinct%20function.

In our case, we are going to access the U.S. Census API which allows us to code downloads of data from the decinial census and the American Community Survey (ACS). This is such a common occurance, that there is a package writen to simplify the communication between our `R` environment and the Census servers, called *tidycensus*.[^2] The code below is an example of what we would use to download data from the 2020 five-year data file from the ACS server.

```R
cen.map <- get_acs(geography = "state", 
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
plot(cen.map$geometry)
```
Using this will create a plot of the United State in the viewer of `R Studio`.

## Web Scrape

Another, and more complicated, means of obtaining data is through web scraping. This is the action of utilization of the fact that website are nothing but code that is translated by your browser into a visual form. As a result, there are methods of coping the html code into a program, such as R, and then filtering the code for the information you are looking for. We are not going to do an example of this given the complexity, but there are several sources of tutorials that can be found by searching for web scraping in `R`.[^3] 

[^3]: https://statsandr.com/blog/web-scraping-in-r/

# Cleaning Data

When we get data, in whatever, form, it is never going to be in the exact form that we need leading us to to clean and masage the data into a form that we can use. The best package for doing this in `R` is the package *tidyverse*.

