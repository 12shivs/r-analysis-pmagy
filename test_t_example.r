# Load necessary library
library(dplyr)

# Create sample data
set.seed(123)
data <- data.frame(
  before_1 = rnorm(30, mean = 100, sd = 10),
  after_1 = rnorm(30, mean = 102, sd = 10),
  before_2 = rnorm(30, mean = 90, sd = 15),
  after_2 = rnorm(30, mean = 88, sd = 15)
)

# Preview data
head(data)

# Load the purrr library for iteration
library(purrr)

# Define a function to perform paired t-test between pairs of columns
paired_t_test <- function(before, after) {
  t.test(before, after, paired = TRUE)
}

# Apply paired t-test to each pair of columns
results <- map2(data[grepl("before", names(data))], 
                data[grepl("after", names(data))], 
                paired_t_test)

# Print the results
results


set.seed(2820)

sweetOne <- c(rnorm(100, mean = 14, sd = 0.1))
sweetTwo <- c(rnorm(100, mean = 13, sd = 0))

t.test(sweetOne, sweetTwo, paired = TRUE)

