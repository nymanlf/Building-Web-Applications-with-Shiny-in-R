library(shiny)

ui <- fluidPage(
  selectInput('greeting_type', 'Select greeting', c("Hello", "Bonjour")),
  textInput('name', 'Enter your name'),
  textOutput('greeting')
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste(input$greeting_type, input$name, sep = ", ")
  })
}

shinyApp(ui = ui, server = server)
