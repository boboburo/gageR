install.packages("scatterD3")
library(scatterD3)

scatterD3(x = mtcars$wt, y = mtcars$mpg, lab = rownames(mtcars),
          col_var=mtcars$cyl, symbol_var = mtcars$am,
          xlab = "Weight", ylab = "Mpg", col_lab = "Cylinders",
          symbol_lab = "Manual transmission")

library(shiny)
runApp(shinyApp(
  ui=fluidPage(
    sidebarLayout(
      sidebarPanel(
        numericInput("scatterD3-size", "Labels size :", min = 2, max = 30, value = 10),
        numericInput("scatterD3-opacity", "Opacity :", min = 0, max = 1, value = 1, step=0.05),
        actionButton("scatterD3-resetzoom", "Reset Zoom"),
        tags$a(id="scatterD3-download", href="#", class="btn btn-default", "Download SVG")
      ),
      mainPanel(scatterD3Output("scatterPlot"))
    )
  ),
  server = function(input, output) {
    output$scatterPlot <- renderScatterD3({
      scatterD3(x=mtcars$wt,
                y=mtcars$mpg,
                lab=rownames(mtcars),
                col_var=mtcars$cyl)
    })
  }
))