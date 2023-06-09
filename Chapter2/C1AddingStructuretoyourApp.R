library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      h4("Plot parameters"),
      textInput("title", "Plot title", "Car speed vs distance to stop"),
      numericInput("num", "Number of cars to show", 30, 1, nrow(cars)),
      sliderInput("size", "Point size", 1, 5, 2, 0.5)
    ),
    mainPanel(
      plotOutput("plot"),
      tableOutput("table")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$plot <- renderPlot({
    plot(cars[1:input$num, ], main = input$title, cex = input$size)
  })
  output$table <- renderTable({
    cars[1:input$num, ]
  })
}

# Run the application
shinyApp(ui = ui, server = server)