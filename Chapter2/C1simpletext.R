library(shiny)

ui <- fluidPage(
  titlePanel("Shiny is fun"))

server <- function(input, output) {}

shinyApp(ui = ui, server = server)