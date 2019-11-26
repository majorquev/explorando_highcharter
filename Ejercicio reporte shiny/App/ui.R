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
  ),
## FIN SIDEBAR


# Body --------------------------------------------------------------------

  dashboardBody(
    # las cajas (box) deben declararse dentro de filas ()
    fluidRow(
      ## Dentro de esta fila incluya dos cajas de tipo *infoBox*,
      # Que muestren el retraso promedio de salida y retraso promedio de llegada.
    )
  )
## FIN BODY
)


