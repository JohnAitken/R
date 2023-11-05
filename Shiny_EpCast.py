library(shiny)

# Define the user interface
ui <- fluidPage(
  titlePanel("Episode Filter App"),
  sidebarLayout(
    sidebarPanel(
      textInput("filter_value", "Enter the value to filter by:"),
      actionButton("filter_button", "Filter"),
      downloadButton("download_button", "Download Master List")
    ),
    mainPanel(
      verbatimTextOutput("episode_summary"),
      verbatimTextOutput("cast_list")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  # Read the CSV files
  dwguide <- read.csv("dwguide_clean.csv", stringsAsFactors = FALSE)
  castlist <- read.csv("castlist.csv", stringsAsFactors = FALSE)

  # Merge data frames
  jd <- merge(dwguide, castlist, by = "episodenbr", all.x = TRUE)

  # Function to filter data
  filter_data <- function() {
    filter_value <- tolower(input$filter_value)
    jd$title <- tolower(jd$title)
    filtered_df <- jd[jd$title == filter_value, ]
    return(filtered_df)
  }

  # Render episode summary
  output$episode_summary <- renderPrint({
    filtered_df <- filter_data()
    if (nrow(filtered_df) > 0) {
      cat("Episode summary\n")
      filtered_df_1 <- head(filtered_df, 1) %>%
        select(-role, -name)
      print(filtered_df_1, row.names = FALSE)
    } else {
      cat(paste("No rows found with title equal to", input$filter_value, "\n"))
    }
  })

  # Render cast list
  output$cast_list <- renderPrint({
    filtered_df <- filter_data()
    if (nrow(filtered_df) > 0) {
      cat("\nThe Cast:\n")
      filtered_df_2 <- filtered_df %>%
        select(role, name)
      print(filtered_df_2, row.names = FALSE)
    }
  })

  # Define a reactive expression to download the master list
  master_list_data <- eventReactive(input$filter_button, {
    filtered_df <- filter_data()
    return(filtered_df)
  })

  # Allow users to download the master list
  output$download_button <- downloadHandler(
    filename = function() {
      "master_list.csv"
    },
    content = function(file) {
      write.csv(master_list_data(), file)
    }
  )
}

# Run the Shiny app
shinyApp(ui, server)
