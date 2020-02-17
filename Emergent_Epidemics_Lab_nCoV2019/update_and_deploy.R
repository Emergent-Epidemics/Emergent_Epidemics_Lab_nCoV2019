library(rsconnect)

args <- commandArgs(trailingOnly=TRUE)
source(paste0(args[1], "scripts/update_data.R")) #first argument should full path to the directory for the "update_and_deploy.R" script
update_data()
deployApp()