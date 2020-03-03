library(dplyr)
library(tidyr)
df<-starwars
tbl_df(starwars)
glimpse(starwars)
distinct(starwars)
df2 <- separate(starwars,films,"list",sep=",")
