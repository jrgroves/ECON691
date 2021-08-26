#This is a script for introducing scripts
#Created by: Jeremy R. Groves
#Created on: August 25, 2021

rm(list=ls())

library(tidyverse)

#Function####

delta<-function(x){
  temp<-((x-lag(x))/lag(x))
  return(temp)
}

covidIL<-read.csv("./Data/ILCovid19.csv")

covidIL<-covidIL %>%
  mutate(pc_test = delta(Tests),
         pc_cases = delta(Cases),
         pc_deaths = delta(Deaths))

covidIL$pc_deaths[is.infinite(covidIL$pc_deaths)]<-NA

covidIL$Date<-as.Date(covidIL$Date, format="%m/%d/%Y")

plot(covidIL$Date, covidIL$pc_cases)

plot(covidIL$Date, covidIL$pc_cases,
     main="Percent Cases",
     xlab="",
     ylab="",
     type="l",
     col="blue")
