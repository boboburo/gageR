# Get latest version of httpuv (needed for devel version of Shiny)
install.packages("httpuv")

# If necessary, install devtools
# install.packages("devtools")

# Install shiny-gridster package
devtools::install_github("shiny-gridster", "wch")

# Install the latest development version of shiny
devtools::install_github("shiny", "rstudio")


library(shiny)
runGitHub("shiny-jsdemo", "wch")
