#### Preamble ####
# Purpose: Dana manipulations to create error 
# Author: Xu Qi
# Date: 25 February 2024
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

# Set Seed
set.seed(1212) 

# Generate the original dataset
original_dataset <- rnorm(1000, mean = 1, sd = 1)

# Simulate the error: Overwrite the last 100 observations with the first 100
original_dataset[901:1000] <- original_dataset[1:100]

# Change half of the negative values to positive
neg_indices <- which(original_dataset < 0)
selected_indices <- sample(neg_indices, floor(length(neg_indices) / 2))
original_dataset[selected_indices] <- -original_dataset[selected_indices]

# Change decimal place for values between 1 and 1.1
decimal_adjust_indices <- which(original_dataset >= 1 & original_dataset <= 1.1)
original_dataset[decimal_adjust_indices] <- original_dataset[decimal_adjust_indices] / 10

# Compute the mean of the "cleaned" dataset
mean_cleaned_data <- mean(original_dataset)
mean_cleaned_data

# T-test to test if the mean is greater than 0
t_test_result <- t.test(original_dataset, mu = 0, alternative = "greater")
t_test_result
