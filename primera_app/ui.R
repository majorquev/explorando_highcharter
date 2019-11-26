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
    titlePanel("Mi primera app"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "trans",
                        label = "Tipo de tracción",
                        choices = c(levels(as.factor(mpg$drv)),"all")
                        ),
            dateRangeInput(inputId = "filtro",
                           label = "Seleccione fecha inicio y fin",
                           start = "1967-07-01",
                           end = "2015-04-01" )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput(outputId = "dipersion"),
            plotOutput(outputId = "boxplot"),
            highchartOutput(outputId = "series"),
            
        )
    )
))
