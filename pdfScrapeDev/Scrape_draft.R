
# VERSION 4


start_time <- Sys.time()

library(tesseract)
library(tidyverse)

setwd("C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev")

# Tesseract read
eng <- tesseract("eng")
pdf_file <- "10088075_10055_202324.pdf"
text <- ocr(pdf_file, engine = eng)


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
  all_results <- c(all_results, list(result_df))
}

# Combine the results into a single data frame
df <- do.call(rbind, all_results)

# Delete the PNGs in folder
png_files <- list.files(pattern = "\\.png$")
if (length(png_files) > 0) {
  # Remove all files with a ".png" extension
  file.remove(png_files)
  cat("Deleted", length(png_files), "PNG files.\n")
} else {
  cat("No PNG files found in the working directory.\n")
}

# Calculate and print the elapsed time
end_time <- Sys.time()
elapsed_time <- end_time - start_time
cat("Elapsed time:", format(elapsed_time, units = "secs"), "\n")
