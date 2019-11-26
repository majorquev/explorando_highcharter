library(shiny)
library(shinydashboard)#install.packages("shinydashboard")
library(tidyverse)
library(highcharter)


vuelos      <- read.csv("flights/flights.csv", stringsAsFactors = F)
aeropuertos <- read.csv("flights/airports.csv", stringsAsFactors = F)
aerolineas  <- read.csv("flights/airlines.csv", stringsAsFactors = F)
aviones     <- read.csv("flights/planes.csv", stringsAsFactors = F)
clima       <- read.csv("flights/weather.csv", stringsAsFactors = F)





