test_that("withCopy hascorrect setup attributes", {
  abtn <- shiny::actionButton("test", "test button")

  cbtn <- withCopy(abtn, target_id = "test_copy")
  tag  <- cbtn[[1]]
  deps <- cbtn[[2]]

  expect_true(grepl("clippyjs", tagGetAttribute(tag, "class")))
  expect_equal(tagGetAttribute(tag, "id"), "test")
  expect_equal(deps[[1]]$name, "clipboard.js")
  expect_equal(deps[[2]]$name, "clipboardjs.js")
})

test_that("target_id is set correctly", {
  abtn <- shiny::actionButton("test", "test button")

  cbtn <- withCopy(abtn, target_id = "test2")
  tag  <- cbtn[[1]]

  expect_equal(tagGetAttribute(tag, "data-clipboard-target"), "#test2")
  expect_false(tagHasAttribute(tag, "data-clipboard-text"))
})

test_that("text is set correctly", {
  abtn <- shiny::actionButton("test", "test button")

  cbtn <- withCopy(abtn, text = "set value")
  tag  <- cbtn[[1]]

  expect_equal(tagGetAttribute(tag, "data-clipboard-text"), "set value")
  expect_false(tagHasAttribute(tag, "data-clipboard-target"))
  expect_false(tagHasAttribute(tag, "data-clipboard-action"))
})

test_that("cut is set correctly", {
  abtn <- shiny::actionButton("test", "test button")

  cbtn <- withCopy(abtn, target_id = "test2", cut = TRUE)
  tag  <- cbtn[[1]]

  expect_equal(tagGetAttribute(tag, "data-clipboard-action"), "cut")
})
