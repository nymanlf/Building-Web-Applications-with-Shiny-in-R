library(shiny)

ui <- fluidPage(
  h1("Word Cloud"),
  # Add a sidebar layout to the UI
  sidebarLayout(
    # Define a sidebar panel around the inputs
    sidebarPanel(
      numericInput("num", "Maximum number of words",
                   value = 100, min = 5),
      colourInput("col", "Background color", value = "white")
    ),
    # Define a main panel around the output
    mainPanel(
      wordcloud2Output("cloud")
    )
  )
)

server <- function(input, output) {
  output$cloud <- renderWordcloud2({
    create_wordcloud(artofwar,
                     num_words = input$num, background = input$col)
  })
}

shinyApp(ui = ui, server = server)