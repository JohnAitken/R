# ATTEMPT 5

start_time <- Sys.time()

library(tesseract)
library(tidyverse)

# Set your working directory to the folder containing PDF files
pdf_folder <- "C:/Users/JA/Documents/Git_Repositories/R/pdfScrapeDev"
setwd(pdf_folder)

# Tesseract read
eng <- tesseract("eng")

# Get a list of all PDF files in the folder
pdf_files <- list.files(pattern = "\\.pdf$", full.names = TRUE)

# Initialize a list to store results
all_results <- list()

# Loop through each PDF file
for (pdf_file in pdf_files) {
  cat("Processing file:", pdf_file, "\n")
  
  # Perform OCR on the PDF file
  text <- ocr(pdf_file, engine = eng)
  
  # Determine the number of pages in the PDF
  num_pages <- length(strsplit(text, "\n")[[1]])
  
  # Loop through pages 2 to num_pages+1
  for (page_num in 2:(num_pages + 1)) {
    if (length(text) >= page_num) {
      text_lines <- strsplit(text, "\n")[[page_num]]
      
      if (length(text_lines) > 0) {
        # Create a data frame with index, page, text_lines, and pdf_file columns
        result_df <- data.frame(
          pdf_file = pdf_file,
          page = page_num - 1,
          text_lines = text_lines
        )
        all_results <- c(all_results, list(result_df))
      }
    }
  }
}

# Combine the results into a single data frame
df <- dplyr::bind_rows(all_results)

# Delete any PNGs in folder left over from the OCR
png_files <- list.files(pattern = "\\.png$")
if (length(png_files) > 0) {
  # Remove all files with a ".png" extension
  file.remove(png_files)
  cat("Deleted", length(png_files), "PNG files.\n")
} else {
  cat("No PNG files found in the working directory.\n")
}

# Print the elapsed time to process
end_time <- Sys.time()
elapsed_time <- end_time - start_time
cat("Elapsed time:", format(elapsed_time, units = "secs"), "\n")

str(df)
