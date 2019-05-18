library(shiny)
library(datasets)

fluidPage(    
  titlePanel("Telephones by region"),
  
  sidebarLayout(      
    sidebarPanel(
      selectInput(
        "by_region",
        "Select a region:", 
         choices = colnames(WorldPhones)
      ),
      ("Choose the 'Region' tab to view the number of phones per year for the selected region. The chart will also include alinear trend model."),

      hr(),

      selectInput(
        "by_year",
        "Select a year:", 
        choices = rownames(WorldPhones)
      ),
      
     ("Choose the 'Year' tab to view the number of phones per region for the selected year. The chart is sorted by the number of phones."),

      hr(),
      
      helpText("Data from AT&T (1961) The World's Telephones.")
    ),

    mainPanel(
      
      tabsetPanel(
        tabPanel("Region", plotOutput("plot_by_region")), 
        tabPanel("Year", plotOutput("plot_by_year"))
      )
    )
    
  )
)