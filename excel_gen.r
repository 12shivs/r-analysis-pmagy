# import packages
library(readxl)
library(dplyr)
library(writexl)

edu_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx")) #edu_PRE

#edu 9
# consider the vector
data=c(1,2,4,5)

# get 10 random elements with probability
cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.2,0.1,0.4,0.3))

#print(cdf)

edu_PRE[9] <- cdf
###

#edu 10
# consider the vector
data=c(2,4,1,5)

# get 10 random elements with probability
cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.4,0.3,0.1,0.2))

#print(cdf)
edu_PRE[10] <- cdf
###

#edu 8
# consider the vector
data=c(2,1,4,5)

# get 10 random elements with probability
cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.2,0.1,0.4,0.3))

#print(cdf)
edu_PRE[8] <- cdf
###


write_xlsx(edu_PRE, path = "/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx")

