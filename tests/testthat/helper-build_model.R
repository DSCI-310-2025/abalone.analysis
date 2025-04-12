training_list <- c(1:40)
training_data_correct_format <- data.frame(age = c(1:10),
                                           diameter = c(1:10),
                                           height = c(1:10),
                                           shell_weight = c(1:10))

training_data_missing_column <- data.frame(age = c(1:10), 
                                           diameter = c(1:10),
                                           height = c(1:10))