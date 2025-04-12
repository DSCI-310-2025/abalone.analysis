#' Generate summary statistics table for numerical features
#'
#' Takes a dataset as input and calculates individual summary statistics
#' (mean, median, variance, minimum, and maximum) for all numeric columns
#' in a given dataset that has been reshaped from a wide format to a long
#' format
#'
#' @param dataset A dataset or dataset extension (e.g. a tibble).
#'
#' @return A data frame with 6 columns.
#'   The first column (named `variable`) lists the variables selected from
#'   the original dataset (`age`, `shell_weight`, `diameter`, `height`).
#'   The second column (named `mean`) contains the mean of the values for
#'   each variable.
#'   The third column (named `median`) contains the median of the values
#'   for each variable.
#'   The fourth column (named `variance`) contains the variance of the
#'   values for each variable.
#'   The fifth column (named `minimum`) contains the minimum value for
#'   each variable.
#'   The sixth column (named `maximum`) contains the maximum value for
#'   each variable.
#'   Each row corresponds to one of the variables selected from the
#'   original dataset
#' @export
#'
#' @examples
#' x <- data.frame(variable = c("age", "diameter", "height", "shell_weight"),
#'                         mean = c(12.5, 0.65, 0.065, 0.25),
#'                         median = c(12.5, 0.65, 0.065,  0.25),
#'                         variance = c(41.7, 0.0167, 0.0002, 0.0167),
#'                         minimum = c(5, 0.5, 0.05,  0.1),
#'                         maximum = c(20, 0.8, 0.08,  0.4))
#' get_summary(x)

get_summary <- function(dataset = "the dataset to clean") {

  # Check if the data frame is empty
  if (nrow(dataset) == 0) {
    return(tibble::tibble(
      variable = character(0),
      mean = numeric(0),
      median = numeric(0),
      variance = numeric(0),
      minimum = numeric(0),
      maximum = numeric(0)
    ))
  }

  # Select only numeric columns
  numeric_cols <- dataset |> dplyr::select(tidyselect::where(is.numeric))

  # Check if there are no numeric columns
  if (ncol(numeric_cols) == 0) {
    stop("No numeric columns found")
  }

  # Calculate summary statistics
  numeric_cols |>
    tidyr::pivot_longer(cols = dplyr::everything(), names_to = "variable", values_to = "values") |>
    dplyr::group_by(variable) |>
    dplyr::summarize(
      mean = round(mean(values, na.rm = TRUE), 4),
      median = round(stats::median(values, na.rm = TRUE), 4),
      variance = round(stats::var(values, na.rm = TRUE), 4),
      minimum = round(min(values, na.rm = TRUE), 4),
      maximum = round(max(values, na.rm = TRUE), 4)
    )
}
