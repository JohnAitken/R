#load necessary libraries
library('pdftools')
library('magrittr')
library("dplyr")
library("stringr")
library("lubridate")

#set PDF file location and working directory

setwd("~/R/PDF_scrape")


#Temp for testing - will need to automate based on list in folder when able
file <- '9362957 515902 HaleSchool Draft AY201819 allocation 09May2019.pdf'

#Scrape text into list of lists based on page number
Scrape1 <- pdf_text(file)  %>% strsplit(split = "\n")

#Force list into data frame for ease of working
df <- data.frame(matrix(unlist(Scrape1),byrow=T),stringsAsFactors=FALSE)

#Split into sections
Header <- df[1:10,]



#For extracting numerics from the string
regexp <- "[[:digit:]]+"

#Header extract
SCH_NAME <- trimws(gsub("\r","",(gsub("Name","",Header[3]))),"l")
LA_NAME <- trimws(gsub("\r","",(gsub("LA Name","",Header[4]))),"l")
LAESTAB <- str_extract(Header[5],regexp)
UPIN <- str_extract(Header[6],regexp)
UKPRN <- str_extract(Header[7],regexp)
URN <- str_extract(Header[8],regexp)
OP_DATE <- trimws(gsub("\r","",(gsub("Opening date  ","",Header[9]))),"l")
DAYS_OPEN <- str_extract(Header[10],regexp)

header_1 <- c(SCH_NAME,LA_NAME)

