library(shiny)
library(ggplot2)
library(dplyr)
library(babynames)
data(babynames, package = "babynames")
ui <- fluidPage(
  titlePanel("What's in a Name?"),
  selectInput('sex', 'Select Sex', choices = c("F", "M")),
  sliderInput('year', 'Select Year', min = 1900, max = 2010, value = 1900),
  plotOutput('plot_top_10_names')
)

server <- function(input, output, session){
  output$plot_top_10_names <- renderPlot({
    top_10_names <- babynames %>% 
      filter(sex == input$sex) %>% 
      filter(year == input$year) %>% 
      top_n(10, prop)
    ggplot(top_10_names, aes(x = name, y = prop)) +
      geom_col(fill = "#263e63")
  })
}

shinyApp(ui = ui, server = server)
