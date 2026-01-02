
#install.packages("dplyr")
#install.packages("gridExtra")
#install.packages("ggplot2")

library(ggplot2)
library(dplyr)
library(gridExtra)

head(mtcars)

mtcars_aov <- aov(mtcars$disp ~ factor(mtcars$gear))
summary(mtcars_aov)

plot1 <- ggplot(mtcars, aes(
  x = factor(gear),
  y = disp,
  fill = factor(gear)
)) +
  geom_boxplot(color = "black", alpha = 0.7) +
  labs(title = "One-Way ANOVA", x = "Gear", y = "Displacement") +
  theme_minimal() +
  theme(legend.position = "top")

grid.arrange(plot1, ncol = 1)