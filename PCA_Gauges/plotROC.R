install.packages("plotROC")
library(plotROC)

install.packages("ggthemes")
shiny_plotROC()

install.packages("gridSVG")


D.ex <- rbinom(100, 1, .5)

rocdata <- calculate_roc(rnorm(100, mean = D.ex), D.ex)

myrocplot <- ggroc(rocdata, label = "Example")

cat(export_interactive_roc(myrocplot, font.size = "12px", prefix = "a"))

plot_interactive_roc(rocdata)

D.ex <- rbinom(100, 1, .5)

fakedata <- data.frame(M1 = rnorm(100, mean = D.ex), M2 = rnorm(100, mean = D.ex, sd = .4), M3 = runif(100), D = D.ex)
datalist <- calculate_multi_roc(fakedata, c("M1", "M2", "M3"), "D")

rocplot <- multi_ggroc(datalist)
plot_journal_roc(rocplot)
plot_interactive_roc(rocdata)
