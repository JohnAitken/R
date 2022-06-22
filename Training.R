library(tidyverse)
library(ggplot2)

#load the data and group by provider count per dropoff level
df <- read.csv("Final_Dropoff_Data_xl.csv") %>%
    count(Count, wt=Count) %>%
    rename(Providers = n,Dropoffs = Count)

 plt <- ggplot(df, aes(x=Dropoffs,y=Providers)) +
        geom_col() +
        geom_text(aes(x = Dropoffs, y = Providers, label = Providers), stat = "sum", vjust = -0.5) +
        scale_x_continuous(n.breaks = 10, limits = c(0,10))

print(plt)
