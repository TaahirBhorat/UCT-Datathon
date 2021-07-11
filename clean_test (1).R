rm(list=ls())

library(NMF)
library(mltools)
library(data.table)
library(dummies)

data = read.csv("UCT_test.csv")
data = data[-c(11,13)] # remove features we suspect don't matter


# fill in mean value for missing building dimensions
data$Building.Dimension[which(complete.cases(data$Building.Dimension)==FALSE)]=mean(data$Building.Dimension[which(complete.cases(data$Building.Dimension)==TRUE)])

# checking if any missing values; don't seem to be
which(complete.cases(data$Building.Dimension)==FALSE)

# encoding categoricals
data = dummy.data.frame(data,names=c("YearOfObservation","Building_Painted","Building_Fenced","Garden","Settlement","NumberOfWindows","Building_Type"))

write.csv(data,"UCT_test_new.csv",row.names = FALSE) # write to csv
