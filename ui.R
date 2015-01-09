shinyUI(
  pageWithSidebar(
    headerPanel('Min. working example - write a csv based on user input'),

    sidebarPanel(
      selectInput("filter1", "First selection:" 
                  , choices = c(Choose='', "A", "B")
                  #, multiple=T
                  ),
      
      selectInput("filter2", "Second selection:", 
                  choices = c(Choose='', "C", "D")
                  ),
      br(),
      p("Include actionButton to prevent write occuring before user finalises selection"),  
      actionButton("generateButton","Write Data")    
    ),
    mainPanel()
  )
)