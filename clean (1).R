rm(list=ls())

library(NMF)
library(mltools)
library(data.table)
library(dummies)

data = read.csv("UCT_train.csv")
data = data[-c(11,13)] # remove features we suspect don't matter; date of occupancy and geocode

# fill in mean value for missing building dimensions
data$Building.Dimension[which(complete.cases(data$Building.Dimension)==FALSE)]=mean(data$Building.Dimension[which(complete.cases(data$Building.Dimension)==TRUE)])

data = data[complete.cases(data),] # want to remove missing values

# encoding categoricals
data = dummy.data.frame(data,names=c("YearOfObservation","Building_Painted","Building_Fenced","Garden","Settlement","NumberOfWindows","Building_Type"))

# write to new csv to insert into Python script
write.csv(data,"UCT_train_new.csv",row.names = FALSE)
