library(tidyr)
library (ggplot2)
library(reshape2)

setwd("~/R/Allocations")

df <- read.csv("Allocation.csv")

#df2 <- data.frame(df)

Col_Headings <- c("DaysToIssue","17/18","18/19","19/20")
names(df) <- Col_Headings

ggplot() +
  geom_line(data=df,aes(x=DaysToIssue, y=`17/18`, colour="17/18"),size=1) +
  geom_line(data=df,aes(x=DaysToIssue, y=`18/19`, colour="18/19"),size=1) +
  geom_line(data=df,aes(x=DaysToIssue, y=`19/20`, colour="19/20"),size=1)


datam <- melt(df,id.vars = "DaysToIssue") #using reshape2 library

ggplot(datam, aes(variable,value,colour=value)) + geom_boxplot()
