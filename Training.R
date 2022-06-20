library(dplyr)
df <- starwars
glimpse(df)

df2 <- select(df,hair_color) %>%
    count(hair_color)
