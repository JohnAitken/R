# VERSION 1

library(tesseract)
library(tidyverse)

setwd("C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev")

eng <- tesseract("eng")
text <- tesseract::ocr("10088075_10055_202324.pdf", engine = eng) %>% strsplit(split = "\n")

df <- data.frame(matrix(unlist(text[2:5]),byrow=T),stringsAsFactors=FALSE)


# VERSION 2

library(tesseract)
library(tidyverse)

# Set the working directory
setwd("C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev")

# Initialize tesseract engine for English
eng <- tesseract("eng")

pdf_file <- "10088075_10055_202324.pdf"
text <- ocr(pdf_file, engine = eng)

# Split the text by newline characters

text_lines1 <- strsplit(text, "\n")[[2]]
text_lines2 <- strsplit(text, "\n")[[3]]
text_lines3 <- strsplit(text, "\n")[[4]]
text_lines <- strsplit(text, "\n")[[5]]


# Create a data frame with the text as columns
df <- data.frame(text_lines, stringsAsFactors = FALSE)

# Print the resulting data frame
print(df)

# List all files with a ".png" extension in the working directory
png_files <- list.files(pattern = "\\.png$")

# Check if there are any files to delete HAVE TO FIX THis
if (length(png_files) > 0) {
  # Remove all files with a ".png" extension
  file.remove(png_files)
  cat("Deleted", length(png_files), "PNG files.\n")
} else {
  cat("No PNG files found in the working directory.\n")
}



# VERSION 3

library(tesseract)
library(tidyverse)

# Set the working directory
setwd("C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev")

# Initialize tesseract engine for English
eng <- tesseract("eng")

# Specify the PDF file
pdf_file <- "10088075_10055_202324.pdf"

# Perform OCR to get the concatenated text for all pages
text <- ocr(pdf_file, engine = eng)

# Define the number of pages
num_pages <- 4  # Update with the actual number of pages

# Initialize a list to store results
all_results <- list()

# Loop through pages 2 to num_pages+1
for (page_num in 2:(num_pages + 1)) {
  text_lines <- strsplit(text, "\n")[[page_num]]
  # Create a data frame with index, page, text_lines, and pdf_file columns
  result_df <- data.frame(
    index = seq_along(text_lines),
    page = page_num - 1,
    text_lines = text_lines,
    pdf_file = pdf_file
  )
  # Store in the list
  all_results <- c(all_results, list(result_df))
}

# Combine the results into a single data frame
df <- do.call(rbind, all_results)

# Print the resulting data frame
print(df)

# Delete the PNGs in folder
png_files <- list.files(pattern = "\\.png$")

# Check if there are any files to delete 
if (length(png_files) > 0) {
  # Remove all files with a ".png" extension
  file.remove(png_files)
  cat("Deleted", length(png_files), "PNG files.\n")
} else {
  cat("No PNG files found in the working directory.\n")
}



# VERSION 4

# Record the start time
start_time <- Sys.time()

# Your existing code here
library(tesseract)
library(tidyverse)

# Set the working directory
setwd("C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev")

# Initialize tesseract engine for English
eng <- tesseract("eng")

# Specify the PDF file
pdf_file <- "10088075_10055_202324.pdf"

# Perform OCR to get the concatenated text for all pages
text <- ocr(pdf_file, engine = eng)

# Define the number of pages
num_pages <- 4  # Update with the actual number of pages

# Initialize a list to store results
all_results <- list()

# Loop through pages 2 to num_pages+1
for (page_num in 2:(num_pages + 1)) {
  text_lines <- strsplit(text, "\n")[[page_num]]
  # Create a data frame with index, page, text_lines, and pdf_file columns
  result_df <- data.frame(
    index = seq_along(text_lines),
    page = page_num - 1,
    text_lines = text_lines,
    pdf_file = pdf_file
  )
  # Store in the list
  all_results <- c(all_results, list(result_df))
}

# Combine the results into a single data frame
df <- do.call(rbind, all_results)

# Print the resulting data frame
print(df)

# Delete the PNGs in folder
png_files <- list.files(pattern = "\\.png$")

# Check if there are any files to delete 
if (length(png_files) > 0) {
  # Remove all files with a ".png" extension
  file.remove(png_files)
  cat("Deleted", length(png_files), "PNG files.\n")
} else {
  cat("No PNG files found in the working directory.\n")
}

# Record the end time
end_time <- Sys.time()

# Calculate the elapsed time
elapsed_time <- end_time - start_time

# Print the elapsed time
cat("Elapsed time:", format(elapsed_time, units = "secs"), "\n")
