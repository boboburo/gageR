#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
justgageR <- function( width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'justgageR',
    x,
    width = width,
    height = height,
    package = 'justgageR'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
justgageROutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'justgageR', width, height, package = 'justgageR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderJustgageR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, justgageROutput, env, quoted = TRUE)
}
