#' updateCopyText
#'
#' Change the text a button will copy to the clipboard from the server.
#'
#' @param id The id of the button.
#' @param text Value to copy to the clipboard when the button is clicked.
#' @param session The session object passed to function given to shinyServer.
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     # Copy a set value
#'     copyButton("cp2", text = "The client side text", label = "Copy Text")
#'   )
#'
#'   server <- function(input, output, session) {
#'     updateCopyText("cp2", text = "The new server side text!")
#'   }
#'
#'   shinyApp(ui, server)
#' }
updateCopyText <- function(id, text, session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    "copy-value",
    list(
      id   = session$ns(id),
      text = text
    )
  )
}
