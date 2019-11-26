

# Mapa con aeropuertos de destino -----------------------------------------

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








