# obj 3. To analyze the impact of PMAGY on education and health facilities in the selected villages.

# import packages
library(readxl)
library(ltm)
library(dplyr)
library(rcompanion)
# Load the purrr library for iteration
library(purrr)

post_pmagy_file_path <- "/home/shivs/r-analysis-pmagy/post_pmagy.xlsx"

### lisd Section tests:

print("lisd Section tests: ")
#POST PMAGY lisd
lisd_POST <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "CJ1:CN487")) #lisd_POST
colnames(lisd_POST) <- paste('POST', colnames(lisd_POST), sep = '_')
#PRE PMAGY lisd
lisd_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj4_lisd.xlsx",range = "A1:E487")) #lisd_PRE
colnames(lisd_PRE) <- paste('PRE', colnames(lisd_PRE), sep = '_')


#calculate Cronbach's Alpha:
print(cronbach.alpha(lisd_POST))
print(cronbach.alpha(lisd_PRE))
#

#Variance Inflation Factor (VIF):
library(car)
library(caTools)
# Fit a regression model on post data
lisd_POST_w_index <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "CJ1:CO487"))
colnames(lisd_POST_w_index) <- paste('POST', colnames(lisd_POST_w_index), sep = '_')
model_all <- lm(POST_LISD_INDEX ~ ., data = lisd_POST_w_index)
# Calculate VIF
vif_results <- car::vif(model_all)

print("VIF results for post data:")
print(vif_results)

# Fit a regression model on pre data
lisd_PRE_w_index <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj4_lisd.xlsx",range = "A1:F487"))
colnames(lisd_PRE_w_index) <- paste('PRE', colnames(lisd_PRE_w_index), sep = '_')
model_all <- lm(PRE_LISD_INDEX ~ ., data = lisd_PRE_w_index)
# Calculate VIF
vif_results <- car::vif(model_all)
print("VIF results for pre data:")
print(vif_results)
#TODO: Visualizing VIF Values from here https://www.geeksforgeeks.org/r-language/vif-function-in-r/
#

# Using theShapiro–Wilk Test :
print("Shapiro–Wilk Test results for pre data:")
print(shapiro.test(lisd_PRE_w_index$PRE_LISD_INDEX))
print("Shapiro–Wilk Test results for post data:")
print(shapiro.test(lisd_POST_w_index$POST_LISD_INDEX))
#

# Paired Samples Wilcoxon Test : 

# combine two data frames horizontally
lisd_pre_post_w_index_hcomb <- cbind(lisd_PRE_w_index, lisd_POST_w_index)

# # Define a function to perform paired Paired Samples Wilcoxon Test between pairs of columns
paired_wilcoxon_test <- function(before, after) {
  wilcox.test(before, after, paired = TRUE)
}

# # Apply paired Paired Samples Wilcoxon Test to each pair of pre and post columns
results_wilcoxon_test <- map2(lisd_pre_post_w_index_hcomb[grepl("PRE", names(lisd_pre_post_w_index_hcomb))],
                lisd_pre_post_w_index_hcomb[grepl("POST", names(lisd_pre_post_w_index_hcomb))],
                paired_wilcoxon_test)

# # Define a function to perform paired Paired Samples Wilcoxon Z Test between pairs of columns
paired_wilcoxon_Z_VALS <- function(before, after) {
  wilcoxonZ(before, after, paired=TRUE)
}

# Apply paired Paired Samples Wilcoxon Z Test to each pair of pre and post columns
results_wilcoxon_Z_VALS <- map2(lisd_pre_post_w_index_hcomb[grepl("PRE", names(lisd_pre_post_w_index_hcomb))],
                lisd_pre_post_w_index_hcomb[grepl("POST", names(lisd_pre_post_w_index_hcomb))],
                paired_wilcoxon_Z_VALS)

# # Print the results
print("Print the results for column/question wise Paired Samples Wilcoxon Test")

  for (i in 1:length(results_wilcoxon_test)) {
    Z = results_wilcoxon_Z_VALS[[i]]
      names(Z) = "Z"
      print(Z)

  tN = length(results_wilcoxon_test)
  names(tN) = "tN"

    r = abs(Z)/sqrt(tN)
  names(r) = "r"

      print(r)


  print(results_wilcoxon_test[[i]])
}
#

## cohen's d test :
#Step 1:
#install.packages("effsize")
library(effsize)

#Step 2:

## Define a function to perform cohen d Test between pairs of columns
cohen_d_test <- function(before, after) {
  cohen.d(before, after)
}

    ## Apply paired Paired Samples Wilcoxon Test to each pair of pre and post columns
    results_cohen_d_test <- map2(lisd_pre_post_w_index_hcomb[grepl("PRE", names(lisd_pre_post_w_index_hcomb))],
                    lisd_pre_post_w_index_hcomb[grepl("POST", names(lisd_pre_post_w_index_hcomb))],
                    cohen_d_test)
print("Print the results for column/question wise cohen d Test")
print(results_cohen_d_test)

### lisd Section tests COMPLETE
print("lisd Section tests COMPLETE")

