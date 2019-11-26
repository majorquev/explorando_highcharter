# install.packages("highcharter")
library(highcharter)
library(ggplot2)
library(forecast) # permite generar predicciones para algunos modelos estadísticos.
library(tidyverse) # conjunto de librerías como ggplot2, dplyr,stringr, etc...

# Documentación de la librería http://jkunst.com/highcharter/
# Dcocumentación de la API de highcharts https://www.highcharts.com/



# hchart() ----------------------------------------------------------------

# Uno de los métodos más sencillos para generar un gráfico simple con highchart,
# es con la función hchart().
# Recibe un dataset y una capa estétca hcaes

methods(hchart)

# Datos desde un data.frame
  ## economics_long (type line)

ggplot(economics_long) +
  aes(x = date, y = value01, col = variable) +
  geom_line()


ggplot(economics_long,
       aes(x = date, y = value01, col = variable) ) +
  geom_line()


economics_long %>%
 hchart( type = "line"
   ,hcaes(x = date, y = value01, group = variable) 
   ) 

data(mpg)

  ## mpg (type scatter)
mpg %>%
  hchart( type = "scatter"
          ,hcaes(x = displ, y = hwy, group = drv) 
  ) 



# hchart(), grafica automáticamente ciertos tipos de objetos
# methods(hchart)
# Ejemplo ts
USAccDeaths
  ## dataset USAccDeaths
  ## Podemos ajustar un suavizado con ets()
  ## Es posible generar predicciones con forecast)()
  
class(USAccDeaths)
plot(USAccDeaths)

hchart(USAccDeaths) %>%
  hc_title(text = "This is a title with <i>margin</i> and <b>Strong or bold text</b>",
           margin = 20, align = "center",
           style = list(color = "#90ed7d", useHTML = TRUE))

# Ejemplo histograma (gráfico por defecto de hchart cuando recibe como argumento un vector numérico)

hchart(mpg$hwy)


# Ejemplo: gráfico de densidades provenientes de density()
x <- rnorm(1000)
densidad <- density(x)

hchart(densidad)

# Función highchart() -------------------------------------------------

highchart() %>% 
  hc_add_series(data = economics_long$value01) %>%
  hc_xAxis(economics_long$date)
  


# Etiquetas y títulos -----------------------------------------------------

## Stock : Podemos generar una serie de tiempo con los valores de economics_long


x1 <- economics_long$value01[economics_long$variable == "unemploy"]
x2 <- economics_long$value01[economics_long$variable == "psavert"]

ts_1 <- ts(x1, start =c(1967,1), frequency = 7/365.25 )
ts_2 <- ts(x2, start =c(1967,1), frequency = 12 )



highchart(type = "chart") %>%
  hc_yAxis_multiples(list(top = "0%", height = "100%", lineWidth = 3,
                          opposite = FALSE)
                     ,list(top = "0%", height = "100%", offset = 30,
                           showFirstLabel = FALSE, showLastLabel = FALSE,
                           opposite = TRUE)) %>% 
  hc_add_series(data = ts_1) %>%
  hc_add_series(data = ts_2, yAxis = 1) 
















