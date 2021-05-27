#####################################
# GLOBAL COMPONENT ##################
#####################################

# The 'global.R' file contains all packages, variables and functions
# that are available to other app components

#####################################
# LOADING PACKAGES ##################
#####################################

# Loading all the necessary packages for the Shiny app to run

if(!require(tidyverse, quietly = TRUE)) install.packages('tidyverse')
if(!require(shiny, quietly = TRUE)) install.packages('shiny')
if(!require(shinyjs, quietly = TRUE)) install.packages('shinyjs')
if(!require(leaflet, quietly = TRUE)) install.packages('leaflet')
if(!require(glue, quietly = TRUE)) install.packages('glue')
if(!require(zeallot, quietly = TRUE)) install.packages('zeallot')
if(!require(shinycssloaders, quietly = TRUE)) install.packages('shinycssloaders')
if(!require(shinythemes, quietly = TRUE)) install.packages('shinythemes')
if(!require(sf, quietly = TRUE)) install.packages('sf')
if(!require(plotly, quietly = TRUE)) install.packages('plotly')

library(tidyverse)         # Tidyverse
library(shiny)             # Shiny - Loading shiny
library(shinyjs)           # Shiny - Loading shiny JavaScript applications
library(leaflet)           # Mapping
library(glue)              # Util function
library(zeallot)           # Util function
library(shinycssloaders)   # Spinner when waiting
library(shinythemes)       # Shinythemes
library(sf)                # Shapefile
library(plotly)            # Plotly

#####################################
# LOADING DATA ######################
#####################################

source_dir <- 'R'
files_to_source <- file.path(source_dir, list.files(source_dir))
print(files_to_source)
map(files_to_source, source)

most_recent_data <- get_most_recent_data()
sf_nyc <- get_nyc_neighborhood_sf()

# Population estimate by zip code
pop_est <- sf_nyc %>% 
  as_tibble() %>% 
  select(ZIP_CODE, POP_EST) %>% 
  mutate(POP_EST = as.numeric(POP_EST))





