test_that("updateCopyText works", {
  demo_app <- system.file("demo.R", package = "clipboardjs")
  app      <- shinytest::ShinyDriver$new(demo_app)

  btn_html <- app$findWidget("cp3")$getHtml()

  expect_match(btn_html, "data-clipboard-text=\"This has been updated from the server.\"")
})
