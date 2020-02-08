#SV Scarpino
#nCov2019
#Feb 8th 2020

#libraries

#globals
today_date <- Sys.time()
mapbox_accessToken <- readLines("secrets/mapboxkey.txt")
map_url <- "mapbox://styles/scarpino/ck4zuxput0zz71dlkntkup80v"

options(mapbox.accessToken = mapbox_accessToken)

cols_to_use <- c("ID", "age", "sex", "city", "province", "country" ,"date_onset_symptoms", "date_admission_hospital", "date_confirmation", "symptoms", "lives_in_Wuhan", "travel_history_dates", "travel_history_location", "reported_market_exposure", "sequence_available", "outcome", "source")

last_update <- readLines("data/last_data_update.txt")
last_update_day <- strptime(substr(last_update, 1, 10), format = "%Y-%m-%d")
today <- strptime(substr(today_date, 1, 10), format = "%Y-%m-%d")
time_diff <- as.numeric(today - last_update_day, unit = "days")

#data
full_data <- readRDS("data/full_data.RData")

#acc functions
source("scripts/update_data.R")