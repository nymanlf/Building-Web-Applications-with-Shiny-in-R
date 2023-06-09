library(shiny)

# Define UI for the application
ui <- fluidPage(
  h1("Word Cloud"),
  # Add the word cloud output placeholder to the UI
  wordcloud2Output(outputId = "cloud")
)

# Define the server logic
server <- function(input, output) {
  # Render the word cloud and assign it to the output list
  output$cloud <- renderWordcloud2({
    # Create a word cloud object
    create_wordcloud(artofwar)
  })
}

# Run the application
shinyApp(ui = ui, server = server)