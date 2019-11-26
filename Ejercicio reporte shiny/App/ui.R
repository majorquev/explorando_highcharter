library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  
  # Header ------------------------------------------------------------------
  
  dashboardHeader(title = "Reporte vuelos NY"
  ),
  ## FIN HEADER
  
  
  # Sidebar -----------------------------------------------------------------
  
  dashboardSidebar(
    ## Incluya un selector de texto de tipo *selectInput* que muestre las opciones de aeropuerto de destino
    selectInput(inputId = "destino",
                label = "Seleccione aeropuerto de destino",
                choices = c("ALL",unique(vuelos$dest)))
    
    
  ),
  ## FIN SIDEBAR
  
  
  # Body --------------------------------------------------------------------
  
  dashboardBody(
    # las cajas (box) deben declararse dentro de filas ()
    fluidRow(
      infoBoxOutput("arr_delay_prom"),
      infoBoxOutput("dep_delay_prom")
      
    )
  )
  ## FIN BODY
)


