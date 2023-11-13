---
Title: Week Two - Part Three
Author: Jeremy Groves
---

# Working with Data

## Cleaning and Organizing Data

When you run the `head()` command, you should see something similar to this below:  
```R
Simple feature collection with 6 features and 5 fields
Geometry type: MULTIPOLYGON
Dimension:     XY
Bounding box:  xmin: -90.90976 ymin: 39.87263 xmax: -89.57829 ymax: 40.6392
Geodetic CRS:  NAD83
  GEOID                       NAME   variable estimate moe                       geometry
1 17017      Cass County, Illinois B06001_001    13058  NA MULTIPOLYGON (((-90.58353 3...
2 17017      Cass County, Illinois B25058_001      429  19 MULTIPOLYGON (((-90.58353 3...
3 17129    Menard County, Illinois B06001_001    12343  NA MULTIPOLYGON (((-89.99509 4...
```
Looking at this dataframe, we want to highlight some key elements. First, with the variables, we see the "GEOID". This is the standard identification for any geographical data produced by the U.S. Governmnet and we see that the first two digits are the state (17 = Illinois) and the next three are the county. Next we see the county name in the "NAME" varaible and this can be helpful; however, care must be taken when merging dataframe on this variable because different sources will format county names different. For example, the county of DeKalb in some sources is written that way, while in others it is De Kalb and in others it may be Dekalb. Because we are looking for exact matches when we merge datasets, you will get errors and mismatches when using names that may be formatted differently. Next we have our varaible name and you will see the observations correspond with the names we searched with so we will want to change that. The "estimate" and "moe" are the data values with the "estiamte" varible containing the actual data value and the "moe" containing the "margin of error" that was calculated with the survey data. We can choose to use this to create confidence intervals or as robustness checks with our estimation produres. Finally we have a variable called "geometry" and this is a seires of points that are projected lattitute and longitude points and are used by R to create the shape (polygon) that creates the boarder of the specific county. It should be noted that this varaible acts a little different than other variables and if we want to get rid of it, we can not simply remove it, there is a specific command we must use. 

The next item we want to focus on it the format of the data. Data comes in two basic layouts: wide or long. The *wide* format contains one observations for each data unit and then multple columns (varaibles) containing different information whereas *long* contains one observation for each unit-value pairing. Our data is in the latter form because we see we have one observation for the county-median income data and one observations for the county-median rent data. There is no "right" way to have data; however, the more standard is *wide* and this is more condusive to regressions and coding so we want to reshape or "pivot" our data into the wide format. Additionally, we want to replace our variable names with something we can actually read. We are going to use our *tidyverse* package to do all of this in one command block.  
```R
core <- acs %>%
  mutate(variable = case_when(variable=="B06001_001" ~ "Med_Inc",
                              variable=="B25058_001" ~ "Med_Rent",
                              TRUE ~ variable)) %>%
  select(-"moe") %>%
  pivot_wider(id_cols = c("GEOID", "NAME", "geometry"), names_from = "variable", values_from = "estimate")
```

Let's look at each of the lines here to see what is happening. Frist we are assigning our results to a new object, "core". I do this so that I do not mess up and need to redo my original API pull while cleaning the data. After our pipped code syntax, we have the command `mutate()`. This is the basic *tidyverse* command that will create or modify variables within a dataframe and is pretty commonly used. We see in the syntax of the `mutate()` command that we are going to alter the "variable" column. It is important to notice that when using the `mutate()` command we use the *=* rather than *<-*; most often than not, when you encounter an error, this is the error because we get so used to using the assign syntax it becomes second nature. The next command inside the `mutate()` command that is also very valuable is the `case_when()` command. This allows us to create or redefine a variable differently when different cases are met. This is create for replacing variable names, as we use it here, or when creating identifier variables in data. The first part of the command syntax is the condition or test that is performed, thus the use of the double equal sign as a logical test, and then, after the `~`, we have what will be used when that test condition is met. Once we are in the `case_when()` syntax, we need to list all of the conditions for which we want to change or create the variable and we can do so with a simple comma. Finally we add the line `TRUE ~ variable` and this is our "catch-all" condition for if all the above conditions fail, then we will simply replace those cases with the existing "varaible" data. You can use this to simplify code with an ID variable where you might give the condition for the new varaible equalling one and then set the final catch-all equal to zero. 

Next, we want to remove our marginal of error data because using it will only confuse matters at this stage. We can do this using the `select()` command which is similar to the `filter()` command, only where the latter looks through the rows, the former looks through the variables or columns. Since we are just removing one, we will use the "-" to indicate remove and then list the single column we want to remove. inally, we come to our pivoting command. Since we have a *long* dataframe and we want to change it to wide, we will use the command `pivot_wider()`. There are several different things we can control in this command and you can look it up in help or online to see those options. The three we are going to deal with are the three shown here: `id_cols`, `names_from`, and `value_from`. While these should all be self explanitory, the first tells R what column or columns contain the ID information for the diffrent observations. In our case we have multple columns so we use the `c()` syntax to list them all. Next we need to tell the command were to get the new variable names from and in our case that is our "variable" column which has already been mutated so this command with use those new values. Finally, we have to tell the command were the data is located.  

## Creating our Varaibles of Interest

Now that our data is cleaned up and organized, we want to create our varaibles of interst. The goal of our project here is to look at housing afordability which is defined as spending no more than 33% of one's gross monthly income on housing. Therefore, we want to calucate what percentage the median resident in each county spends of the monthly income on rent for the median unit. Therefore we need to compute the monthly income and then divide that by the median rent to generate our rent share. Give this a try on your own using the `mutate()` command and then you can see how it compares to the code below.  

```R
#Create Rent Share Data

core <- core %>%
  mutate(m_monthly = Med_Inc/12,
         Rent_Share = Med_Rent/m_monthly,
         Affordable = Rent_Share - .33)
```

To make sure this worked correctly, use the `summary(core)` command to produce a list of the summary statistics for all numeric varaibles in the dataframe **core**. What we are looking for are things that may seem out of place (like percentages greater than 1 if we know none should exist), NA values which will be listed under the column of summary states for any variable where they might exist, or Inf which stands for Infinite and typically occurs whenever we divide by zero. We should not see any of these except that there is a maximium share over 1.0 indicating that in at least one county, the median rent is greater than the monthly median income. Finally, we will create an "Affordable" variable where we subtract our benchmark of 33% from our rent shares resulting in negative values (or zero) showing housing that is classified as "affordable" and positive values indicating housing that is not affordable.

Another advantage of using the `summary()` command is that we can see things that look odd or out of place or identify outliers. In this case we have a clear outlier and can likely guess where it happends. We see the maximum median income is over $5 Million making the maximium monthly income more than $400,000. We can guess that this happens in Cook County, which is where Chicago is listed, and it also demostrates the issue with using county level data. We can narrow this down by either user our data view and then sort by the median income or user a filter command to filter our dataframe observations to confirm our suspicions. 
