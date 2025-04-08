#' Create a linear regression model
#'
#' Creates a linear regression model using the training data, based on the diameter,
#' height, and shell weight of the abalone. Returns a fitted linear regression model
#'
#' @param func The function for the model to analyze (not as a string)
#' @param training The training data for the function
#'
#' @return A fitted linear regression model
#' @export
#'
#' @examples
#' build_model(func = age ~ diameter + height + shell_weight, training = abalone_training)
build_model <- function(func = "function for the model to analyze", training = "training data for the model") {
  spec <- parsnip::linear_reg() |>
    parsnip::set_engine("lm") |>
    parsnip::set_mode("regression")

  recipe <- recipes::recipe(func, data = training)

  modelfit <- workflows::workflow() |>
    workflows::add_recipe(recipe) |>
    workflows::add_model(spec) |>
    parsnip::fit(data = training)

  modelfit
}
