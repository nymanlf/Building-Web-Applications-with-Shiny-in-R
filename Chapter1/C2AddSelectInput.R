library(shiny)
library(ggplot2)
library(dplyr)
library(babynames)
data(babynames, package = "babynames")
ui <- fluidPage(
  titlePanel("What's in a Name?"),
  selectInput('sex', 'Select Sex', choices = c("F", "M")),
  plotOutput('plot_top_10_names')
)

server <- function(input, output, session){
  output$plot_top_10_names <- renderPlot({
    top_10_names <- babynames %>% 
      filter(sex == input$sex) %>% 
      filter(year == 1900) %>% 
      slice_max(prop, n = 10)
    ggplot(top_10_names, aes(x = name, y = prop)) +
      geom_col(fill = ifelse(input$sex == "F", "pink", "blue"))
  })
}

shinyApp(ui = ui, server = server)

