test_that("clean data is returned unscaled with new target and removed columns", {
  cleaned_data <- clean_data(data_raw)

  comparison_result <- all.equal(cleaned_data, data_with_age)
  print(comparison_result)

  expect_s3_class(cleaned_data, "data.frame")

  expect_true(isTRUE(comparison_result))
})

test_that("input data has the right column names",{
  expect_error(clean_data(incorrect_names))
})

test_that("input data has the right number of columns", {
  expect_error(clean_names(incorrect_num_cols))
})

test_that("split_data splits the clean data correctly", {
  splits <- split_data(data_with_age_100)

  # Test that the function returns a list with train and test in the names
  expect_true(is.list(splits))
  expect_true("train" %in% names(splits))
  expect_true("test" %in% names(splits))

  # Check the total number of rows in the train and test sets
  expect_equal(nrow(splits$train) + nrow(splits$test), nrow(data_with_age_100))

  # Allow for a larger rounding error (e.g., 5% difference)
  expected_train_size <- floor(0.7 * nrow(data_with_age_100))
  expect_true(abs(nrow(splits$train) - expected_train_size) <= expected_train_size * 0.05)  # 5% margin of error

  # Optionally: Check that the train/test sets are non-empty
  expect_gt(nrow(splits$train), 0)
  expect_gt(nrow(splits$test), 0)
})
