#3. To analyze the impact of PMAGY on education and health facilities in the selected villages.

# import packages
library(readxl)
library(dplyr)
# Load the purrr library for iteration
library(purrr)

file_path <- "/home/shivs/r-analysis-pmagy/pmagy.xlsx"

### EDU Section tests:
print("EDU Section tests: ")
#POST PMAGY edu
edu_POST <-read_excel(file_path,range = "Form Responses 1!AE1:AO487") #edu_POST
colnames(edu_POST) <- paste('POST', colnames(edu_POST), sep = '_')
#print(edu_POST)

edu_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx")) #edu_PRE

colnames(edu_PRE) <- paste('PRE', colnames(edu_PRE), sep = '_')

#all edu t_test
# https://www.geeksforgeeks.org/r-language/how-to-perform-paired-t-test-for-multiple-columns-in-r/

# combine two data frames horizontally
edu_hcomb <- cbind(edu_PRE, edu_POST)
#print(edu_hcomb)
# # Define a function to perform paired t-test between pairs of columns
paired_t_test <- function(before, after) {
  t.test(before, after, paired = TRUE)
}

# # Apply paired t-test to each pair of pre and post columns
results_EDU <- map2(edu_hcomb[grepl("PRE", names(edu_hcomb))],
                edu_hcomb[grepl("POST", names(edu_hcomb))],
                paired_t_test)

# # Print the results
print("Print the results for column/question wise t tests")
print(results_EDU)

# row wise means of pre data

# make the copy of the data frame
edu_PRE_index <- data.frame(rowMeans(edu_PRE))

# Apply rownames_to_column on the copy of
# DataFrame and put name of function sno
edu_PRE_index <- tibble::rownames_to_column(edu_PRE_index, "s_no")

edu_POST_index <- read_excel(file_path,range = "Form Responses 1!AP1:AP487")

edu_ind_hcomb <- cbind(edu_PRE_index, edu_POST_index)

#Print pre index and post index values, serial no also present for convenience
#print("Print pre index and post index values, serial no also present for convenience")
#edu_ind_hcomb

# # Apply paired t-test to each pair of pre and post columns
results_edu_ind <- map2(edu_ind_hcomb[grepl("rowMeans.edu_PRE.", names(edu_ind_hcomb))],
                        edu_ind_hcomb[grepl("EDU_INDEX", names(edu_ind_hcomb))],
                paired_t_test)

# # Print the results FOR Pre index and post index columns
print("Print the t test result FOR Pre index and post index columns")
print(results_edu_ind)
### EDU Section tests COMPLETE
print("EDU Section tests COMPLETE")


### HN Section tests:
print("HN Section tests: ")

#3. To analyze the impact of PMAGY on hncation and health facilities in the selected villages.

#POST PMAGY hn
hn_POST <-read_excel(file_path,range = "Form Responses 1!AQ1:BB487") #hn_POST
colnames(hn_POST) <- paste('POST', colnames(hn_POST), sep = '_')
#print(hn_POST)

#PRE PMAGY hn TO BE IGNORED
hn_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")) #hn_PRE

colnames(hn_PRE) <- paste('PRE', colnames(hn_PRE), sep = '_')

#all hn t_test
# https://www.geeksforgeeks.org/r-language/how-to-perform-paired-t-test-for-multiple-columns-in-r/

# combine two data frames horizontally
hn_hcomb <- cbind(hn_PRE, hn_POST)
#print(hn_hcomb)
# # Define a function to perform paired t-test between pairs of columns
paired_t_test <- function(before, after) {
  t.test(before, after, paired = TRUE)
}

# # Apply paired t-test to each pair of pre and post columns
results_hn <- map2(hn_hcomb[grepl("PRE", names(hn_hcomb))],
                   hn_hcomb[grepl("POST", names(hn_hcomb))],
                   paired_t_test)

# # Print the results
print("Print the results for column/question wise t tests")
print(results_hn)

# row wise means of pre data

# make the copy of the data frame
hn_PRE_index <- data.frame(rowMeans(hn_PRE))

# Apply rownames_to_column on the copy of
# DataFrame and put name of function sno
hn_PRE_index <- tibble::rownames_to_column(hn_PRE_index, "s_no")

hn_POST_index <- read_excel(file_path,range = "Form Responses 1!BC1:BC487")

hn_ind_hcomb <- cbind(hn_PRE_index, hn_POST_index)

#Print pre index and post index values, serial no also present for convenience

#print("Print pre index and post index values, serial no also present for convenience")
#hn_ind_hcomb

# # Apply paired t-test to each pair of pre and post columns
results_hn_ind <- map2(hn_ind_hcomb[grepl("rowMeans.hn_PRE.", names(hn_ind_hcomb))],
                       hn_ind_hcomb[grepl("HN_INDEX", names(hn_ind_hcomb))],
                       paired_t_test)

# # Print the results FOR Pre index and post index columns
print("Print the t test result FOR Pre index and post index columns")
print(results_hn_ind)

### HN Section tests COMPLETE
print("HN Section tests COMPLETE")
