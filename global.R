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

library(tidyverse)         # Tidyverse
library(shiny)             # Shiny - Loading shiny
library(shinyjs)           # Shiny - Loading shiny JavaScript applications
library(leaflet)           # Mapping
library(glue)              # Util function
library(zeallot)           # Util function
library(shinycssloaders)   # Spinner when waiting

