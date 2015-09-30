# gageR

This is a first attempt at creating a custom htmlwidget using the framework from htmlwidgets 
package http://www.htmlwidgets.org/develop_intro.html

##JustGage 
The purpose is to create an R package that binds to the http://justgage.com javascript library for creating gages.

###

Using the "justgage-toorshia" argument for the bowerPkg argumnent caused initial error. 

htmlwidgets::scaffoldWidget("gageR",bowerPkg="justgage-toorshia")

Therefore an AngularJS directive for the JustGage (http://justgage.com/) gauge was used instead. 
https://github.com/frapontillo/angular-gage

htmlwidgets::scaffoldWidget("gageR",bowerPkg="angular-gage")


#Original Setup in R

library(htmlwidgets)

library(devtools)

devtools::create("gageR")         
setwd("gageR")                        
htmlwidgets::scaffoldWidget("gageR",bowerPkg="angular-gage")    
devtools::install()

library(gageR)

gageR("hello, world")

#To Do

R Bindings in R/gageR.R

Javascript Bindings in inst/htmlwidgets/gageR.js 

