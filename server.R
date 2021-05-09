#####################################
# BACK-END COMPONENT ################
#####################################
server <- function(input, output, session) {
  
  data_rv <- reactive({
    most_recent_data %>% 
      filter(DATE == input$ili_time)
  })
  
  output$ili_nyc_map <- renderPlotly({
    
    total_ili_visits_per_pop_by_zip <- data_rv() %>% 
      left_join(pop_est, by = 'ZIP_CODE') %>% 
      mutate(ILI_VISIT_PER_1000_PT = ILI_VISIT*1000/POP_EST) %>% 
      group_by(ZIP_CODE) %>% 
      summarize(TOTAL_ILI_VISIT_PER_1000_PT = sum(ILI_VISIT_PER_1000_PT)) %>% 
      ungroup()
    
    p <- sf_nyc %>%
      left_join(total_ili_visits_per_pop_by_zip, by = 'ZIP_CODE') %>% 
      mutate(TOTAL_ILI_VISIT_PER_1000_PT = replace_na(TOTAL_ILI_VISIT_PER_1000_PT, 0)) %>% 
      ggplot(aes(label = ZIP_CODE)) +
      geom_sf(aes(fill = TOTAL_ILI_VISIT_PER_1000_PT), lwd = 0) +
      theme_bw() +
      theme(legend.position = 'none') +
      scale_fill_viridis_c()
    
    ggplotly(p) %>% 
      layout(height = 800, width = 800)
    
  })
  
  #######################################################
  # STOP APP ############################################
  #######################################################
  if (is.null(session$user)) {
    session$onSessionEnded(function() {
      stopApp()
    })
  }
}