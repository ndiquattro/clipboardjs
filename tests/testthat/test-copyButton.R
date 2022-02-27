test_that("copy button has correct setup attributes", {
  cbtn <- copyButton("test", target_id = "test2")
  tag  <- cbtn[[1]]
  deps <- cbtn[[2]]

  expect_true(grepl("clippyjs", tagGetAttribute(tag, "class")))
  expect_equal(tagGetAttribute(tag, "id"), "test")
  expect_equal(deps[[1]]$name, "clipboard.js")
  expect_equal(deps[[2]]$name, "clipboardjs.js")
})

test_that("target_id is set correctly", {
  cbtn <- copyButton("test", target_id = "test2")
  tag  <- cbtn[[1]]

  expect_equal(tagGetAttribute(tag, "data-clipboard-target"), "#test2")
  expect_false(tagHasAttribute(tag, "data-clipboard-text"))
})

test_that("text is set correctly", {
  cbtn <- copyButton("test", text = "set value")
  tag  <- cbtn[[1]]

  expect_equal(tagGetAttribute(tag, "data-clipboard-text"), "set value")
  expect_false(tagHasAttribute(tag, "data-clipboard-target"))
  expect_false(tagHasAttribute(tag, "data-clipboard-action"))
})

test_that("cut is set correctly", {
  cbtn <- copyButton("test", text = "set value", cut = TRUE)
  tag  <- cbtn[[1]]

  expect_equal(tagGetAttribute(tag, "data-clipboard-action"), "cut")
})
