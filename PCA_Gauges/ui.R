library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
	
	# Application title
	titlePanel("Hello Shiny!"),
	
	# Sidebar with a slider input for the number of bins
	sidebarLayout(
		sidebarPanel(
			sliderInput("splits",
									"Number of splits:",
									min = 2,
									max = 14,
									value = 4),
			sliderInput("gauge",
									"Value of Gauge",
									min=1139,
									max=1475,
									value=1300)
		),
		
		# Show a plot of the generated distribution
		mainPanel(
			plotOutput("distPlot")
		)
	)
))

