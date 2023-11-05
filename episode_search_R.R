# Load necessary libraries
library(dplyr)

# Read the CSV files
dwguide <- read.csv("dwguide_clean.csv", stringsAsFactors = FALSE)
castlist <- read.csv("castlist.csv", stringsAsFactors = FALSE)

# Merge data frames
jd <- merge(dwguide, castlist, by = "episodenbr", all.x = TRUE)

# Ask the user for the value to filter by (and convert it to lowercase)
filter_value <- tolower(readline("Enter the value to filter by: "))

# Convert the values in the 'title' column to lowercase for case-insensitive comparison
jd$title <- tolower(jd$title)

# Filter the data frame while ignoring case differences
filtered_df <- jd[jd$title == filter_value, ]

# Display the first row of the filtered data frame (excluding 'role' and 'name' columns)
if (nrow(filtered_df) > 0) {
  cat("Episode summary\n")
  filtered_df_1 <- head(filtered_df, 1) %>%
    select(-role, -name)
  print(filtered_df_1, row.names = FALSE)

  # Display the 'name' and 'role' columns for the entire filtered data frame
  cat("\nThe Cast:\n")
  filtered_df_2 <- filtered_df %>%
    select(role, name)
  print(filtered_df_2, row.names = FALSE)
} else {
  cat(paste("No rows found with title equal to", filter_value, "\n"))
}
