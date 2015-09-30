#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
gageR <- function(value=NULL, title=NULL,width = NULL, height = NULL,min=NULL,max=NULL) {

  # forward options using x
  x = list(
    value = value,
    title = title,
    max = max,
    min = min
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'gageR',
    x,
    width = width,
    height = height,
    package = 'gageR'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
gageROutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'gageR', width, height, package = 'gageR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderGageR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, gageROutput, env, quoted = TRUE)
}
