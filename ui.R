#####################################
# FRONT-END COMPONENT ###############
#####################################

ui <- fluidPage(
  
  useShinyjs(),
  
  # Custom JavaScript
  tags$script("
    Shiny.addCustomMessageHandler('resetValue', function(variableName) {
      Shiny.onInputChange(variableName, null);
    });
  "),
  
  navbarPage('Influenza-Related Ilnesses in NYC Zip Codes', 
             theme = shinytheme('lumen'),
             selected = 'ILI Data',
             tabPanel('ILI Data', fluid = TRUE, icon = icon('chart-line'),
                      
                      # Tab title ----
                      headerPanel(h3("ILI Data by Zip Codes")),
                      
                      sidebarPanel(
                        sliderInput(inputId = 'ili_time',
                                    label = 'Time (Year and Month):',
                                    min = as.Date('2020-03-01'),
                                    max = as.Date('2021-05-06'),
                                    value = as.Date('2021-05-06'))
                        
                      ), # End sidebarPanel
                      
                      mainPanel(
                        h3(glue('ILI NYC Map')),
                        br(),
                        shinycssloaders::withSpinner(
                          plotlyOutput(outputId = 'ili_nyc_map'), type = 1
                        )
                      ) # End mainPanel
             ) # End tabPanel 'Metrics Progression'
  )
  
)