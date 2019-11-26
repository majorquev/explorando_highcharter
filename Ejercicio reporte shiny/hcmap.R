library(highcharter)
library(dplyr)
library(purrr)


# Mapa con aeropuertos de destino -----------------------------------------

input <- list(destino = "MKE")

aux_data <- vuelos %>% 
  #DEJAR ESTO COMO EJERCICIO
  mutate(input_dest = input$destino ) %>%
  mutate(col_filt = if_else(input_dest == "ALL",dest,input_dest)) %>%
  filter(dest == col_filt) %>%
  left_join(aeropuertos, by = c("dest" = "faa") ) %>%
  dplyr::select(dest,
                name,
                lon,
                lat,
                arr_delay) %>% 
  group_by(name,dest) %>% 
  summarise(  lat = mean(lat,na.rm=T)
            , lon = mean(lon,na.rm=T)
            , n_vuelos = n()
            , value = round(mean(arr_delay,na.rm = T),2)
            ) %>% ungroup() %>%
  mutate( color = colorize(value),
          z = n_vuelos) %>% 
  na.omit()


hcmap("countries/us/us-all", showInLegend = F) %>% 
  hc_add_series(data = aux_data,
                type = "mapbubble",# si se quiere utilizar mapbubble se debe incluir variable z en dataset para dar el tamaño
                name = "Aeropuerto",
                dataLabels = list(enabled = F),
                # minSize = 5, maxSize = 30,
                tooltip = list(pointFormat = "{point.name}<br>Vuelos:{point.n_vuelos}<br>Retraseo medio (arr):{point.value}</b><br/>")
                ) %>%
                hc_mapNavigation(enabled = T) %>%
                hc_plotOptions(series = list(showInLegend = F)) %>% 
                hc_title(text = "Distribución de retrasos por aeropuerto de destino")


# Distribución de vuelos por destino/origen -------------------------------


vuelos_ori_des <- vuelos %>% 
  pivot_wider(
    id_cols = c("origin","dest","arr_delay"),
    names_from = origin,
    values_from = arr_delay,
    values_fn = list(arr_delay = length),
    values_fill = list(arr_delay = 0)
    
  ) 
# genere un dataset llamado vuelos_ori, donde cada fila represente 
# un aeropuerto de destino, y en cada columna se resistre el conteo 
# de vuelos proveniente de los distintos aeropuertos de origen.
# Mostrar ejemplo y nombres del dataset.

highchart() %>% 
  hc_chart(type = "column") %>%
  hc_plotOptions(column = list(stacking = "normal")) %>%
  hc_xAxis(categories = vuelos_ori_des$dest) %>%
  hc_add_series(name="Newark Liberty Intl",
                data = vuelos_ori_des$EWR,
                stack = "destino") %>%
  hc_add_series(name="La Guardia",
                data = vuelos_ori_des$LGA,
                stack = "destino") %>%
  hc_add_series(name="John F Kennedy Intl",
                data = vuelos_ori_des$JFK,
                stack = "destino") %>%
  hc_title(text="Cantidad de vuelos por origen/destino")



# Serie retraso medio por fecha -------------------------------------------

# Primero se debe considerar una serie por cada aeropuerto de *origen*
# 1) Se debe graficar el retraso promedio  de salida por día.
# 2) Se debe graficar (la visibilidad promedio por cada dia para cada aeropuerto de origen)
# 3) Se debe incluir un selector de aeropuerto de origen, de modo que :
#   *Si se selecciona un aeropuerto de origen, en el mismo gráfico
#   se despliegue la serie de la visibilidad y el retraso medio de salida.
#   *Si se selecciona la opción "ALL"(incluir), se deben desplegar 6 series;
#   retrasos medios por aeropuerto (3), y visibilidad media por aeropuerto (3)




# Opciones de pestañas en panel lateral -----------------------------------

# Consulte la documentación https://rstudio.github.io/shinydashboard/get_started.html
# Para generar dos pestañas en el dashboard, de modo que el gráfico de series 
# Sea visualizado en una segunda pestaña llamada "Series" y escoja un 
# nombre para la primera pestaña.

# Opcional: incluya un gráfico de autocorrelación cruzada entre el retraso y la visibilidad.
#







