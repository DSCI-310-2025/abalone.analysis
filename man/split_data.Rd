% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_data.R
\name{split_data}
\alias{split_data}
\title{Creates the training and testing sets with a 70/30 train/test split using age for stratification.}
\usage{
split_data(
  clean_data = "data that has already been passed through the `clean_data` function"
)
}
\arguments{
\item{clean_data}{clean data that is ready to be split into training and testing (used clean_data)}
}
\value{
assigned training and testing sets to variables, returned as a list
}
\description{
Creates the training and testing sets with a 70/30 train/test split using age for stratification.
}
\examples{
x <- data.frame(length = c(1:100),
                diameter = c(1:100),
                height = c(1:100),
                whole_weight = c(1:100),
                shucked_weight = c(1:100),
                viscera_weight = c(1:100),
                shell_weight = c(1:100),
                age = sample(1:20, 100, replace = TRUE))
split_data(x)
}
