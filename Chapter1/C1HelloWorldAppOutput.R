library(shiny)
ui <- fluidPage(
  textInput("name", "What is your name?"),
  
  textOutput("greeting")
)

server <- function(input, output) {
  
  output$greeting <- renderText({
    paste("Hello", input$name)
  })
  
}

shinyApp(ui = ui, server = server)
