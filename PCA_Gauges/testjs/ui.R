library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("New Application"),
  sidebarPanel(
    sliderInput("obs",
                "Number of observations:",
                min = 1,
                max = 1000,
                value = 500)
  ),
  mainPanel(
    plotOutput("distPlot"),
    tags$head(tags$script(src="hoge.js"))
  )
))
