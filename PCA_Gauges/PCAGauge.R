#http://stackoverflow.com/questions/24900903/how-to-draw-gauge-chart-in-r
library(ggplot2)

rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100
rescale2 <- function(x,y) round((((x-min(y)) / (max(y)-min(y)))*100),0)

#http://stackoverflow.com/questions/13353213/gradient-of-n-colors-ranging-from-color-1-and-color-2


colfunc <- colorRampPalette(c("#B6DFFF","#02B7FF"))
library(grDevices)
colfunc2<- heat.colors(25,alpha=1)


get.poly <- function(a,b,r1=0.5,r2=1.0) {
	th.start <- pi*(1-a/100)
	th.end   <- pi*(1-b/100)
	th       <- seq(th.start,th.end,length=100)
	x        <- c(r1*cos(th),rev(r2*cos(th)))
	y        <- c(r1*sin(th),rev(r2*sin(th)))
	return(data.frame(x,y))
}


gg.gauge2 <- function(thevar) {
	require(ggplot2)
	require(RColorBrewer)
	
	unScaled<-thevar
	breaks<-rescale(unScaled)
	colors<-colfunc(length(breaks)-1)
	#colors<-colfunc
	
	p<-ggplot()

	for(i in 2:length(breaks)){
		p<-p+geom_polygon(data=get.poly(breaks[i-1],breaks[i]),aes(x,y),fill=colors[i-1])
	}
	
	#Add the text
	p<-p+geom_text(data=data.frame(breaks,unScaled), size=5, fontface="bold", vjust=0,
						aes(x=1.1*cos(pi*(1-breaks/100)),y=1.1*sin(pi*(1-breaks/100)),label=round(unScaled,0)))
	
	p<-p + theme_bw() + 
		theme(axis.text=element_blank(),
					axis.title=element_blank(),
					axis.ticks=element_blank(),
					panel.grid=element_blank(),
					panel.border=element_blank())
	
			return(p)
}
		



#a<-quantile(1139:1475,probs=seq(0,1,.0714),na.rm=T)
#p<-gg.gauge2(a)
#p

#pos1=1300
#pos=round((pos1/1475)*100,0)



#pos1=1374
#pos=rescale2(pos1,1139:1475)

#p+geom_polygon(data=get.poly(pos-1,pos+1,0.2),aes(x,y))+
#	annotate("text",x=0,y=0,label=pos1,vjust=0,size=8,fontface="bold")
	
