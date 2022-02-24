copyButton <- function(id, target_id = NULL, text = NULL, label = "Copy", ...) {
  check_args(target_id, text)

  btn <-
    shiny::actionButton(
      inputId = id,
      label = label,
      `data-clipboard-target`= validate_target(target_id),
      `data-clipboard-text`= text,
      class = "clippyjs",
      ...
    )

  htmltools::tagList(btn, clipboardjs_dependency())
}
