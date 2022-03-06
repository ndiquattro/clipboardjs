test_that("updateCopyText works", {
  demo_app <- system.file("demo.R", package = "clipboardjs")
  app      <- shinytest::ShinyDriver$new(demo_app)

  btn_html <- app$findWidget("cp3")$getHtml()

  app$waitForShiny()

  expect_snapshot(btn_html)
})
