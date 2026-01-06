# 4. To examine the role of PMAGY in enhancing the livelihood opportunities for the residents of the selected villages.
# Section 11: Livelihood and Skill Development

# import packages
library(readxl)
library(dplyr)
# Load the purrr library for iteration
library(purrr)

file_path <- "/home/shivs/r-analysis-pmagy/pmagy.xlsx"

### lisd Section tests:
print("lisd Section tests: ")
#POST PMAGY lisd
lisd_POST <-read_excel(file_path,range = "Form Responses 1!CN1:CR487") #lisd_POST
colnames(lisd_POST) <- paste('POST', colnames(lisd_POST), sep = '_')
#print(lisd_POST)

lisd_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj4_lisd.xlsx")) #lisd_PRE

colnames(lisd_PRE) <- paste('PRE', colnames(lisd_PRE), sep = '_')

#all lisd t_test
# https://www.geeksforgeeks.org/r-language/how-to-perform-paired-t-test-for-multiple-columns-in-r/

# combine two data frames horizontally
lisd_hcomb <- cbind(lisd_PRE, lisd_POST)
#print(lisd_hcomb)
# # Define a function to perform paired t-test between pairs of columns
paired_t_test <- function(before, after) {
  t.test(before, after, paired = TRUE)
}

# # Apply paired t-test to each pair of pre and post columns
results_lisd <- map2(lisd_hcomb[grepl("PRE", names(lisd_hcomb))],
                    lisd_hcomb[grepl("POST", names(lisd_hcomb))],
                    paired_t_test)

# # Print the results
print("Results for column/question wise t tests")
print(results_lisd)

# row wise means of pre data

# make the copy of the data frame
lisd_PRE_index <- data.frame(rowMeans(lisd_PRE))

# Apply rownames_to_column on the copy of
# DataFrame and put name of function sno
lisd_PRE_index <- tibble::rownames_to_column(lisd_PRE_index, "s_no")

lisd_POST_index <- read_excel(file_path,range = "Form Responses 1!CS1:CS487")

lisd_ind_hcomb <- cbind(lisd_PRE_index, lisd_POST_index)

#Print pre index and post index values, serial no also present for convenience
#print("Print pre index and post index values, serial no also present for convenience")
#lisd_ind_hcomb

# # Apply paired t-test to each pair of pre and post columns
results_lisd_ind <- map2(lisd_ind_hcomb[grepl("rowMeans.lisd_PRE.", names(lisd_ind_hcomb))],
                        lisd_ind_hcomb[grepl("LISD_INDEX", names(lisd_ind_hcomb))],
                        paired_t_test)

# # Print the results FOR Pre index and post index columns
print("Print the t test result FOR Pre index and post index columns")
print(results_lisd_ind)
### lisd Section tests COMPLETE
print("lisd Section tests COMPLETE")
