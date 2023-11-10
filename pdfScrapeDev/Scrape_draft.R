# library("pdftools")
# library("tidyverse")

# setwd("C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev")

# scrape1 <- pdftools::pdf_text("10088075_10055_202324.pdf")

# scrape2 <- strsplit(scrape1, "\n")

# print(head(scrape2[[1]]))

library(tesseract)

setwd("C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev")

eng <- tesseract("eng")
text <- tesseract::ocr("10088075_10055_202324.pdf", engine = eng)
cat(text)