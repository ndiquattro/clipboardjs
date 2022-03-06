tlist <- list(123, "abc", cool = "R")

test_that("data.frame sheets output is correct", {

  expect_snapshot_output(pasteable(mtcars))
})

test_that("list sheets output is correct", {

  expect_snapshot_output(pasteable(tlist, target = "sheet"))
})

test_that("data.frame chat output is correct", {

  expect_snapshot_output(pasteable(mtcars, target = "chat"))
})

test_that("list chat output is correct", {

  expect_snapshot_output(pasteable(tlist, target = "chat"))
})

test_that("meangingless row numbers are dropped", {

  expect_snapshot_output(pasteable(iris))
})
