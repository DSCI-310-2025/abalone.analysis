test_that("`build_model` should throw an error when incorrect types are passed
          to the `training` argument", {
            expect_error(build_model(func = age ~ diameter + height + shell_weight,
                                     training =training_list))
          })

test_that("`build_model` should throw an error when the training data is missing
          a column that is expected", {
            expect_error(build_model(func = age ~ diameter + height + shell_weight,
                                     training = training_data_missing_column))
          })

test_that("`build_model` produces a `list` object with a length of 4 as the output", {
  expect_type(build_model(func = age ~ diameter + height + shell_weight,
                          training = training_data_correct_format), "list")
  expect_length(build_model(func = age ~ diameter + height + shell_weight,
                            training = training_data_correct_format), 4)
})
