#' withCopy
#'
#' Enable a predefined button or link to interact with the clipboard.
#'
#' @param x `actionButton` or `actionLink`.
#' @param target_id The id of the UI output to copy.
#' @param text Value to copy to the clipboard when the button is clicked.
#' @param cut Cut text to clipboard.
#'
#' @return Updated button or link.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     textOutput("test_text"),
#'
#'     # Copy other output
#'     withCopy(actionLink("copyb1",   "Copy", icon = icon("clipboard")), target_id = "test_text"),
#'     withCopy(actionButton("copyb2", "Copy", icon = icon("clipboard")), text = "copy copy me"),
#'   )
#'
#'   server <- function(input, output, session) {
#'     output$test_text <- renderText("The text we are to copy!")
#'   }
#'
#'   shinyApp(ui, server)
#' }
withCopy <- function(x, target_id = NULL, text = NULL, cut = FALSE) {
  check_args(target_id, text)

  cut <- if (isTRUE(cut)) "cut" else NULL

  out <-
    htmltools::tagAppendAttributes(
    tag = x,
    class = "clippyjs",
    `data-clipboard-target`= validate_target(target_id),
    `data-clipboard-text`= text,
    `data-clipboard-action` = cut
  )

  htmltools::tagList(out, clipboardjs_dependency())
}
