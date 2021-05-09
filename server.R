#####################################
# BACK-END COMPONENT ################
#####################################
server <- function(input, output, session) {
  
  #######################################################
  # STOP APP ############################################
  #######################################################
  # This logic is implemented for local session only.
  # When deployed to RConnect (meaning when session$user is not NULL)
  # this logic will not apply, because stopping current session will stop apps
  # for all other users.
  if (is.null(session$user)) {
    session$onSessionEnded(function() {
      stopApp()
    })
  }
}