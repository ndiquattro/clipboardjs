% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/withCopy.R
\name{withCopy}
\alias{withCopy}
\title{withCopy}
\usage{
withCopy(x, target_id = NULL, text = NULL, cut = FALSE)
}
\arguments{
\item{x}{\code{actionButton} or \code{actionLink}.}

\item{target_id}{The id of the UI output to copy.}

\item{text}{Value to copy to the clipboard when the button is clicked.}

\item{cut}{Cut text to clipboard.}
}
\value{
Updated button or link.
}
\description{
Enable a predefined button or link to interact with the clipboard.
}
\examples{
if (interactive()) {
  ui <- fluidPage(
    textOutput("test_text"),

    # Copy other output
    withCopy(actionLink("copyb1",   "Copy", icon = icon("clipboard")), target_id = "test_text"),
    withCopy(actionButton("copyb2", "Copy", icon = icon("clipboard")), text = "copy copy me"),
  )

  server <- function(input, output, session) {
    output$test_text <- renderText("The text we are to copy!")
  }

  shinyApp(ui, server)
}
}
