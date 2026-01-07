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


#calculate Cronbach's Alpha
print(cronbach.alpha(edu_POST))
print(cronbach.alpha(edu_PRE))

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

### EDU Section tests COMPLETE
print("EDU Section tests COMPLETE")


