#' Make R objects pasteable
#'
#' @param x A `data.frame` or `list`.
#' @param target Where you will paste the content.
#'
#' @return A length 1 character vector.
#' @export
#'
#' @examples
#' # Meaningful row names are kept
#' pasteable(mtcars)
#'
#' # Row names that are a sequence are dropped
#' pasteable(iris)
#'
#' # Fixed width output for sharing on slack or other markdown destination
#' pasteable(mtcars, target = "chat")
pasteable <- function(x, target = c("sheet", "chat")) {
  UseMethod("pasteable", x)
}

#' @export
pasteable.data.frame <- function(x, target = c("sheet", "chat")) {
  target <- match.arg(target)
  switch(target,
    "sheet" = df_to_sheet(x),
    "chat"  = df_to_chat(x)
  )
}

df_to_sheet <- function(x) {
  keep_row_names <- !identical(row.names(x), as.character(seq_len(nrow(x))))

  if (keep_row_names) {
    x <- cbind(row_names = row.names(x), x)
  }

  x <- capture.output(
    write.table(x, sep = "\t", row.names = FALSE, quote = FALSE)
  )

  paste(x, collapse = "\n")
}

df_to_chat <- function(x) {
  x <- capture.output(print(x))

  paste(x, collapse = "\n")
}

