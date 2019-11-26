#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    aux <- reactive({
        if(input$trans == "all"){
            return(mpg)
        }else{
            return(filter(mpg, drv == input$trans))
        } 
    }) 
  
    
    
    output$boxplot <- renderPlot({
       
        ggplot(aux()) +
            aes(x = drv, y = hwy)+
            geom_boxplot()
        
    })
    
    output$dipersion <- renderPlot({
        
        ggplot(aux()) +
            aes(x = displ, y = hwy, col = drv)+
            geom_point()

    })

    output$series <- renderHighchart({
        x1 <-  economics_long %>% 
            filter(variable == "unemploy" & date <= as.Date(format(input$filtro[2]) ) 
                   & date >= as.Date(format(input$filtro[1]) ) )
            
        x2 <- economics_long %>% 
            filter(variable == "psavert" & date <= as.Date(input$filtro[2]) 
                   & date >= as.Date(input$filtro[1]) )
        
        ts_1 <- ts(x1, start =c(1967,1), frequency = 12 )
        ts_2 <- ts(x2, start =c(1967,1), frequency = 12 )
        
        
        highchart(type = "stock") %>%
            hc_yAxis_multiples(list(top = "0%", height = "100%", lineWidth = 3,
                                    opposite = FALSE)
                               ,list(top = "0%", height = "100%", offset = 30,
                                     showFirstLabel = FALSE, showLastLabel = FALSE,
                                     opposite = TRUE)) %>% 
            hc_add_series(data = ts_1) %>%
            hc_add_series(data = ts_2, yAxis = 1)
    })
    
    
})
