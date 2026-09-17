### PROBLEM SET 1
## IMPORTANT: SEE FULL INSTRUCTIONS IN CANVAS. 
##
## Reminders: You will provide your answers in this template by replacing the   
## square-bracketed sections (including brackets and all text) with your answers. 
## DO NOT alter or delete anything apart from square-bracketed sections.
## For full credit, your blocks of code must run without modification, each line 
## of code must be annotated, and the answer needs to be correct.

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
typ_whether_fly_samples_during_min <- "boolean"
typ_length_of_proboscis <- "float"

## 1B. 6pts What type of distribution will you use to appropriately model the waiting time until the fly first samples the food?
# [Provide the name of the distribution]
dist_model_fly_samples_waiting_time <- "binomial"

## 1C. 7pts code, 1pt answer Use R to calculate the probability that the fly will sample food in the first 2 minutes of the experiment.

# We calculate the probabilty of no sampling by flies in 2 minutes.
# Subtracting this percent by 1 yields the probability that a fly
# will sample at least once during that 2 minute period.
# This is a helper function to calculate the answer and print it.
calc_print_prob_fly_samples <- function(mins, prob = p_fly_samples_min) {
  res <- 1 - dbinom(0, mins, prob)
  print(
    paste0(
      "The probability that the fly will sample ",
      "food after ", mins," minutes of the experiment is ",
      res,
      "."
    )
  )
}

min_fly_exp <- 2

# [Provide the answer you obtain by running your code]
res_1c <- calc_print_prob_fly_samples(min_fly_exp)

## 1D. 7pts code, 1pt answer Use R to calculate the probability that the fly first samples the food during each of the following one-minute time periods:
## 0–1 minutes, 1–2 minutes, 2–3 minutes, ..., 13–14 minutes.

max_elapsed_time <- 14

# [Provide the answers you obtain by running your code]
# We iterate by minute (each interval) and calculate the probability
# As time passes, the probability of the fly sampling the food during any given interval increases.
for (elapsed_time in seq(max_elapsed_time)) {
  calc_print_prob_fly_samples(elapsed_time)
}

###
### Question 2
### 14 pts total
## Professor Jason comes to a class of 67 students without realizing he has the flu. He sneezes, releasing 1000 respiratory droplets.
## It takes 20 or more droplets to catch the disease.
## Assuming the droplets are randomly distributed among the 67 students, use R to figure out how many of Professor Joson’s students are at risk of getting sick.

## 2A. 6pts. What type of probability distribution will you use to model these data?
#  [Provide the name of the distribution]

## 2B. 7pts code, 1pt answer. 10pts How many of Professor Jason’s students are at risk of getting sick? 
[Provide the annotated R code that you use to answer the question]
# [Provide the answer you obtain by running your code]


###
### Question 3
### 16 pts total
## A genomics experiment has identified genes involved in brain development. 6 encode transcription factors and 9 encode signaling proteins.

## 3A. 7pts code, 1pt answer. If exactly 3 of the 15 genes are selected at random for further analysis, what is the probability that they are all transcription factors? 
[Provide the annotated R code that you use to answer the question]
# [Provide the answer you obtain by running your code]

## 3B. 7pts code, 1pt answer. If exactly 5 of the 15 genes are selected at random for further analysis, what is the probability that at least 3 of them are signaling molecules? 
[Provide the annotated R code that you use to answer the question]
# [Provide the answer you obtain by running your code]


###
### Question 4
### 24 pts
## Submitting a grant to the NIH results in funding 4% of the time, while submitting to the State of Utah is successful 35% of the time.
## In your graduate career, you submit 12 grants to the NIH and 7 to the State of Utah

## 4A. 7pts code, 1pt answer. Use R to calculate each of the probabilities of having from 0 to 12 NIH grants funded.
[Provide the annotated R code that you use to answer the question]
# [Provide the answers you obtain by running your code]

## 4B. 7pts code, 1pt answer. Use R to calculate each of the probabilities of having from 0 to 7 grants funded by the State of Utah.
[Provide the annotated R code that you use to answer the question]
# [Provide the answers you obtain by running your code]

## 4C. 7pts code, 1pt answer. Using R code, calculate the probability you end up getting more grants funded by the State of Utah than by NIH.
[Provide the annotated R code that you use to answer the question]
# [Provide the answer you obtain by running your code]


###
### QUESTION 5
### 18 pts total
## A study is looking at factors influencing the cost of lunch at food trucks.  
## The following data reports the cost at a sample of 25 trucks
##  15.76, 19.56, 20.98, 20.98, 19.71, 16.05, 22.73, 16.93, 14.58, 19.47, 18.78, 15.91, 22, 22.45, 16.78, 17.49, 18.43, 19.21, 19.29, 21.09, 20.15, 18.14, 23.74, 20.03, 22.76

## 5A-G. Using R, calculate the following statistics for the sample: mean, 
##  standard deviation, standard error of the mean, 2 standard errors of the 
##  mean, 95% confidence interval, and 90% confidence interval for the sample.

# 5A. 12pts. Provide the annotated R code that you use to calculate the statistics.
[Provide the annotated R code that you use to calculate all the statistics]

## For 5B-G, provide the answers you calculated with your code. 1 pt for each answer.
## 5B. mean
# [Provide your answer]

## 5C. standard deviation
# [Provide your answer]

## 5D. standard error of the mean
# [Provide your answer]

## 5E. 2 standard errors of the mean
# [Provide your answer]

## 5F. 95% confidence interval
# [Provide your answer]

## 5G. 90% confidence interval
# [Delete this line and replace with your answer]


