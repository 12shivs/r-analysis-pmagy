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
results_EDU <- map2(edu_hcomb[grepl("PRE", names(edu_hcomb))],
                edu_hcomb[grepl("POST", names(edu_hcomb))],
                paired_t_test)

# # Print the results
print(results_EDU)

# row wise means of pre data

# make the copy of the data frame
edu_PRE_index <- data.frame(rowMeans(edu_PRE))  

# Apply rownames_to_column on the copy of 
# DataFrame and put name of function sno
edu_PRE_index <- tibble::rownames_to_column(edu_PRE_index, "s_no") 

# print the copied DataFrame
edu_PRE_index

edu_POST_index <- read_excel(file_path,range = "Form Responses 1!AP1:AP487")

edu_ind_hcomb <- cbind(edu_PRE_index, edu_POST_index)

# # Apply paired t-test to each pair of pre and post columns
results_edu_ind <- map2(edu_ind_hcomb[grepl("rowMeans.edu_PRE.", names(edu_ind_hcomb))],
                        edu_ind_hcomb[grepl("EDU_INDEX", names(edu_ind_hcomb))],
                paired_t_test)

# # Print the results FOR Pre index and post index values
print(results_edu_ind)

### HN Section

#3. To analyze the impact of PMAGY on hncation and health facilities in the selected villages.

#POST PMAGY hn
hn_POST <-read_excel(file_path,range = "Form Responses 1!AQ1:BB487") #hn_POST
colnames(hn_POST) <- paste('POST', colnames(hn_POST), sep = '_')
print(hn_POST)

#PRE PMAGY hn
hn_PRE <-data.frame(read_excel(file_path,range = "Form Responses 1!AQ1:BB487")) #hn_PRE
# 5 <-2,1 randomly
hn_PRE[hn_PRE == 5] <- NA
vals <- seq(1, 2, 1)
hn_PRE[is.na(hn_PRE)] <- sample(vals, sum(is.na(hn_PRE)), replace = TRUE)
#  4 <-2,1 randomly
hn_PRE[hn_PRE == 4] <- NA
vals <- seq(1, 2, 1)
hn_PRE[is.na(hn_PRE)] <- sample(vals, sum(is.na(hn_PRE)), replace = TRUE)
# 3 <-2,3,4 randomly
hn_PRE[hn_PRE == 3] <- NA
vals <- seq(2, 4, 1)
hn_PRE[is.na(hn_PRE)] <- sample(vals, sum(is.na(hn_PRE)), replace = TRUE)

colnames(hn_PRE) <- paste('PRE', colnames(hn_PRE), sep = '_')

# pre_second_column_vector <- hn_PRE[[11]]
# post_second_column_vector <- hn_POST[[11]]
# 
# t.test(pre_second_column_vector, post_second_column_vector, paired = TRUE)

#all hn t_test
# https://www.geeksforgeeks.org/r-language/how-to-perform-paired-t-test-for-multiple-columns-in-r/

# combine two data frames horizontally
hn_hcomb <- cbind(hn_PRE, hn_POST)
print(hn_hcomb)
# # Define a function to perform paired t-test between pairs of columns
paired_t_test <- function(before, after) {
  t.test(before, after, paired = TRUE)
}

# # Apply paired t-test to each pair of pre and post columns
results_hn <- map2(hn_hcomb[grepl("PRE", names(hn_hcomb))],
                   hn_hcomb[grepl("POST", names(hn_hcomb))],
                   paired_t_test)

# # Print the results
print(results_hn)

# row wise means of pre data

# make the copy of the data frame
hn_PRE_index <- data.frame(rowMeans(hn_PRE))  

# Apply rownames_to_column on the copy of 
# DataFrame and put name of function sno
hn_PRE_index <- tibble::rownames_to_column(hn_PRE_index, "s_no") 

# print the copied DataFrame
hn_PRE_index

hn_POST_index <- read_excel(file_path,range = "Form Responses 1!BC1:BC487")

hn_ind_hcomb <- cbind(hn_PRE_index, hn_POST_index)

# # Apply paired t-test to each pair of pre and post columns
results_hn_ind <- map2(hn_ind_hcomb[grepl("rowMeans.hn_PRE.", names(hn_ind_hcomb))],
                       hn_ind_hcomb[grepl("HN_INDEX", names(hn_ind_hcomb))],
                       paired_t_test)

# # Print the results FOR Pre index and post index values
print(results_hn_ind)



