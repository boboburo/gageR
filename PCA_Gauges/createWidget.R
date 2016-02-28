install.packages("devtools")
install.packages("htmlwidgets")

setwd("~/Desktop/GitProject/PCA_Gauges")
devtools::create("justgageR")               # create package using devtools
setwd("~/Desktop/GitProject/PCA_Gauges/justgageR")                        # navigate to package dir
htmlwidgets::scaffoldWidget("justgageR",bowerPkg="justgage")    # create widget scaffolding
devtools::install()

setwd("~/Desktop/GitProject/PCA_Gauges")

library(justgageR)
justgageR("hsfd")

