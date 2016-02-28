library(devtools)
library(htmltools)
library(htmlwidgets)
#install_github('htmlwidgets/knob')

library(knob)

knob(value = 20, min = 0, max = 100, 
     angleArc = 180, angleOffset = -90, 
     fgColor = "#66CC66",cursor=TRUE)


library(shiny)
library(knob)

ui = shinyUI(fluidPage(
  sliderInput('value', 'Value', 0, 100, 50),
  #sliderInput('angleArc', 'Arc Angle', 180, 180, 180),
  knobOutput('gauge',width=200,height=200)
))

server = function(input, output){
  output$gauge <- renderKnob(knob(
    value = input$value,
    min = 0,
    max = 100,
    angleArc = 180,
    angleOffset = -90, 
    fgColor="#222222",
    cursor=10,
    displayPrevious=TRUE,
    displayInput=TRUE,
    inputColor = '#FF3399',
    bgColor = '#00FFFF',
    skin="tron",
    thickness=.2.
  ))
}

shinyApp(ui = ui, server = server)
