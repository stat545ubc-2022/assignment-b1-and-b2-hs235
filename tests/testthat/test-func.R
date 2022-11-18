library(tidyverse)

test_that("Invalid data type error", {
  expect_error(summarize_by_group_mean(list(1,2),c(1)))
})

test_that("Invalid group by index error", {
  expect_error(summarize_by_group_mean(tibble(1,2),c(0)))
})

test_that("Empty group by index error", {
  expect_error(summarize_by_group_mean(tibble(1,2),c()))
})

test_that("Expect the mean to equal 3 for all data vales = 3 grouped by first index", {
  expect_equivalent(summarize_by_group_mean(tibble(c(1,1),3),c(1)), tibble(c(1),c(3)))
})

test_that("Test mean removes NA values in summarized column ", {
  expect_equivalent(summarize_by_group_mean(tibble(c(1,1,2),c(3,NA,5)),c(1)), tibble(c(1,2),c(3,5)))
})