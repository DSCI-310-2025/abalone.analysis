
<!-- README.md is generated from README.Rmd. Please edit that file -->

# abalone.analysis

<!-- badges: start -->

[![codecov](https://codecov.io/gh/emmaw20/abalone.analysis/branch/main/graph/badge.svg)](https://codecov.io/gh/emmaw20/abalone.analysis)
[![R-CMD-check](https://github.com/DSCI-310-2025/abalone.analysis/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DSCI-310-2025/abalone.analysis/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of abalone.analysis is to provide tools for downloading,
cleaning, and analyzing the Abalone dataset. This package includes
functions to:

- Download and preprocess the Abalone dataset from the UCI Machine
  Learning Repository.
- Clean the dataset by reversing scaling, creating a new target variable
  (`age`), and removing unnecessary columns.
- Split the data into training and testing sets for machine learning
  workflows.

This package is designed to streamline the process of preparing the
Abalone dataset for analysis and modeling.

## Installation

You can install the development version of abalone.analysis from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("DSCI-310-2025/abalone.analysis")
```

### Where This Package Fits in the R Ecosystem

The `abalone.analysis` package is designed specifically for working with
the Abalone dataset, providing a streamlined workflow for data
preprocessing and preparation. While there are many general-purpose data
manipulation and machine learning packages in R, such as `dplyr`,
`tidyr`, and `caret`, this package focuses on simplifying the process
for this specific dataset.

Similar Packages - `dplyr` and `tidyr`: These packages are excellent for
general-purpose data manipulation and cleaning. However, they require
users to write custom code for tasks like reversing scaling or creating
new target variables. `abalone.analysis` provides these functionalities
out of the box for the Abalone dataset. - `caret` and `tidymodels`:
These packages are widely used for machine learning workflows, including
data splitting and model training. While `abalone.analysis`- does not
replace these packages, it complements them by preparing the Abalone
dataset specifically for use in such workflows.

How `abalone.analysis` Differs: The key difference is that
abalone.analysis is purpose-built for the Abalone dataset, offering a
tailored set of tools to handle common preprocessing tasks. This reduces
the need for users to write repetitive code and ensures consistency in
data preparation, making it easier to focus on analysis and modeling.

By combining dataset-specific preprocessing with compatibility for
broader R workflows, `abalone.analysis` fills a niche for users working
with the Abalone dataset in R.
