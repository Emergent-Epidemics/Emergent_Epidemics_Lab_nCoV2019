#SV Scarpino
#nCov2019
#Jan 24th 2020

###########
#Libraries#
###########
library(leaflet)

####
#UI#
####
navbarPage("COVID-19", id="nav",
           tabPanel("Interactive Map",
                    div(class="outer",
                        
                        tags$head(
                          # Include our custom CSS
                          includeCSS("styles.css"),
                          includeScript("gomap.js")
                        ),
                        
                        # If not using custom CSS, set height of leafletOutput to a number instead of percent
                        leafletOutput("map", width="100%", height="100%"),
                        
                        absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                      draggable = TRUE, top = 300, left = "auto", right = 1000, bottom = "auto",
                                      width = 300, height = "auto",
                                      
                                      h3(textOutput("total_cases")),
                                      h4(textOutput("last_updated")),
                                      selectInput("confirmed", "Confirmed Cases Only", c("No", "Yes"), multiple = FALSE),
                                      selectInput("country", "Country", unique(full_data$country), multiple = TRUE),
                                      selectInput("travel_history_location", "Travel History", unique(full_data$travel_history_location), multiple = TRUE),
                                      actionButton("reset_edges", "Reset Map")
                                      
                                      #plotOutput("histCentile", height = 200)
                                      
                        )
                    )
           ),
           
           tabPanel("Data Explorer",
                    #fluidRow(
                    #  column(3,
                    #         selectInput("time_interval_data", "Time Interval", names(networks), multiple = TRUE)
                    #  ),
                    #  column(3,
                    #         selectInput("facility_type_data", "Facility Type", unique(node_data$Type), multiple = TRUE)
                    #  )
                    #),
                    h3("Filters inherited from the Interactive Map"),
                    br(),
                    h4("Data from: http://virological.org/t/epidemiological-data-from-the-ncov-2019-outbreak-early-descriptions-from-publicly-available-data/337"),
                    hr(),
                    DT::dataTableOutput("wuhan_table")
           ),
           conditionalPanel("false", icon("crosshair")),
           tabPanel("News Sources",
                    DT::dataTableOutput("news_table")
           )
)
