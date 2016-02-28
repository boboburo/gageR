library(shiny)

# Define server logic required to respond to d3 requests
shinyServer(function(input, output) {
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$d3io <- reactive(function() {
    if (is.null(input$d3io)) {
      0;
    } else {
      list(rnorm(1)*400+200,rnorm(1)*400+200);
    }
  })
})