library(shiny)
server <- function(input, output, session) {
  # MODIFY CODE BELOW: Use eventReactive to delay the execution of the
  # calculation until the user clicks on the show_bmi button (Show BMI)
  rval_bmi <- eventReactive(input$show_bmi, {
    input$weight/(input$height^2)
  })
  output$bmi <- renderText({
    bmi <- rval_bmi()
    paste("Hi", input$name, ". Your BMI is", round(bmi, 1))
  })
}

ui <- fluidPage(
  titlePanel('BMI Calculator'),
  sidebarLayout(
    sidebarPanel(
      textInput('name', 'Enter your name'),
      numericInput('height', 'Enter height (in m)', 1.5, 1, 2, step = 0.1),
      numericInput('weight', 'Enter weight (in Kg)', 60, 45, 120),
      actionButton("show_bmi", "Show BMI")
    ),
    mainPanel(
      textOutput("bmi")
    )
  )
)

shinyApp(ui = ui, server = server)