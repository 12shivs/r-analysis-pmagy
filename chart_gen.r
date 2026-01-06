# import packages
library(readxl)
library(ggplot2)
library(gridExtra)

file_path <- "/home/shivs/r-analysis-pmagy/pmagy.xlsx"

di_section <-read_excel(file_path,range = "Form Responses 1!G1:U487") #edu_POST

test_data <- mtcars

selected_cols <- c("DI 4.  EDUCATION QUALIFICATION" )
selected_data <- di_section[, selected_cols]

hist_plot_di4 <- ggplot(selected_data, aes(x = "DI 4.  EDUCATION QUALIFICATION")) +
  geom_histogram(binwidth = 2, fill = "blue", color = "white") +
  labs(title = "Histogram: Post PMAGY DI 4. EDUCATION QUALIFICATION", x = "Education Qualifications", y = "Total villagers")

# hist_plot_disp <- ggplot(selected_data, aes(x = disp)) +
#   geom_histogram(binwidth = 50, fill = "red", color = "white") +
#   labs(title = "Histogram: Displacement", x = "Displacement", y = "Frequency")

# hist_plot_hp <- ggplot(selected_data, aes(x = hp)) +
#   geom_histogram(binwidth = 20, fill = "green", color = "white") +
#   labs(title = "Histogram: Horsepower", x = "Horsepower", y = "Frequency")

# hist_plot_drat <- ggplot(selected_data, aes(x = drat)) +
#   geom_histogram(binwidth = 0.5, fill = "orange", color = "white") +
#   labs(title = "Histogram: Drat", x = "Drat", y = "Frequency")


# grid.arrange(hist_plot_mpg, hist_plot_disp, hist_plot_hp, hist_plot_drat, ncol = 1)

grid.arrange(hist_plot_di4,
             ncol = 1)
