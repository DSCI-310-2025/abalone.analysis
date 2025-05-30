# Test that `download_data` returns a data frame with correct column names
test_that("`download_data` downloads and reads the dataset correctly", {
  data_file <- download_data(valid_url)
  expect_s3_class(data_file, "data.frame")
  expect_equal(colnames(data_file), c("sex",
                                      "length",
                                      "diameter",
                                      "height",
                                      "whole_weight",
                                      "shucked_weight",
                                      "viscera_weight",
                                      "shell_weight",
                                      "rings"))
})

# Test that `download_data` throws an error when an invalid URL is passed
test_that("`download_data` throws an error when an invalid URL is provided", {
  # fixing error described in the peer feedback
  expect_warning(expect_error(download_data(invalid_url),
                              regexp = "cannot open URL|cannot open the connection"),
                 regexp = "cannot open zip file")
})

# Test that `download_data` produces a data frame
test_that("`download_data` returns a data frame as output", {
  data_file <- download_data(valid_url)
  expect_true(is.data.frame(data_file))
})

# Test that the number of columns is correct
test_that("`download_data` returns a data frame with 9 columns", {
  data_file <- download_data(valid_url)
  expect_equal(ncol(data_file), 9)
})
