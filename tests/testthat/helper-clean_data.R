set.seed(1234)

# Data for testing clean_data function
# Data with scaled values and no age column (raw data)
data_raw <- data.frame(length = c(1:10),
                       diameter = c(1:10),
                       height = c(1:10),
                       whole_weight = c(1:10),
                       shucked_weight = c(1:10),
                       viscera_weight = c(1:10),
                       shell_weight = c(1:10),
                       sex = c("M", "F", "M", "F","M", "F","M", "F", "M", "F"),
                       rings = c(1:10)
)

data_scaled <- data.frame(length = c(1:10),
                          diameter = c(1:10),
                          height = c(1:10),
                          whole_weight = c(1:10),
                          shucked_weight = c(1:10),
                          viscera_weight = c(1:10),
                          shell_weight = c(1:10),
                          sex = c("M", "F", "M", "F","M", "F","M", "F", "M", "F"),
                          rings = c(1:10)
)

incorrect_names <- data.frame(length = c(1:10),
                              sideways_length = c(1:10),
                              height = c(1:10),
                              total_weight = c(1:10),
                              num_rings = c(1:10),
                              shucked_weight = c(1:10),
                              viscera_weight = c(1:10),
                              sex = c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F"))

incorrect_num_cols <- data.frame(length = c(1:10),
                                 diameter = c(1:10),
                                 height = c(1:10),
                                 whole_weight = c(1:10),
                                 shucked_weight = c(1:10),
                                 viscera_weight = c(1:10),
                                 shell_weight = c(1:10),
                                 sex = c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F"))

# Clean data for tests
# Data with age column (new target variable)
data_with_age <- data.frame(length = data_scaled$length * 200,
                            diameter = data_scaled$diameter * 200,
                            height = data_scaled$height * 200,
                            whole_weight = data_scaled$whole_weight * 200,
                            shucked_weight = data_scaled$shucked_weight * 200,
                            viscera_weight = data_scaled$viscera_weight * 200,
                            shell_weight = data_scaled$shell_weight * 200,
                            age = data_scaled$rings + 1.5
)

# Testing data for data split function (larger for stratification to work during splitting)
data_raw_100 <- data.frame(length = c(1:100),
                           diameter = c(1:100),
                           height = c(1:100),
                           whole_weight = c(1:100),
                           shucked_weight = c(1:100),
                           viscera_weight = c(1:100),
                           shell_weight = c(1:100),
                           sex = sample(c("M", "F"), 100, replace = TRUE),
                           rings = sample(1:20, 100, replace = TRUE)
)

data_with_age_100 <- data.frame(length = data_raw_100$length * 200,
                                diameter = data_raw_100$diameter * 200,
                                height = data_raw_100$height * 200,
                                whole_weight = data_raw_100$whole_weight * 200,
                                shucked_weight = data_raw_100$shucked_weight * 200,
                                viscera_weight = data_raw_100$viscera_weight * 200,
                                shell_weight = data_raw_100$shell_weight * 200,
                                age = data_raw_100$rings + 1.5
)
