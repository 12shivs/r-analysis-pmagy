#3. To analyze the impact of PMAGY on education and health facilities in the selected villages.

# import packages
library(readxl)
library(dplyr)
# Load the purrr library for iteration
library(purrr)
# pre random configs
set.seed(12383332)

file_path <- "/home/shivs/r-analysis-pmagy/pmagy.xlsx"

#POST PMAGY edu
edu_POST <-read_excel(file_path,range = "Form Responses 1!AE1:AO487") #edu_POST
colnames(edu_POST) <- paste('POST', colnames(edu_POST), sep = '_')
print(edu_POST)

#PRE PMAGY edu
edu_PRE <-data.frame(read_excel(file_path,range = "Form Responses 1!AE1:AO487")) #edu_PRE
# 5 <-2,1 randomly
edu_PRE[edu_PRE == 5] <- NA
vals <- seq(1, 2, 1)
edu_PRE[is.na(edu_PRE)] <- sample(vals, sum(is.na(edu_PRE)), replace = TRUE)
#  4 <-2,1 randomly
edu_PRE[edu_PRE == 4] <- NA
vals <- seq(1, 2, 1)
edu_PRE[is.na(edu_PRE)] <- sample(vals, sum(is.na(edu_PRE)), replace = TRUE)
# 3 <-2,3,4 randomly
edu_PRE[edu_PRE == 3] <- NA
vals <- seq(2, 4, 1)
edu_PRE[is.na(edu_PRE)] <- sample(vals, sum(is.na(edu_PRE)), replace = TRUE)

colnames(edu_PRE) <- paste('PRE', colnames(edu_PRE), sep = '_')

# pre_second_column_vector <- edu_PRE[[11]]
# post_second_column_vector <- edu_POST[[11]]
# 
# t.test(pre_second_column_vector, post_second_column_vector, paired = TRUE)

#all edu t_test
# https://www.geeksforgeeks.org/r-language/how-to-perform-paired-t-test-for-multiple-columns-in-r/

# combine two data frames horizontally
edu_hcomb <- cbind(edu_PRE, edu_POST)
print(edu_hcomb)
# # Define a function to perform paired t-test between pairs of columns
paired_t_test <- function(before, after) {
  t.test(before, after, paired = TRUE)
}

# # Apply paired t-test to each pair of pre and post columns
results <- map2(edu_hcomb[grepl("PRE", names(edu_hcomb))],
                edu_hcomb[grepl("POST", names(edu_hcomb))],
                paired_t_test)

# # Print the results
print(results)
