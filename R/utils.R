validate_target <- function(x) {
  if (is.null(x)) {
    return(NULL)
  }

  paste0("#", x)
}

check_args <- function(target, text) {
  if (!is.null(target) & !is.null(text)) {
    stop("Only define target OR text.")
  }

  if (is.null(target) & is.null(text)) {
    stop("You must define target OR text.")
  }
}
