library(shiny)
library(datasets)
library(ggplot2)

function(input, output) {
  output$plot_by_region <- renderPlot({
    data <- WorldPhones[, input$by_region] * 1000
    data <- data.frame(
      data,
      year = as.numeric(names(data))
    )
    
    ggplot(data, aes(x = year, y = data)) + xlab("Year") +ylab("Number of phones") + 
      geom_bar(stat = "identity") + 
      geom_smooth(method = "lm")
  })
  
  output$plot_by_year <- renderPlot({
    data <- WorldPhones[input$by_year, ] * 1000
    data <- data.frame(
      data,
      region = names(data)
    )
    
    ggplot(data, aes(x = reorder(region, data), y = data)) + xlab("Region") +ylab("Number of phones") +
      geom_bar(stat = "identity")
  })
}
