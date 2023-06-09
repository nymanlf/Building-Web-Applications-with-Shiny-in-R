library(shiny)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(babynames)
data(babynames, package = "babynames")
get_top_names <- function(.year, .sex) {
  babynames %>% 
    filter(year == .year) %>% 
    filter(sex == .sex) %>% 
    top_n(10) %>% 
    mutate(name = forcats::fct_inorder(name))
}

ui <- fluidPage(
  titlePanel("Most Popular Names"),
  sidebarLayout(
    sidebarPanel(
      selectInput('sex', 'Select Sex', c("M", "F")),
      sliderInput('year', 'Select Year', 1880, 2013, 1900)
    ),
    mainPanel(
      plotOutput('plot')
    )
  )
)
server <- function(input, output, session) {
  output$plot <- renderPlot({
    top_names_by_sex_year <- get_top_names(input$year, input$sex) 
    ggplot(top_names_by_sex_year, aes(x = name, y = prop)) +
      geom_col()
  })
}
shinyApp(ui = ui, server = server)