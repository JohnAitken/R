library(readr)
df <- read.csv('top100.csv')

library(reshape2)
library(tidyr)

library(tidyverse)

df2 <- spread(df,Type,Variable)
df3 <- df2[,c("Title","Director","Cast")]

#chosen <- sample_n(df3,1)

#log <- setNames(data.frame(matrix(ncol = 4, nrow = 0)), c("Title","Director","Cast","Date"))
#log <- rbind(log,chosen)


write.csv(df3,file = "top100.csv",row.names=FALSE)
