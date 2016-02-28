install.packages("shiny")


library(shiny)
library(knob)
library(ggplot2)


ui <- fluidPage(
  # Some custom CSS for a smaller font for preformatted text
  tags$head(
    tags$style(HTML("
                    pre, table.table {
                    font-size: smaller;
                    }
                    "))
    ),
  
  fluidRow(
     column(width = 4,
           # In a plotOutput, passing values for click, dblclick, hover, or brush
           # will enable those interactions.
           plotOutput("plot1", height = 350,
                      # Equivalent to: click = clickOpts(id = "plot_click")
                       brush = brushOpts(
                        id = "plot_brush1"
                      )
           )
    ),
    column(width = 4,
           knobOutput('gauge',width=150,height=150))
  ),
  fluidRow(
    column(width = 12,
           verbatimTextOutput("brush_info2")
       
           
    )
  )
    )


server <- function(input, output) {
  output$plot1 <- renderPlot({
          ggplot(mtcars, aes(wt, mpg)) + geom_point()
    })
  
  output$brush_info1 <- renderPrint({
    cat("input$plot_brush1:\n")
    str(input$plot_brush1)
  })
  
  output$brush_info2 <- renderPrint({
    brushedPoints(mtcars,input$plot_brush1)
  })
  
  #brushedPoints(mtcars,input$plot_brush1)$wt
  
  
  output$gauge <- renderKnob(knob(
    value = mean(brushedPoints(mtcars,input$plot_brush1)$wt),
    min = min(mtcars$wt),
    max = max(mtcars$wt),
    angleArc = 180,
    angleOffset = -90, 
    fgColor="#222222",
    cursor=10,
    displayInput=TRUE,
    inputColor = '#FF3399',
    bgColor = '#00FFFF',
    skin="tron",
    thickness=.2
  ))
  
}


shinyApp(ui, server)
