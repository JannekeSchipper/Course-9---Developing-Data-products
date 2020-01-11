#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)

dataset <- read.csv("./top10.csv")

top10 <- dataset%>%
  top_n(10, Plastic)%>%
  arrange(desc(Plastic))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("courty vs ", input$variable)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  output$distPlot <- renderPlot({
    ggplot(top10, aes_string(y=input$variable, x="Entity", fill = "Entity")) + 
      geom_bar(stat = "identity", width = 0.7) +
      coord_flip() +
      theme(legend.position="none") +
      labs(title = "Top 10 Countries plastic usage", x = "Country")
  })
  
})


