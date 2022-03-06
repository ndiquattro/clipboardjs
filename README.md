
# clipboardjs

<!-- badges: start -->
[![R-CMD-check](https://github.com/ndiquattro/clipboardjs/workflows/R-CMD-check/badge.svg)](https://github.com/ndiquattro/clipboardjs/actions)
[![Codecov test coverage](https://codecov.io/gh/ndiquattro/clipboardjs/branch/main/graph/badge.svg)](https://app.codecov.io/gh/ndiquattro/clipboardjs?branch=main)
<!-- badges: end -->

The goal of clipboardjs is to wrap [clipboard.js](https://clipboardjs.com) for easy use in Shiny.

## Installation

You can install the development version of clipboardjs like so:

``` r
# install.packages("remotes")
remotes::install_github("ndiquattro/clipboardjs")
```

## Example

Here's a demo of adding Copy buttons that copy the output of other UI elements to the user's clipboard;

``` r
library(shiny)
library(clipboardjs)

ui <- fluidPage(
  # Tests
  textOutput("tout"),
  textOutput("tout2"),
  textOutput("tout3"),

  # Add copying to action*
  withCopy(actionLink("copyb1", "Copy", icon = icon("clipboard")),   target = "tout"),
  withCopy(actionButton("copyb2", "Copy", icon = icon("clipboard")), target = "tout2"),

  # Quick Copy button
  copyButton("cp1", target_id = "tout3", icon = icon("clipboard")),

  # Define the text you want to copy
  copyButton("cp2", text = "This is the text you want!", label = "Copy Text"),

  # The value is changed server side
  copyButton("cp3", text = "You'll never see this!", label = "Copy from Server"),

  # Testing area
  textInput("text", label = "Input", placeholder = "Paste here to check")
)

server <- function(input, output, session) {
  output$tout   <- renderText("The first copy")
  output$tout2  <- renderText("Second copy")
  output$tout3  <- renderText("Third copy")

  # Server side copy
  updateCopyText("cp3", "This has been updated from the server.")

}

shinyApp(ui, server)
```

## Related work
* [rclipboard](https://github.com/sbihorel/rclipboard)
* [shinyCopy2clipboard](https://github.com/deepanshu88/shinyCopy2clipboard)
