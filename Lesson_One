# Getting and Cleaning Data

The core of any emperical research project is the data and, depending on your project and level of analysis, obtaining that data can be easy or hard. Chances are, however, that the easier the data is to obtain, the less ripe that avenue of research is, although that is not always the case. More often than not, the data you want is not going be a simple point-and-click away, you are going to need to find creative means to put the data together. One of the key elements that you need to keep in mind is the need for reproducability and that means keeping your data in its rawist form and track, preferablly via code, any changes you make to that raw data. 

## Deliniated Files

The best way to store raw data is in an independent form such as a text or deliniated file. Data kept in propriety form will add a barrier to reproducability, especially if that program is no longer widely avalible whereas data in simple text of deliniated form can always be read. The most common form of data is saved as a .csv file which is a text file where each "column" of data is seperated by a comma. In this case you can simply use the *read.csv()* command to read the data into the global environment of R. Using the command below will read the .csv file into the environment and saved to the object "ufo".

```R
ufo <- read.csv(file = "./Data/scrubbed.csv", header = TRUE, as.is = TRUE)
```
