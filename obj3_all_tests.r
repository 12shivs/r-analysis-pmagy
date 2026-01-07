# obj 3. To analyze the impact of PMAGY on education and health facilities in the selected villages.

# import packages
library(readxl)
library(ltm)


file_path <- "/home/shivs/r-analysis-pmagy/post_pmagy.xlsx"

### EDU Section tests:

print("EDU Section tests: ")
#POST PMAGY edu
edu_POST <-data.frame(read_excel(file_path,sheet = "Sheet1",range = "AE1:AN487")) #edu_POST
colnames(edu_POST) <- paste('POST', colnames(edu_POST), sep = '_')
#PRE PMAGY edu
edu_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx",range = "A1:J487")) #edu_PRE
colnames(edu_PRE) <- paste('PRE', colnames(edu_PRE), sep = '_')


#calculate Cronbach's Alpha:
print(cronbach.alpha(edu_POST))
print(cronbach.alpha(edu_PRE))
#

#Variance Inflation Factor (VIF):
library(car)
library(caTools)
# Fit a regression model on post data
edu_POST_w_index <-data.frame(read_excel(file_path,sheet = "Sheet1",range = "AE1:AO487"))
colnames(edu_POST_w_index) <- paste('POST', colnames(edu_POST_w_index), sep = '_')
model_all <- lm(POST_EDU_INDEX ~ ., data = edu_POST_w_index)
# Calculate VIF
vif_results <- car::vif(model_all)

print("VIF results for post data:")
print(vif_results)

# Fit a regression model on pre data
edu_PRE_w_index <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx",range = "A1:K487"))
colnames(edu_PRE_w_index) <- paste('PRE', colnames(edu_PRE_w_index), sep = '_')

model_all <- lm(PRE_EDU_INDEX ~ ., data = edu_PRE_w_index)
# Calculate VIF
vif_results <- car::vif(model_all)
print("VIF results for pre data:")
print(vif_results)
#TODO: Visualizing VIF Values from here https://www.geeksforgeeks.org/r-language/vif-function-in-r/
#

# Using theShapiro–Wilk Test :
print("Shapiro–Wilk Test results for pre data:")
print(shapiro.test(edu_PRE_w_index$PRE_EDU_INDEX))
print("Shapiro–Wilk Test results for post data:")
print(shapiro.test(edu_POST_w_index$POST_EDU_INDEX))
#

# Paired Samples Wilcoxon Test : 

# combine two data frames horizontally
edu_pre_post_hcomb <- cbind(edu_PRE, edu_POST)

# # Define a function to perform paired Paired Samples Wilcoxon Test between pairs of columns
paired_wilcoxon_test <- function(before, after) {
  wilcox.test(before, after, paired = TRUE)
}

# # Apply paired Paired Samples Wilcoxon Test to each pair of pre and post columns
results_wilcoxon_test <- map2(edu_pre_post_hcomb[grepl("PRE", names(edu_pre_post_hcomb))],
                edu_pre_post_hcomb[grepl("POST", names(edu_pre_post_hcomb))],
                paired_wilcoxon_test)

# # Print the results
print("Print the results for column/question wise Paired Samples Wilcoxon Test")
print(results_wilcoxon_test)
#

### EDU Section tests COMPLETE
print("EDU Section tests COMPLETE")