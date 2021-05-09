#' Get NYC Neighborhood Shapefile
#'
#' @return
#' @export
get_nyc_neighborhood_sf <- function() {
  raw_sf <- read_sf("https://data.cityofnewyork.us/resource/pri4-ifjk.geojson")
  
  raw_sf %>% 
    dplyr::rename(ZIP_CODE = modzcta,
                  POP_EST = pop_est) %>% 
    select(ZIP_CODE, POP_EST, geometry)
}