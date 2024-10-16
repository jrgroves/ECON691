---
title: Assignment One - ECON 691 - Groves
---

For this assignmnet you will obtain and clean data for your assigned decade from IPUMS via API and then merge this with Census Tiger Files using the Census API and create a Map showing the variation of one of the key variables that you create in this assignment. When you cloned this repository you should have aquired a script file called "Assignment_One.R" and a "README.md" file. Your grade will be based on the correct manipulation of the script file and the output produced by the *plot()* command that should appear at the end of your script. You will also be graded on the quality of the code that you write and for covering the basics (like saving your final data in the right place).

# Getting to know your decade
You have each been assigned a decade and so now you will need the demographic data for the 48 continetnal U.S. states for that decade. Since we are dealing with decades, we will utilize data from the U.S. Decinial Census and since some of you have decades prior to 2000, that rules out the use of the census API (*tidycensus*). An alternative data source for the U.S. Census and many other surveys, demographics, and GIS data is [IPUMS.org](). They have a collection of "projects" that deal with several different types and scopes of data and the project we will focus on is the NHGIS project for "National Historic Geogrphic Information Systems" project. Like the census, they too have an API and there is a package that allows us to (somewhat) easily interact with the API through `R` and you need to get that installed on your machine.

> 1. Install in whatever method you choose, the package *ipumsr*. It will be obvious if you do not, because nothing else will work.

