library(shiny)

ui <- fluidPage(
  numericInput(inputId = "age", label = "How old are you?", value = 20),
  
  textInput(inputId = "name", label = "What is your name?")
)

# Define the server logic
server <- function(input, output) {}

# Run the application
shinyApp(ui = ui, server = server)