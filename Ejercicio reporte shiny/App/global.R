library(shiny)
library(shinydashboard)#install.packages("shinydashboard")
library(tidyverse)
library(highcharter)


vuelos      <- read.csv("../Vuelos/flights.csv", stringsAsFactors = F)
aeropuertos <- read.csv("../Vuelos/airports.csv", stringsAsFactors = F)
aerolineas  <- read.csv("../Vuelos/airlines.csv", stringsAsFactors = F)
aviones     <- read.csv("../Vuelos/planes.csv", stringsAsFactors = F)
clima       <- read.csv("../Vuelos/weather.csv", stringsAsFactors = F)





