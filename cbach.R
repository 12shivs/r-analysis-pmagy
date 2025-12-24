# import readxl package 
library(readxl) 

# reading data from an excel file 
xl_data <-read_excel('/home/shivs/r-analysis-pmagy/pmagy.xlsx',range = "Form Responses 1!V1:AC487") 
print(xl_data)

# Make a data frame
# DataFrame <- data.frame(xl_data)
# print(DataFrame)


write.csv(xl_data,"/home/shivs/r-analysis-pmagy/dws.csv", row.names = FALSE)

# load library ltm
library(ltm)

# calculate cronbach's alpha
cronbach.alpha(xl_data)

