---
title: Week One, Step Three
---

# Step Four: Working With R

## R Basics
R is an object based language being that you create objects that are then modified and used to complete tasks. There are several types of objects within R, but the main examples are  
-Characters (text)
-Numeric (numbers)
-Logical (contains TRUE/FALSE or 1/0)  

The key tool to assign a name to an object is the "<-" or the combination of the less than symbol and the dash. The arrow points to the objects name so if we wanted to assign some text to the object, A, we would type:  
```R
A <- "Hello World"
```
After you type this, you see in R Studio, in our upper-right window under the tab entitled *Enviornment* a new object called A. If something is not in the environment, then R has no idea that it exists. If we click on A, we can see a little drop-down that tells us some facts about the object and if we double-click on A, it will open a viewer window in the upper-left of our screen so we can view the object A. When dealing with data, this viewer will look much like a spreadsheet. Objects are storied within vectors and everything wtihin a vector must be of the same object type. You can not mix characters and numbers in the same vector.

Many time you will have multiple vectors you want to keep together and where the rows of the different objects are related to each other, similar to a matrix of control variables or rows of a spreadsheet. This collection of vectors is called a dataframe and is the workhorse for R. You can have vectors of different types within a dataframe; however, they must all be the same size. Finally, if you want to store a lot of information across several dataframe or with vectors of different lengths (think database), R will save that as a list. List are helpful and you will need to know how to use them to find the various information produced from a regression, but for now we will not work too much with them because it can be rather complicated.

To see how to work with dataframes, create two objects, one character and one numberic with the following formation. For the first oject, use the following text:  
```R
Name <- c("Jon", "Jen", "Jeff", "Julian", "Jerry", "Jeremy")
```
Looking at this code we first see the object name and then we are assigning to that object a set of character values denoted by the quotation marks. THe command ```c()``` is a way to combine several different items within a vector. When you hit enter you will see the object *Name* show up in your environment. You can double click this to see it open in the viewer or you can type Name into the console and it will list the objects. Typically we do not want to see the entire vectors, only the first few things to get a feel for what is in the vector. To see the first five lines of an object (vector or dataframe), we use the command ```head()```. Use this with the Name object and notice you do not see the name Jeremy because this is the sixth item. 

Next, I want you to create a numberic vector object called "Age" with the following numberic values: 25, 34, 17, 48, 33, and 29. 

