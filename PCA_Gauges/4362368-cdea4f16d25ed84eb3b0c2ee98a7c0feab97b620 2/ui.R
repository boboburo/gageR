library(shiny)

d3IO <- function(inputoutputID) {
  div(id=inputoutputID,class=inputoutputID,tag("svg",""));
}

# Define UI for shiny d3 chatter application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("D3 Javascript chatter",
              "Demo of how to create D3 I/O and cumulative data transfer"),
  
  sidebarPanel(
    tags$p("This widget is a demonstration of how to wire shiny direct to javascript, without any input elements."),
    tags$p("Each time a transition ends, the client asks the server for another packet of information, and adds it
            to the existing set"),
    tags$p("I can't claim this is likely to be idiomatic javascript, because I'm a novice, but it allows d3 apps
            to do progressive rendering.  In real use, a more complex request/response protocol will probably be
            required.  -AlexBBrown")
  ),
  
  mainPanel(
    includeHTML("d3widget.js"),
    d3IO("d3io")
    )
))