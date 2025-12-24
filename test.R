# create sample data
sample_data <- data.frame(var1=c(1, 2, 1, 2, 1, 2, 1, 3, 3, 1, 4),
                           var2=c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3),
                           var3=c(2, 1, 3, 1, 2, 3, 3, 4, 4, 2, 1))

# load library ltm
library(ltm)

# calculate cronbach's alpha
cronbach.alpha(sample_data, CI=TRUE, standardized=TRUE)


