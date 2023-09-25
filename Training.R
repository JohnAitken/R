library(dplyr)
#load the data and group by provider count per dropoff level
df <- read.csv("roll_20_items.csv")


armor <- df %>%
  filter(grepl("armor", type))
         
