updateCopyText <- function(id, text, session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    "copy-value",
    list(
      id   = session$ns(id),
      text = text
    )
  )
}
