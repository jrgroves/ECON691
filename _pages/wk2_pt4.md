---
Title: Week Two - Part Four
Author: Jeremy Groves
---
# Visualizing Data

While it is great to be able to find, clean, organize and analyize data, it is also just as important to be able to convey that data. There are lots of different ways to visualize data and we have already seen on way which is the summary statistics. ANYTIME you report data, you should always be showing the reader your summary statistics because this helps the reader to add context to your data. For example, in our affordability data we will see that according to the data, homes in Cook County are EXTREMELY affordable, even though we know that is not the case. Looking at the values in the summary statistics we will see that the rent maximum is only about $1,400 per month whereas the max median income is more than $5 Million, this tells us we have outliers in our data.  

Graphs and maps are other ways to visualize data depending on what you want to convey and observe. For example, if you look at an election map it would appear that most of the United State is quite conservative (Figure One); however, when you compare that map to one of population density, you would fine that those areas which are conversative also have a singificantly lower population density and those areas that are more liberal have much more people in them as well. 
![image](https://github.com/jrgroves/ECON691/assets/52717006/33c773aa-d6d5-4cb7-9bcf-e5ce74444291)
And here is population density.
![image](https://github.com/jrgroves/ECON691/assets/52717006/31dded2d-c6ac-4aa8-ad3a-e19e12089f95)

This is all to warn that when looking to visualize data, you have to be careful with what you are showing and the best way to do that is to just be explicit about what your values are.

## Data Plots
The first way to visualize data is to use data plots. This may include a frequency graph, a distribution graph, or, what we will do here, a box-wisker plot. The idea is to show how your data is distributed and to help identify outliers in the data. The simplist way to plot data is to use the native commands inside of R to create a plot, view it in the viewer in R Studio and work with that. Once you deside what you want to "go to print" with, you can use packages such as *ggplot2*, which is inside *tidyverse* to make clean and high-impact images that will fit the demands of the publisher. We are going to start with a simple box-wisker plot of the Median Income variable in our **core** dataframe created by typing the following in the console: `boxplot(core$Med_Inc)`.
![image](https://github.com/jrgroves/ECON691/assets/52717006/8adcd4f0-8190-44be-94d7-0a40786f725b)  
This image is not very pretty, but it highlights that we have some issues with our data. The box-wisker plot is supposed to look something more like the following, which is produced using `boxplot(core$Med_Rent)`.
![image](https://github.com/jrgroves/ECON691/assets/52717006/cae1a640-5cdb-4e5a-8ec3-6556443742fb)
Again, not ideal, but we can see the cut-offs for the first and fourth quartile (the solid lines), the second and thrid quartile and IRQ (the shaeded box) and the median (50th percentile) which is the solid line. The circles indicate outliers to the data. While the Median Rent image is close to a pretty good image, the Median Income image indicates that we have some crazy large outliers where the median income is over $1 Million. As a frame of reference, the U.S. Median Income is about $42,000. 

We can identify the outliers by using our filter command. In this case we will simply use it in the console since we are just "looking" at our data. If we decide to later utlize this as part of our research, we will want to move it to the script. The command to do this is `temp<-filter(core, Med_Inc > 1000000)` which will creates a new dataframe called **temp** and will contain only those cases where the Median Income is over $1 Million. Looking at **temp** we see it is a single observations and, as we suspected, it is Cook County. If we flip the `>` we will get everything except Cook County and we can look at the new box plot from that new data. We are getting better, but let's move our threashold to $400,000 and see what happens.

Doing this we will see that the new **temp** contains five observations and they are what is known as the "collar counties" as they are the ones that surround Cook County. One nice feature of our data being an "sf" object is that if we type `plot(temp)` we can see that these are, in fact, the colar counties. If we move our threashold a bit futher to $250,000 we pick up three more counties and when we plot that, we see that we pick up Winnabego County, which is where Rockford, the second largest city in the state, is located, and Madison and St. Claire Counties which are boarder counties for Saint Louis, MO. If we remove these and look at the box plot we see that it makes a bit more sense for us without these extreme outliers. You could go further or not this far, it is completely up to you. The key is to ensure that you are transparent and you can justify why you choose what you choose. In this case we choose $250,000 because that is the income threashold for many tax benefits for married couples so income over that point are likely a "different" type of person and if the median income is at that level, we are not getting a very good picture of the county. 

## Maps
My favorite visulization is maps because you can see how the data is distributed across space and it can help you gain additional insights into the question you are looking at. There are several different ways to create a map in R and we have already done that with our `plot()` command for an "sf" object. If we wanted to just plot one of the columns, we would simply use our "$" denotion in the `plot()` command and get one single map. Another way to create maps is with speciali packages and the most popular is the *ggplot** package that is now part of *tidyverse*. What is nice about it is that you can control any apsect of the images you plot and create some pretty spectacular images. 

Ggplot works by dividing the coding up into "geoms" and "option". The "geoms" are the type of graphs you are going to produce. For our purpose, we will be using the `geom_sf()` as it can handle the "sf" type object we are using. Inside the geom you will identify the key components such as the dependent and independent variables, any scaling issues or coloring you might want to do. In the options part, you can control the look of the canvas upon which you graph sits and the way that the elements within the geom appear. The best way to see this is just to do it so use the following code:  
```R
ggplot(core) +
   geom_sf(aes(fill=Affordable))
```
The problem with this image is that the blue is just too hard to see much variation, so that is where we want to start first. The best way to learn how to do this is to simply search the internet for what you want to do. In our case, we want to change how the color is distributed and after a Google search we find that adding the code `scale_fill_gradiant2()` will do the trick. Ggplot using something similar to the pipped code style, but instead we use a '+' at the end of each line if we are following with another line of code. I should also note, that the line can be thought of as "layers" in ggplot so if something is not showing up, move it up the lines of code and you might see it.



