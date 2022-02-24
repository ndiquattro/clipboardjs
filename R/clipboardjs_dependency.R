# Define dependencies for using clipboard.js
clipboardjs_dependency <- function() {
  list(
    htmltools::htmlDependency(
      name    = "clipboard.js",
      version = "2.0.10",
      src = list(file = system.file("clipboard-js-2.0.10", package = "clipboardjs")),
      script = "clipboard.min.js"
    ),
    htmltools::htmlDependency(
      name    = "clipboardjs.js",
      version = utils::packageVersion("clipboardjs"),
      src = list(file = system.file("js", package = "clipboardjs")),
      script = "setup.js"
    )
  )
}
