---
title: Week One, Step Three
author: Jeremy R. Groves
---

# Week One - Step Four
## Working With R

### R Basics
R is an object based language being that you create objects that are then modified and used to complete tasks. There are several types of objects within R, but the main examples are  

- Characters (text)
- Numeric (numbers)
- Logical (contains TRUE/FALSE or 1/0)  

The key tool to assign a name to an object is the "<-" or the combination of the less than symbol and the dash. The arrow points to the objects name so if we wanted to assign some text to the object, A, we would type:  

```R
A <- "Hello World"
```

After you type this, you see in R Studio, in our upper-right window under the tab entitled **Environment** a new object called _A_. If something is not in the environment, then R has no idea that it exists. If we click on _A_, we can see a little drop-down that tells us some facts about the object and if we double-click on _A_, it will open a viewer window in the upper-left of our screen so we can view the object A. When dealing with data, this viewer will look much like a spreadsheet. Objects are storied within vectors and everything within a vector must be of the same object type. You can not mix characters and numbers in the same vector.

Many time you will have multiple vectors you want to keep together and where the rows of the different objects are related to each other, similar to a matrix of control variables or rows of a spreadsheet. This collection of vectors is called a dataframe and is the workhorse for R. You can have vectors of different types within a dataframe; however, they must all be the same size. Finally, if you want to store a lot of information across several dataframe or with vectors of different lengths (think database), R will save that as a list. List are helpful and you will need to know how to use them to find the various information produced from a regression, but for now we will not work too much with them because it can be rather complicated. To see how to work with dataframes, create two objects, one character and one numeric with the following formation. For the first object, use the following text:  

```R
Name <- c("Jon", "Jen", "Jeff", "Julian", "Jerry", "Jeremy")
```

Looking at this code we first see the name of the object me and then we are assigning to that object a set of character values denoted by the quotation marks. The command `c()` is a way to combine several different items within a vector. When you hit enter you will see the object _Name_ show up in your environment. You can double click this to see it open in the viewer or you can type `Name` into the console and it will list the objects within that vector. Typically we do not want to see the entire vectors, only the first few things to get a feel for what is in the vector. To see the first few lines of an object (vector or dataframe), we use the command `head()`. Use this with the _Name_ object. 

Next, I want you to create a numeric vector object called _Age_ with the following numeric values: 25, 34, 17, 48, 33, and 29. Because both _Name_ and _Age_ are vectors, we can refer to items within those vectors using their location. For example, if I want to see what the third name is in the _Name_ vectors I would use the command `Name[3]`. The syntax is that the brackets mean you are referring to an item inside another item such as an object inside the vector. Because we are working with a vector, there is only a row dimension, however, when we work with dataframes, we need both a row and a column (in that order). To see this, let us first make our dataframe with our Name and Age and let us call our dataframe _Roll_.  
  
```R
Roll <- data.frame(Name, Age)
```

You will now see that the vectors are in a separate section in the **Environment** tab while _Roll_, which is a dataframe is in another. The same area that the dataframe is in will be the same place you will see lists appear when you use them. Now, if we want to know what the name and age of the third person on the roll is, we need to type `Roll[3, ]`. You see that the indexing rule is "df[row,column]" and leaving the row or column empty will instruct R to show the entire set of that dimension. Additionally, if we use the `head()` command, we will get the top rows and all columns of the _Roll_ dataframe.  

Now create a new vector called _Gender_ with the following inputs: "Male", "Female", "Male", Male", and "Male" and then add this to the dataframe called _Roll_. It should not work. This because, again, all vectors must be the same size. We can add a missing value at the end using the location syntax by typing `Gender[6] <- "Male"`. This puts a new entry in position six that reads male. Now when we merge the vector to the dataframe, everything works just fine. Another way to pull information from a dataframe is to use the row names. If we type `names(Roll)` we will see a list of the column names. We can access the gender vector using the syntax `Roll$Gender` where the dollar sign ($) is what denotes the column we are looking for. It is good practise, by the way, not to include spaces in the column names. We can do that, but spaces are just generally not a good choice in programing and make referencing column names more complicated and prone to errors. Finally, if we want the third entry in the _Gender_ vector that is part of the _Roll_ dataframe, we would use `Roll$Gender[3]`. Notice that we only use the row location key because the dollar sign syntax already indicated we are in the column named _Gender_ so we only needed to tell R what row we wanted. 

The last important element is the role of "N/A" and "NULL" in R. To see the "N/A" in action, type the following into the console: `Gender[8] <- "Female"`. What we just did was told R that we wanted to add an entry to the _Gender_ vector in the eighth row position. Now type `Gender` and notice that we have eight elements in the vector, however, the seventh entry is "N/A". This was automatically added because we can not have an empty spot in a vector and so R fills that with "N/A" which essentially means "missing". We can find the location of N/A's within a vector using the command `is.na(df)` where "df" denotes the dataframe name. When you use that here we get a vector of logical objects with FALSE denoting the condition is untrue (so not an N/A entry) while TRUE indicate that is where the condition is met (the entry is an N/A or missing) so in our case we see the N/A/ is located in the seventh position. We can continue to work with this N/A in the data, however, we will occasionally run into errors unless we tell R how to treat the N/A's and that is going to be command specific.  The "NULL", on the other hand, means just that, nothing or the empty set!. We can not set an object in a vector to NULL because that would then be an empty space, which can not exist. We can, however, completely get rid of all the elements of a vector or dataframe by assigning "NULL" to the object. If we type in `Gender <- NULL` notice that the object _Gender_ does not go away, it is still in the environment, but it is now empty, which you can verify using the command `head(Gender)`. You will not use NULL very often, but it is good to know what it is.

[Go to Step 5](wk1_st5.md)

