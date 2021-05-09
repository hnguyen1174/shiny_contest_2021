#' Query Data from API
#' 
#' This function gets Influenza-like Illnesses data
#' from NYC Open Data API.
#'
#' @param limit query limitations from API
#'
#' @return raw data for Influenza-like Illnesses (ILI)
#' @export
qry_data_from_api <- function(limit = 20000000) {
  
  tic()
  readr::read_csv(glue('https://data.cityofnewyork.us/resource/2nwg-uqyg.csv?$limit={limit}'))
  toc()
}

#' Process Most Recent ILI Data
#' 
#' This function gets the most recent ILI data
#'
#' @param data raw ILI data
#'
#' @return most recent ILI data
#' @export
prc_most_recent_data <- function(data) {
  
  most_recent_date <- data %>% 
    pull(extract_date) %>% max()
  
  most_recent_data <- data %>% 
    filter(extract_date == most_recent_date) %>% 
    select(date, mod_zcta, total_ed_visits, ili_pne_visits, ili_pne_admissions) %>% 
    dplyr::rename(DATE = date,
                  ZIP_CODE = mod_zcta, 
                  ER_VISIT = total_ed_visits,
                  ILI_VISIT = ili_pne_visits,
                  ILI_ADMIT = ili_pne_admissions) %>% 
    mutate(DATE = as.Date(DATE), 
           ZIP_CODE = as.character(ZIP_CODE))
  
  most_recent_data
}

#' Get Most Recent ILI data
#'
#' @param qry_data a logical flag (TRUE/FALSE) for whether to get data from API
#'
#' @return most recent ILI data
#' @export
get_most_recent_data <- function(qry_data = FALSE) {
  
  if (qry_data) {
    raw_data <- qry_data_from_api()
  } else {
    raw_data <- readRDS(file.path(here::here(), 'data/most_recent_data.rds'))
  }
  
  prc_most_recent_data(raw_data)
}
