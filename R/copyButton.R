#' Copy button
#'
#' Create a copy button that will copy the contents of a target UI element or a
#' provided value to the clipboard.
#'
#' To update the value that will be copied from the server see
#' [`updateCopyText()`].
#'
#' @param id The `inputId` for the underlying `actionButton`.
#' @param target_id The id of the UI output to copy.
#' @param text Value to copy to the clipboard when the button is clicked.
#' @param label Label of the button.
#' @param ... Other arguments passed to [`shiny::actionButton()`].
#'
#' @return An `actionButton` enabled to copy to clipboard.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     textOutput("test_text"),
#'
#'     # Copy other output
#'     copyButton("cp1", target_id = "test_text", icon = icon("clipboard")),
#'
#'     # Copy a set value
#'     copyButton("cp2", text = "This is the text you want!", label = "Copy Text")
#'   )
#'
#'   server <- function(input, output, session) {
#'     output$test_text <- renderText("The text we are to copy!")
#'   }
#'
#'   shinyApp(ui, server)
#' }
copyButton <- function(id, target_id = NULL, text = NULL, cut = FALSE,
                       label = "Copy", ...) {
  check_args(target_id, text)

  cut <- if (isTRUE(cut)) "cut" else NULL

  btn <-
    shiny::actionButton(
      inputId = id,
      label = label,
      `data-clipboard-target`= validate_target(target_id),
      `data-clipboard-text`= text,
      `data-clipboard-action` = cut,
      class = "clippyjs",
      ...
    )

  htmltools::tagList(btn, clipboardjs_dependency())
}
