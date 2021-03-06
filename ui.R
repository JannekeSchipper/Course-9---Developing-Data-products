#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Top 10 Countries plastic useage"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Variable:", 
                  c("Plastic" = "Plastic",
                    "Gross Domestic Product Per Capita" = "GDPPC",
                    "Literacy" = "Literacy",
                    "Infant Mortality" = "InfantMortality",
                    "Population" = "Population"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
