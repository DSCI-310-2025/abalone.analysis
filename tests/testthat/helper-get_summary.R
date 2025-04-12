# test input data
all_numeric_df <- tibble::tibble(
  age = c(5, 10, 15, 20),
  shell_weight = c(0.1, 0.2, 0.3, 0.4),
  diameter = c(0.5, 0.6, 0.7, 0.8),
  height = c(0.05, 0.06, 0.07, 0.08)
)

mixed_df <- tibble::tibble(
  age = c(5, 10, 15, 20),
  shell_weight = c(0.1, 0.2, 0.3, 0.4),
  category = c("A", "B", "A", "B")
)

one_col_numeric_df <- tibble::tibble(
  age = c(5, 10, 15, 20)
)

empty_df <- tibble::tibble(
  age = numeric(0),
  shell_weight = numeric(0),
  diameter = numeric(0),
  height = numeric(0)
)

all_non_numeric_df <- tibble::tibble(
  category = c("A", "B", "C", "D"),
  label = c("X", "Y", "Z", "W")
)

all_numeric_df_output <- tibble::tibble(
  variable = c("age", "diameter", "height", "shell_weight"),
  mean = c(12.5, 0.65, 0.065, 0.25),
  median = c(12.5, 0.65, 0.065,  0.25),
  variance = c(41.7, 0.0167, 0.0002, 0.0167),
  minimum = c(5, 0.5, 0.05,  0.1),
  maximum = c(20, 0.8, 0.08,  0.4)
)

mixed_df_output <- tibble::tibble(
  variable = c("age", "shell_weight"),
  mean = c(12.5, 0.25),
  median = c(12.5, 0.25),
  variance = c(41.67, 0.01667),
  minimum = c(5, 0.1),
  maximum = c(20, 0.4)
)

one_col_numeric_df_output <- tibble::tibble(
  variable = c("age"),
  mean = c(12.5),
  median = c(12.5),
  variance = c(41.7),
  minimum = c(5),
  maximum = c(20)
)


empty_df_output <- tibble::tibble(
  variable = character(0),
  mean = numeric(0),
  median = numeric(0),
  variance = numeric(0),
  minimum = numeric(0),
  maximum = numeric(0)
)
