source("PCAGauge.R")
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
	
	# Expression that generates a histogram. The expression is
	# wrapped in a call to renderPlot to indicate that:
	#
	#  1) It is "reactive" and therefore should re-execute automatically
	#     when inputs change
	#  2) Its output type is a plot
	
	#chunk<-reactive({round(100/input$splits,2)})
	
	
	output$distPlot <- renderPlot({
		
		a<-quantile(1139:1475,probs=seq(0,1,1/input$splits))
		p<-gg.gauge2(a)
		#x    <- faithful[, 2]  # Old Faithful Geyser data
		#bins <- seq(min(x), max(x), length.out = input$bins + 1)
		
		pos1=input$gauge
		pos=rescale2(pos1,1139:1475)
		
		p<-p+geom_polygon(data=get.poly(pos-10,pos+10,0.2),aes(x,y),alpha=0.5)+
			annotate("text",x=0,y=0,label=pos1,vjust=0,size=8,fontface="bold")
		
		
		
		return(p)
		
		# draw the histogram with the specified number of bins
		#hist(x, breaks = bins, col = 'darkgray', border = 'white')
	})
})