server <- function(input, output) { 
  ## cree un objeto reactivo, que contenga el dataset *vuelos* 
  #filtrado para el aeropuerto de destino seleccionado
  # input <- list(destino = "IAH")
  aux <- reactive({ #despues aux se llama como aux()
    
    temp <- vuelos %>% 
      mutate(col_aux = input$destino) %>%
      mutate(dest_filtro = ifelse(col_aux =="ALL",dest,col_aux)) %>%
      filter(dest == dest_filtro)
    return(temp)
  })
  
  
  
  # outputs -----------------------------------------------------------------
  
  # infoBox arr_delay_prom ----------------------------------------------------
  
  output$arr_delay_prom <- renderInfoBox({
    #notar que renderInfoBox recibe un objeto de tipo infoBox()
    infoBox(  title = "Promedio retraso salida"
              , value = mean(aux()$dep_delay,na.rm=T)
              , icon = shiny::icon("stopwatch")
              , color = "olive" 
    )
    
  })
  
  # infoBox dep_del_prom ----------------------------------------------------
  
  
  
  
  # mapa --------------------------------------------------------------------
  
  
  
  # grÃ¡fico de barras stacked -----------------------------------------------
  
  output$stacked <- renderHighchart({
    
    
    # genere un dataset llamado vuelos_ori, donde cada fila represente 
    # un aeropuerto de destino, y en cada columna se resistre el conteo 
    # de vuelos proveniente de los distintos aeropuertos de origen.
    # Mostrar ejemplo y nombres del dataset.
    
    # Como referencia puede utilizar la ayuda de https://stackoverflow.com/questions/54651243/r-highcharts-multiple-stacked-bar-chart
    
  })
  
  
  # Series  -----------------------------------------------------------------
  
  output$series_ts <- renderHighchart({
    
    
    
    
  })
  
  
  # correlaciÃ³n -------------------------------------------------------------
  
  # output$correlacion <- renderHighchart({
  #   df_ts <- vuelos %>%
  #     mutate(input_ori = input$origen ) %>%
  #     mutate(col_filt_ori = if_else(input_ori == "ALL",origin,input_ori)) %>%
  #     filter(origin == col_filt_ori) %>% 
  #     left_join(clima, by = c("origin","time_hour") ) %>%
  #     mutate(time_hour2 = as.character(as.Date(time_hour))) %>%
  #     select(dep_delay,temp,dewp,humid,wind_dir,wind_speed,
  #            wind_gust,precip,pressure,visib) %>%
  #     na.omit()
  
  ## Busque en la documentaciÃ³n cÃ³mo generar un grÃ¡fico de correlaciÃ³n
  
  
  
  
  # })  
  
}