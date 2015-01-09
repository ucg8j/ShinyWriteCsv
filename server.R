    # Load data
    setwd("/Users/lukesingham/SOtestApp")
    geodata <- read.csv("geodata.csv", na.string = "#N/A", row.names=NULL)

    # Reactivity to subset data ####
    shinyServer(function(input, output) {
      geodatasetInput <- reactive({
        
        # BSL switch
        selection <-switch(input$BSL
                           , A = "A"
                           , B = "B"
                           ) 
        # Location switch    
        selection2 <-switch(input$Location
                           , C = "C"
                           , D = "D"
                           )
        
        # subset based on selection
        Subgeodata <- subset(geodata, BSL == selection & Position.Location == selection2)
        
        # Execute selections on data upon button-press
        input$generateButton

        # aggregate by postcode
        Subgeodata <- Subgeodata[1:2] #no longer need other columns
        AggSubGdata <- aggregate(. ~ Postcode, data=Subgeodata, FUN=sum)
        isolate(write.csv(AggSubGdata
                  , file = "/Users/lukesingham/SOtestApp/solution.csv"
                  , row.names=F
        ))
      })
    })
