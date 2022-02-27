test_that("check args catches errors", {
  expect_error(check_args(NULL, NULL))
  expect_error(check_args("test1", "set value"))
})
