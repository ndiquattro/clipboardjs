withCopy <- function(x, target = NULL, text = NULL) {
  check_args(target, text)

  out <-
    htmltools::tagAppendAttributes(
    tag = x,
    class = "clippyjs",
    `data-clipboard-target`= validate_target(target),
    `data-clipboard-text`= text
  )

  htmltools::tagList(out, clipboardjs_dependency())
}
