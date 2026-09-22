### PROBLEM SET 1
## IMPORTANT: SEE FULL INSTRUCTIONS IN CANVAS. 
##
## Reminders: You will provide your answers in this template by replacing the   
## square-bracketed sections (including brackets and all text) with your answers. 
## DO NOT alter or delete anything apart from square-bracketed sections.
## For full credit, your blocks of code must run without modification, each line 
## of code must be annotated, and the answer needs to be correct.

# You can run this script like so:
# * Rscript PS1_Fall26_KeisukeOshima.R

# Helper function to print
printc <- function(msg) {
  cat(paste0(msg, "\n")) 
}

###
### Question 1
### 28 pts total
## In a fly behavior experiment, flies are given the opportunity to sample a food source. 
## The probability that the fly samples the food in any given minute is 1/9. 
## You record data for two variables:
## (1) For each minute, whether or not the fly samples the food;
## (2) Each time it feeds, how far it extends its proboscis. 

p_fly_samples_min <- 1 / 9

## 1A. 6pts. What kind of variables are (1) whether the fly samples the food during a given minute 
## and (2) length of its proboscis?
# [Provide the kinds of variable]
typ_whether_fly_samples_during_min <- "discrete"
typ_length_of_proboscis <- "continuous"
printc(paste0("1a. Whether the fly samples the food during a given minute is a ", typ_whether_fly_samples_during_min, " variable."))
printc(paste0("1a. The length of its proboscis is a ", typ_length_of_proboscis, " variable."))

## 1B. 6pts What type of distribution will you use to appropriately model the waiting time until the fly first samples the food?
# [Provide the name of the distribution]
dist_1b <- "geometric"
printc(paste0("1b. The ", dist_1b, " distribution appropriately models the waiting time until the fly first samples the food."))

## 1C. 7pts code, 1pt answer Use R to calculate the probability that the fly will sample food in the first 2 minutes of the experiment.

min_fly_exp <- 2

# [Provide the answer you obtain by running your code]

# We calculate the probabilty of sampling by flies in the first 2 minutes.
# Similar to slide 67 where minutes are non-events where fly does not sample. We need to get all events before so pgeom up to 1 minute.
res_1c <- pgeom(min_fly_exp-1, p_fly_samples_min)
printc(
  paste0(
    "1c. The probability that the fly will sample ",
    "food in the first ", min_fly_exp," minutes of the experiment is ",
    res_1c,
    "."
  )
)
## 1D. 7pts code, 1pt answer Use R to calculate the probability that the fly first samples the food during each of the following one-minute time periods:
## 0–1 minutes, 1–2 minutes, 2–3 minutes, ..., 13–14 minutes.

max_elapsed_time <- 14

# [Provide the answers you obtain by running your code]
# We iterate by minute (each interval) and calculate the probability using dgeom so it only gets that slice of the distribution
# As time passes, the probability of the fly sampling the food during any given interval decreases as more chances for fly to sample and less likely.
for (elapsed_time in seq(max_elapsed_time)) {
  # res_1d <- 1 - pgeom(elapsed_time-1, p_fly_samples_min)
  res_1d <- dgeom(elapsed_time, p_fly_samples_min)
  printc(
    paste0(
      "1d. The probability that the fly will sample ",
      "food in the first ", elapsed_time-1, "-", elapsed_time, " minutes of the experiment is ",
      res_1d,
      "."
    )
  )
}

###
### Question 2
### 14 pts total
## Professor Jason comes to a class of 67 students without realizing he has the flu. He sneezes, releasing 1000 respiratory droplets.
## It takes 20 or more droplets to catch the disease.
## Assuming the droplets are randomly distributed among the 67 students, use R to figure out how many of Professor Joson’s students are at risk of getting sick.

n_students <- 67
n_droplets <- 1000
thr_droplets_sick <- 20
avg_n_droplets_per_student <- n_droplets / n_students 

## 2A. 6pts. What type of probability distribution will you use to model these data?
#  [Provide the name of the distribution]
dist_2c <- "poisson"
printc(paste0("2a. The ", dist_2c, " distribution appropriately models disease and chance of sickness."))

## 2B. 7pts code, 1pt answer. 10pts How many of Professor Jason’s students are at risk of getting sick? 

# [Provide the answer you obtain by running your code]
# This is the probability for a single student having 20 particles or more
prob_sick <- 1 - ppois(thr_droplets_sick - 1, avg_n_droplets_per_student)

# Multiplying by the number of students gives the total number sick
n_sick <- n_students * prob_sick
printc(
  paste0("2b. ", round(n_sick), " students (", n_sick, ") are at risk of being sick.")
)

###
### Question 3
### 16 pts total
## A genomics experiment has identified genes involved in brain development. 6 encode transcription factors and 9 encode signaling proteins.
n_genes_transcription_factors <- 6
n_genes_signaling_proteins <- 9

## 3A. 7pts code, 1pt answer. If exactly 3 of the 15 genes are selected at random for further analysis, what is the probability that they are all transcription factors? 

n_genes_selected_3a <- 3
n_exact_genes_transcription_factors_3a <- 3

res_3a <- dhyper(
  n_exact_genes_transcription_factors_3a,
  n_genes_transcription_factors,
  n_genes_signaling_proteins,
  n_genes_selected_3a,
)
printc(paste0(
  "3a. The probability that all ",
  n_genes_selected_3a,
  " selected genes encode transcription factors ",
  "is ",
  res_3a, "."
))

# [Provide the answer you obtain by running your code]

## 3B. 7pts code, 1pt answer. If exactly 5 of the 15 genes are selected at random for further analysis, what is the probability that at least 3 of them are signaling molecules? 

# [Provide the answer you obtain by running your code]
n_genes_selected_3b <- 5

# 3 or more
n_genes_or_more_signaling_proteins_3b <- 3
# phyper part is 3 or fewer. sub by 1 to get or more
res_3b <- 1 - phyper(
  n_genes_or_more_signaling_proteins_3b - 1,
  n_genes_signaling_proteins,
  n_genes_transcription_factors,
  n_genes_selected_3b
)
printc(paste0(
  "3b. The probability that at least ",
  n_genes_selected_3a,
  " selected genes encode signaling proteins ",
  "is ",
  res_3b, "."
))

###
### Question 4
### 24 pts
## Submitting a grant to the NIH results in funding 4% of the time, while submitting to the State of Utah is successful 35% of the time.
## In your graduate career, you submit 12 grants to the NIH and 7 to the State of Utah

prob_nih_grant_funding <- 0.04
prob_utah_grant_funding <- 0.35
n_nih_grants <- 12
n_utah_grants <- 7

## 4A. 7pts code, 1pt answer. Use R to calculate each of the probabilities of having from 0 to 12 NIH grants funded.

# [Provide the answers you obtain by running your code]
for (n in seq(n_nih_grants + 1)) {
  n <- n - 1
  res_4a_n <- dbinom(n, n_nih_grants, prob_nih_grant_funding)
  printc(paste0("4a. The probability that ", n, " of ", n_nih_grants, " NIH grants will be funded is ", res_4a_n, "."))
}

## 4B. 7pts code, 1pt answer. Use R to calculate each of the probabilities of having from 0 to 7 grants funded by the State of Utah.

# [Provide the answers you obtain by running your code]
for (n in seq(n_utah_grants + 1)) {
  n <- n - 1
  res_4b_n <- dbinom(n, n_utah_grants, prob_utah_grant_funding)
  printc(paste0("4b. The probability that ", n, " of ", n_utah_grants, " Utah grants will be funded is ", res_4b_n, "."))
}

## 4C. 7pts code, 1pt answer. Using R code, calculate the probability you end up getting more grants funded by the State of Utah than by NIH.

# [Provide the answer you obtain by running your code]
res_4c <- 0
for (n in seq(n_utah_grants + 1)) {
  n <- n - 1
  prob_utah_grant <- dbinom(n, n_utah_grants, prob_utah_grant_funding)
  # Less than n so need to subtract 1
  prob_nih_lt_n_utah_grant <- pbinom(n-1, n_nih_grants, prob_nih_grant_funding)
  # Probabilty we get n utah grants and less than n nih grants
  prob_joint <- prob_utah_grant * prob_nih_lt_n_utah_grant

  res_4c <- res_4c + prob_joint
}
printc(paste0("4c. The probability we get more grants funded by the State of Utah than by NIH is ", res_4c, "."))

###
### QUESTION 5
### 18 pts total
## A study is looking at factors influencing the cost of lunch at food trucks.  
## The following data reports the cost at a sample of 25 trucks
##  15.76, 19.56, 20.98, 20.98, 19.71, 16.05, 22.73, 16.93, 14.58, 19.47, 18.78, 15.91, 22, 22.45, 16.78, 17.49, 18.43, 19.21, 19.29, 21.09, 20.15, 18.14, 23.74, 20.03, 22.76

sample_food_truck_costs <- c(
  5.76, 19.56, 20.98, 20.98, 19.71, 16.05, 22.73, 16.93, 14.58, 19.47, 18.78, 15.91, 22, 22.45, 16.78, 17.49, 18.43, 19.21, 19.29, 21.09, 20.15, 18.14, 23.74, 20.03, 22.76
)
n_sample_food_trucks <- length(sample_food_truck_costs)

## 5A-G. Using R, calculate the following statistics for the sample: mean, 
##  standard deviation, standard error of the mean, 2 standard errors of the 
##  mean, 95% confidence interval, and 90% confidence interval for the sample.

# 5A. 12pts. Provide the annotated R code that you use to calculate the statistics.
mean_5ag <- mean(sample_food_truck_costs)
stdev_5ag <- sd(sample_food_truck_costs)
sem_5ag <- stdev_5ag / sqrt(n_sample_food_trucks)

two_sem_5ag <- sem_5ag * 2

critical_value_90 <- 1.645
critical_value_95 <- 1.96

ci_95_l_5ag <- mean_5ag - critical_value_95 * sem_5ag
ci_95_r_5ag <- mean_5ag + critical_value_95 * sem_5ag
ci_90_l_5ag <- mean_5ag - critical_value_90 * sem_5ag
ci_90_r_5ag <- mean_5ag + critical_value_90 * sem_5ag

## For 5B-G, provide the answers you calculated with your code. 1 pt for each answer.
## 5B. mean
# [Provide your answer]
stmt_5ag <- " of food truck samples is "
printc(paste0("5b. Mean", stmt_5ag, mean_5ag, "."))

## 5C. standard deviation
# [Provide your answer]
printc(paste0("5c. Standard deviation", stmt_5ag, stdev_5ag, "."))

## 5D. standard error of the mean
# [Provide your answer]
printc(paste0("5d. Standard error of mean", stmt_5ag, sem_5ag, "."))

## 5E. 2 standard errors of the mean
# [Provide your answer]
printc(paste0("5e. Two standard errors of mean", stmt_5ag, two_sem_5ag, "."))

## 5F. 95% confidence interval
# [Provide your answer]
printc(paste0("5f. The 95% confidence interval", stmt_5ag, ci_95_l_5ag, " and ", ci_95_r_5ag, "."))

## 5G. 90% confidence interval
printc(paste0("5g. The 90% confidence interval", stmt_5ag, ci_90_l_5ag, " and ", ci_90_r_5ag, "."))
