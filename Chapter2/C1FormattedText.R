library(shiny)

ui <- fluidPage(
  # "DataCamp" as a primary header
  h1("DataCamp"),
  # "Shiny use cases course" as a secondary header
  h2("Shiny use cases course"),
  # "Shiny" in italics
  em("Shiny"),
  # "is fun" as bold text
  strong("is fun")
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)