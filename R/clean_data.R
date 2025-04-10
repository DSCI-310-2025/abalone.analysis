#' Clean the `abalone_data` by reversing the scaling,
#' creating a new age target variable, (age = rings + 1.5)
#' removing the old target variable (rings)
#' and removing an unnecessary categorical variable (sex).

#' @param data_frame Abalone dataframe with scaled values and the following columns:
#'                  sex, length, diameter, height, whole_weight, shucked_weight, shell_weight, rings
#'
#' @return a data_frame with reversed scaling, new target variable (age), removed columns (rings and sex)
#' @export
#'
#' @examples
#' x <- data.frame(length = c(1:10),
#'                 diameter = c(1:10),
#'                 height = c(1:10),
#'                 whole_weight = c(1:10),
#'                 shucked_weight = c(1:10),
#'                 viscera_weight = c(1:10),
#'                 shell_weight = c(1:10),
#'                 sex = c("M", "F", "M", "F","M", "F","M", "F", "M", "F"),
#'                 rings = c(1:10))
#' clean_data(data_frame = x)

clean_data <- function(data_frame = "the dataframe to be cleaned") {

  #returns clean data according to the above specifications

  abalone_data <- data_frame |>
    dplyr::mutate(
      length = data_frame$length * 200, # Reversing the scaling for readability purposes
      diameter = data_frame$diameter * 200,
      height = data_frame$height * 200,
      whole_weight = data_frame$whole_weight * 200,
      shucked_weight = data_frame$shucked_weight * 200,
      viscera_weight = data_frame$viscera_weight * 200,
      shell_weight = data_frame$shell_weight * 200,
      age = data_frame$rings + 1.5 #  adding the age variable
    ) |>
    # Clean data - removing old target variable and removing unecessary categorical sex variable
    dplyr::select(-sex, -rings)

  return(abalone_data)
}


#' Creates the training and testing sets with a 70/30 train/test split using age for stratification.
#'
#' @param clean_data clean data that is ready to be split into training and testing (used clean_data)
#'
#' @return assigned training and testing sets to variables, returned as a list
#' @export
#'
#' @examples
#' x <- data.frame(length = c(1:100),
#'                 diameter = c(1:100),
#'                 height = c(1:100),
#'                 whole_weight = c(1:100),
#'                 shucked_weight = c(1:100),
#'                 viscera_weight = c(1:100),
#'                 shell_weight = c(1:100),
#'                 age = sample(1:20, 100, replace = TRUE))
#' split_data(x)

split_data <- function(clean_data = "data that has already been passed through the `clean_data` function") {

  # splits data into training and testing set

  set.seed(1234)
  abalone_split <- rsample::initial_split(clean_data, prop = 0.7, strata = age)

  # assigning to variables in global environment
  abalone_train <<- rsample::training(abalone_split)
  abalone_test <<- rsample::testing(abalone_split)

  return(list(train = abalone_train, test = abalone_test))
}
