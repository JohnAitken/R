library(dplyr)
library(ggplot2)


rtbl <- read.csv("STG_RTBL20170623_DUMMYDATA.csv",header=TRUE)
# rtbl[is.na(rtbl)] <- 0

ggplot(rtbl[!is.na(rtbl$bps17_app_status),],aes(x=bps17_app_status)) + geom_bar() #notice the first col - have to change "" to NA

rtbl[rtbl==""] <- NA #replace "" with NA

ggplot(rtbl,aes(x=bps17_app_status)) + 
  geom_bar() +
  labs(x = "app_status",title="NA's instead of blanks")

ggplot(rtbl,aes(x=bps17_app_status,fill="MI_BPS17_ONLINE_REC_FLG")) + 
  geom_bar() +
  labs(x = "app_status",title="NA's instead of blanks")
