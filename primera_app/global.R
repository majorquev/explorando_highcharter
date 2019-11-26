library(ggplot2)
library(dplyr)
library(highcharter)


data(mpg)
economics_long


economics_long %>% 
  filter(variable == "unemploy" & date <= as.Date("2014-01-01") 
         & date >= as.Date("2013-01-01") )




