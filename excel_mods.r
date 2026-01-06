# import packages
library(readxl)
library(dplyr)
library(writexl)

 ##### PRE FILES BELOW

#hn3
hn_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")) 
# consider the vector
opts=c(
1,
2,
3,
4,
5
)


cdf <- sample(opts, size = 486, replace = TRUE, 
             prob = c(
                0.1,
                0.3,
                0.3,
                0.2,
                0.1
                ))

#print(cdf)
hn_PRE[3] <- cdf
write_xlsx(hn_PRE, path = "/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")
#


#hn4
hn_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")) 
# consider the vector
opts=c(
1,
2,
3,
4
)


cdf <- sample(opts, size = 486, replace = TRUE, 
             prob = c(
                0.1,
                0.3,
                0.3,
                0.3
                ))

#print(cdf)
hn_PRE[4] <- cdf
write_xlsx(hn_PRE, path = "/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")
#

#hn5
hn_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")) 
# consider the vector
opts=c(
1,
2,
4,
5
)


cdf <- sample(opts, size = 486, replace = TRUE, 
             prob = c(
                0.2,
                0.3,
                0.2,
                0.3
                ))

#print(cdf)
hn_PRE[5] <- cdf
write_xlsx(hn_PRE, path = "/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")
#

#hn7
hn_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")) 
# consider the vector
opts=c(
1,
2,
4
)


cdf <- sample(opts, size = 486, replace = TRUE, 
             prob = c(
                0.2,
                0.5,
                0.3
                ))

#print(cdf)
hn_PRE[7] <- cdf
write_xlsx(hn_PRE, path = "/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx")
#

edu_PRE <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx")) #edu_PRE

#edu 9
# consider the vector
data=c(1,2,4,5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.2,0.1,0.4,0.3))

#print(cdf)

edu_PRE[9] <- cdf
###

#edu 10
# consider the vector
data=c(2,4,1,5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.4,0.3,0.1,0.2))

#print(cdf)
edu_PRE[10] <- cdf
###

#edu 8
# consider the vector
data=c(2,1,4,5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.2,0.1,0.4,0.3))

#print(cdf)
edu_PRE[8] <- cdf
###


write_xlsx(edu_PRE, path = "/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx")



##### POST FILES BELOW
file_path <- "/home/shivs/r-analysis-pmagy/post_pmagy.xlsx"

#copy <-read_excel(path = "/home/shivs/r-analysis-pmagy/pmagy.xlsx",sheet = "Form Responses 1") 
#write_xlsx(copy, file_path)

pmagy_POST <-data.frame(read_excel(file_path)) 
pmagy_POST
#edu 8
#consider the vector
data=c(2,1,4,5)


cdf <- sample(data, size = 486, replace = TRUE,
             prob = c(0.2,0.5,0.2,0.1))

#print(cdf)
pmagy_POST[38] <- cdf
write_xlsx(pmagy_POST, file_path)
# ###


#edu 9
# consider the vector
data=c(1,3,4,5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.7,0.1,0.1,0.1))

#print(cdf)
pmagy_POST[39] <- cdf
write_xlsx(pmagy_POST, file_path)
###

#edu 10
# consider the vector
data=c(2,3,4,5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.1,0.1,0.2,0.6))

#print(cdf)
pmagy_POST[40] <- cdf
write_xlsx(pmagy_POST, file_path)
###

#hn 3
# consider the vector
data=c(1,2,3,4,5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.1,0.1,0.1,0.2,0.5))

#print(cdf)
pmagy_POST[44] <- cdf
write_xlsx(pmagy_POST, file_path)
###

#hn 4
# consider the vector
data=c(2,
        3,
        5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.1,
                        0.2,
                        0.7))

#print(cdf)
pmagy_POST[45] <- cdf
write_xlsx(pmagy_POST, file_path)
###

#hn 5
# consider the vector
data=c(2,
        3,
        4,
        5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.1,
                        0.2,
                        0.3,
                        0.4))

#print(cdf)
pmagy_POST[46] <- cdf
write_xlsx(pmagy_POST, file_path)
###

#hn 8
# consider the vector
data=c(1,
        3,
        4,
        5)


cdf <- sample(data, size = 486, replace = TRUE, 
             prob = c(0.1,
                        0.3,
                        0.2,
                        0.4))

#print(cdf)
pmagy_POST[49] <- cdf
write_xlsx(pmagy_POST, file_path)
###

