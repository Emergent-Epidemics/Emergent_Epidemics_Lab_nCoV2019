#SV Scarpino
#nCov2019
#Jan 24th 2020

update_data <- function(savefile = TRUE) {
  #libraries
  require(googlesheets4)
  require(googledrive)
  
  #globals
  cols_to_match <- c("ID", "age", "sex", "city", "province", "country", "latitude", "longitude", "date_onset_symptoms", "date_admission_hospital", "date_confirmation", "symptoms", "lives_in_Wuhan", "travel_history_dates", "travel_history_location", "reported_market_exposure", "sequence_available", "outcome", "source")
  
  google_sheet_name <- readLines("secrets/google_sheet_name.txt")
  sheets_auth(path = "secrets/service_google_api_key.json", use_oob = TRUE)
  
  #acc functions
  
  
  #data
  wuhan_data <- sheets_get(ss = google_sheet_name) %>%
    read_sheet(sheet = "Hubei")
  
  #changing wuhan resident column
  find_Wuhan_resident <- which(colnames(wuhan_data) == "Wuhan_resident")
  if(length(find_Wuhan_resident) == 1){
    colnames(wuhan_data)[find_Wuhan_resident] <- "lives_in_Wuhan" #this is the column in the outside wuhan sheet
  }
  
  wuhan_data$ID <- paste0(wuhan_data$ID, "-Wuhan")
  
  outside_wuhan_data <- sheets_get(ss = google_sheet_name) %>%
    read_sheet(sheet = "outside_Hubei")
  
  outside_wuhan_data$ID <- paste0(outside_wuhan_data$ID, "-Outside-Wuhan")
  
  full_data <- rbind(wuhan_data[,cols_to_match], outside_wuhan_data[,cols_to_match])
  
  #processing data to ensure everything is correct type and not a list
  full_data$ID <- as.character(full_data$ID)
  full_data$age <- as.character(full_data$age)
  full_data$sex <- as.character(full_data$sex)
  full_data$city <- as.character(full_data$city)
  full_data$province <- as.character(full_data$province)
  full_data$country <- as.character(full_data$country)
  full_data$latitude <- as.numeric(full_data$latitude)
  full_data$longitude <- as.numeric(full_data$longitude)
  full_data$date_onset_symptoms <- as.POSIXct(strptime(full_data$date_onset_symptoms, format = "%d.%m.%Y"))
  full_data$date_admission_hospital <- as.POSIXct(strptime(full_data$date_admission_hospital, format = "%d.%m.%Y"))
  full_data$date_confirmation <- as.POSIXct(strptime(full_data$date_confirmation, format = "%d.%m.%Y"))
  full_data$symptoms <- as.character(full_data$symptoms)
  full_data$lives_in_Wuhan <- as.character(full_data$lives_in_Wuhan)
  full_data$travel_history_dates <- as.POSIXct(strptime(full_data$travel_history_dates, format = "%d.%m.%Y"))
  full_data$travel_history_location <- as.character(full_data$travel_history_location)
  full_data$reported_market_exposure <- as.character(full_data$reported_market_exposure)
  full_data$sequence_available <- as.character(full_data$sequence_available)
  full_data$outcome <- as.character(full_data$outcome)
  full_data$source <- as.character(full_data$source)
  
  full_data$latitude <- jitter(full_data$latitude)
  full_data$longitude <- jitter(full_data$longitude)
  
  #saving data
  if(savefile == TRUE){
    saveRDS(full_data, file = "data/full_data.RData")
    write(as.character(Sys.time()), file = "data/last_data_update.txt")
  }else{
    return(full_data)
  }
}