# Difference in CI calculation

sample_food_truck_costs <- c(
  5.76, 19.56, 20.98, 20.98, 19.71, 16.05, 22.73, 16.93, 14.58, 19.47,
  18.78, 15.91, 22, 22.45, 16.78, 17.49, 18.43, 19.21, 19.29, 21.09,
  20.15, 18.14, 23.74, 20.03, 22.76
)

## 5A-G. Using R, calculate the following statistics for the sample: mean, 
##  standard deviation, standard error of the mean, 2 standard errors of the 
##  mean, 95% confidence interval, and 90% confidence interval for the sample.

# 5A. 12pts. Provide the annotated R code that you use to calculate the statistics.
mean_5ag <- mean(sample_food_truck_costs)
stdev_5ag <- sd(sample_food_truck_costs)
sem_5ag <- stdev_5ag / sqrt(length(sample_food_truck_costs))

critical_value_95 <- 1.96
# Based on slide, "Calculating a critical value of your choice"
# Two-tailed so add 0.025
critical_value_95_qnorm <- qnorm(0.975, 0, 1)

ci_l <- mean_5ag - critical_value_95 * sem_5ag
ci_r <- mean_5ag + critical_value_95 * sem_5ag

ci_l_qnorm <- mean_5ag - critical_value_95_qnorm * sem_5ag
ci_r_qnorm <- mean_5ag + critical_value_95_qnorm * sem_5ag

# CI test function. Providing mu.
ci_ttest <- t.test(sample_food_truck_costs, mu=mean_5ag, conf.level = 0.95)$conf.int
# CI test function.
ci_ttest_no_mu <- t.test(sample_food_truck_costs, conf.level = 0.95)$conf.int

print(paste0("CI: ", ci_l, "-", ci_r))
print(paste0("CI_qnorm: ", ci_l_qnorm, "-", ci_r_qnorm))
print(paste0("CI_ttest: ", ci_ttest[1], "-", ci_ttest[2]))
print(paste0("CI_ttest_no_mu: ", ci_ttest_no_mu[1], "-", ci_ttest_no_mu[2]))
