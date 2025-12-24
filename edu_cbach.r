#EDU section

# import readxl package 
library(readxl) 

# reading data from an excel file 
xl_data <-read_excel('/home/shivs/r-analysis-pmagy/pmagy.xlsx',range = "Form Responses 1!AE1:AO487") 
print(xl_data)

# Make a data frame
# DataFrame <- data.frame(xl_data)
# print(DataFrame)

# load library ltm
library(ltm)

# calculate cronbach's alpha
cronbach.alpha(xl_data)

