### PROBLEM SET 2 2026
## IMPORTANT: SEE FULL INSTRUCTIONS IN CANVAS. 
##
## Reminders: You will provide your answers in this template by replacing the   
## square-bracketed sections (including brackets and all text) with your answers. 
## DO NOT alter or delete anything apart from square-bracketed sections.
## For full credit, your blocks of code MUST RUN WITHOUT MODIFICATION, each line 
## of code must be annotated, and the answer needs to be correct.

###
### QUESTION 1
### 15 pts total
### 1A 4 pts code, 6 pts annotation
### 1B 5 pts
###

## This question will use the dataset "drugs" which is a dataframe of 50 (hypothetical) drugs for various conditions.
## Download from Canvas and load the dataset into R (DO NOT change its name).

# load libraries and data
library("BSDA")

load("Drugs_data.RData")
load("Glucose_data.RData")
load("Bird_data.RData")

# Helper function to print
printc <- function(msg) {
  cat(paste0(msg, "\n")) 
}

##  Typical compounds have a mean solubility of 30.4 with a sd of 8.1 and show a normal distribution.
##  Using the z-test and the dataset "drugs", calculate whether the drugs 
##  in the table show a significantly different solubility (Sol) as compared to typical compounds, 
##  using an alpha of 0.05. Make sure to perform any additional analyses needed to assess whether a 
##  specific test is appropriate to use.

## Q1A. Provide the annotated R code that you use to calculate the statistics.

# Known valus for typical compounds for z-test
mean_sol <- 30.4
sd_sol <- 8.1

# Check if solubility data is normally distributed 
norm_res_1a <- shapiro.test(drugs$Sol)

# p-value greater than 0.05 so means solubility data is normally distributed
# NOTE: I "assert" that this statement must be true before continuing
stopifnot(norm_res_1a$p.value > 0.05)

# z-test against known metrics for compound solubility
res_1a <- z.test(
  drugs$Sol,
  mu = mean_sol,
  sigma.x = mean_sol,
)

## Q1B. Provide your interpretation of the result of the test. Specifically, you should 
## report the z-score of the test, the p value this z score represents, and whether you 
## should accept or reject the null hypothesis of no difference.

# [As a comment, provide your answer to Q1B]

# if significant at alpha of 0.05
# reject null that there is no signif difference in mean solubility between
# drugs and typical compounds
stopifnot(res_1a$p.value < 0.05)
printc(paste0(
  "1b. We reject the null hypothesis that there is no difference in the mean solubility between the drugs and the typical compounds. ",
  "The drugs in the table show a significantly different solubility (Sol) ",
  "as compared to typical compounds. (p = ", res_1a$p.value, ", z-score = ", res_1a$statistic, ")"
))
# 1b. We reject the null hypothesis that there is no different in the mean solubility
# between the drugs and the typical compounds.
# The drugs in the table show a significantly different solubility (Sol) as compared to typical compounds.
# (p = 3.89389767525749e-05, z-score = 4.11368673991869)


###
### QUESTION 2
### 15 pts total
### 2A 6 pts code, 4 pts annotation
### 2B 5 pts
###
## This question will also use the "drugs" dataframe

## The drugs in the table have all been tested experimentally for toxicity, and are labeled "high", "moderate", and "low" in the column "Toxicity_level" 
## It has been hypothesized that toxicity is primarily a function of how much protein binding the drug undergoes (measured in the column "Protein_bind")

## Q2A. By dividing the drugs into 2 classes, those with "high" toxicity and combining 
## those with "moderate" and "low" toxicity, test this hypothesis using the appropriate statistical methods
## Make sure to perform any additional analyses needed to assess whether a specific test is appropriate to use.

drugs_high_toxicity <- drugs[drugs$Toxicity_Level == "High", ]
drugs_low_moderate_toxicity <- drugs[drugs$Toxicity_Level != "High", ]

# Normal distribution for high (p>0.05)
# Non-normal distribution for low moderate (p<0.05)
norm_res_2a_high <- shapiro.test(drugs_high_toxicity$Protein_bind)
norm_res_2a_low_moderate <- shapiro.test(drugs_low_moderate_toxicity$Protein_bind)
stopifnot(norm_res_2a_high$p.value > 0.05)
stopifnot(norm_res_2a_low_moderate$p.value < 0.05)

# Use Mann-Whitney U-tes since one of distributions is non-normal
res_2a <- wilcox.test(
  drugs_high_toxicity$Protein_bind,
  drugs_low_moderate_toxicity$Protein_bind
)

## Q2B. Interpret the results of your tests.

# [As a comment, provide your answer to Q2B]

# p-value is >0.05 so cannot reject null hypothesis that there is 
# no difference beween high toxicity and low/moderate toxicity drugs in protein binding
stopifnot(res_2a$p.value > 0.05)
printc(paste0(
  "2b. We fail to reject the null hypothesis that there is no difference ",
  "between the median protein binding between high and low/moderate toxicity drugs. ",
  "(p = ", res_2a$p.value, ", statistic = ", res_2a$statistic, ")"
))
# 2b. We fail to reject the null hypothesis that there is no difference
# between the median protein binding between high and low/moderate toxicity drugs.
# (p = 0.63799008334406, statistic = 264)

###
### QUESTION 3
### 36 pts total 
### Parts A-C are each worth 12 pts (4 pts for code, 4 pts for annotation, 4 pts for interpretation)

### For this problem, you will test specific hypotheses related to real-world glucose data.
### Students were split into two groups depending if they reported having fasted for at least 8 hours prior to class or not.
### Students had their blood glucose measured at the beginning of class, they then consumed a sugary drink
### and then their blood glucose was measured again at the end of class.
### The data are contained in the data file "Glucose_data.RData", which you should download from Canvas.
### From the file, the dataset "fasting" contains before and after data for students who reported having fasted, and
### "fed" contains data for those students who reported that they did not fast.
### Both files contain paired data of each student before consuming the sugary drink and after measurements taken at the end of class

## Q3A. Use R to test the null hypothesis: "For individuals who had previously fasted, there is no difference  
## in their glucose levels before drinking juice vs after drinking juice".
## Make sure to perform any needed tests for your analysis and to annotate your code.
## Then, provide your interpretation of the result of the hypothesis test. Your explanation 
## should state the significance level you chose, the p value you obtained, and 
## an explanation of how you interpret your result with respect to the null hypothesis

# Paired data so first check that differences between distributions is normally distributed
norm_res_3a <- shapiro.test(fasting$Before - fasting$After)

# p-value is greater than 0.05 so means differences between groups of fasting data is normally distributed
stopifnot(norm_res_3a$p.value > 0.05)

# use paired t-test since differences between groups of fasting data is normally distributed
res_3a <- t.test(fasting$Before, fasting$After, paired = T)

# [As a comment, provide your interpretation of your results for Q3A]
stopifnot(res_3a$p.value < 0.05)
printc(paste0(
  "3a. We can reject the null hypothesis that for individuals who had previously fasted, there is no difference ", 
  "in their glucose levels before drinking juice vs after drinking juice",
  " (alpha=0.05, p = ", res_3a$p.value, ", statistic = ", res_3a$statistic, ")"
))
# 3a. We can reject the null hypothesis that for individuals who had previously fasted,
# there is no difference in their glucose levels before drinking juice vs after drinking juice
# (alpha=0.05, p = 1.65796987955664e-12, statistic = -10.3768027185464)

## Q3B. Use R to test the null hypothesis: "For individuals who did not fast (fed individuals), there is no difference in their glucose 
## levels before drinking juice vs after drinking juice".
## Make sure to perform any needed tests for your analysis and to annotate your code.
## Provide your interpretation of the result of the hypothesis test. Your explanation 
## should state the significance level you chose, the p value you obtained, and 
## an explanation of how you interpret your result with respect to the null hypothesis

# Paired data so first check that differences between distributions is normally distributed
norm_res_3b <- shapiro.test(fed$Before - fed$After)

# p-value is less than 0.05 so means differences between groups of fed data is NOT normally distributed
stopifnot(norm_res_3b$p.value < 0.05)

# use wilcox signed rank test since differences between groups of fed data is NOT normally distributed
# ignore ties in calculating exact p-value
res_3b <- wilcox.test(fed$Before, fed$After, paired=T, exact = F)

# [As a comment, provide your interpretation of your results for Q3B]
stopifnot(res_3b$p.value < 0.05)
printc(paste0(
  "3b. We can reject the null hypothesis that for individuals who did not fast (fed individuals), there is no difference ", 
  "in their glucose levels before drinking juice vs after drinking juice",
  " (alpha=0.05, p = ", res_3b$p.value, ", statistic = ", res_3b$statistic, ")"
))

# 3b. We can reject the null hypothesis that for individuals who did not fast (fed individuals),
# there is no difference in their glucose levels before drinking juice vs after drinking juice
# (alpha=0.05, p = 3.61029197989574e-05, statistic = 5)

## Q3C. Use R to test the null hypothesis: "There is no difference in glucose levels between fasted and non-fasted 
## individuals before drinking juice".
## Make sure to perform any needed tests for your analysis and to annotate your code.
## Provide your interpretation of the result of the hypothesis test. Your explanation 
## should state the significance level you chose, the p value you obtained, and 
## an explanation of how you interpret your result with respect to the null hypothesis

# No longer paired data (n=38 for fasted and n=24 for fed)
# Check normality of before data
norm_res_3c_fasting_before <- shapiro.test(fasting$Before)
norm_res_3c_fed_before <- shapiro.test(fed$Before)
# Both datasets have p-values >0.05, so we cannot reject null hypothesis that data is from normal distribution
# Is normally distributed
stopifnot(norm_res_3c_fasting_before$p.value > 0.05)
stopifnot(norm_res_3c_fed_before$p.value > 0.05)

# Perform variance test
var_res_3c <- var.test(fasting$Before, fed$Before)
# p-value greater than 0.05 so cannot reject H0 that variance beween groups are equal
# Variance is equal
var_is_equal_3c <- var_res_3c$p.value > 0.05
stopifnot(var_is_equal_3c)

# t-test since data is normally distributed and not paired data
res_3c <- t.test(
  fasting$Before,
  fed$Before,
  var.equal = var_is_equal_3c
)

# [As a comment, provide your interpretation of your results for Q3C]
stopifnot(res_3c$p.value > 0.05)
printc(paste0(
  "3c. We fail to reject the null hypothesis that there is no difference in glucose levels ",
  "between fasted and non-fasted individuals before drinking juice",
  " (alpha=0.05, p = ", res_3c$p.value, ", statistic = ", res_3c$statistic, ")"
))
# 3c. We fail to reject the null hypothesis that there is no difference in glucose levels
# between fasted and non-fasted individuals before drinking juice
# (alpha=0.05, p = 0.0650855971695356, statistic = -1.87913443525193)


###
### QUESTION 4
### 34 pts total
### Q4A: 10 pts
### Q4B: 18 pts
### Q4C: 6 pts

## For Q4, you will analyze a dataset of bird observations taken in two habitats:
## "Disturbed" and "Undisturbed". You can download the file “Bird_data.Rdata”
## from Canvas and load it into RStudio.

## Q4A. Use R to calculate a Chi-square value, p-value, and degrees of freedom for this table. 
## Make sure to provide annotation for your code.
## Provide the values that you calculated.
## Lastly, in 1-2 sentences, provide an interpretation of your results.  

# use chi-squared test on bird observation data counts since categorical
res_4a <- chisq.test(as.matrix(bird_data))

printc(paste0(
  "4a. The chi-squared value is ", res_4a$statistic, ".\n",
  "4a. The p-value is ", res_4a$p.value, ".\n",
  "4a. The degrees of freedom are ", res_4a$parameter, "."
))

# [As a comment, provide your interpretation of your results for Q4A]
stopifnot(res_4a$p.value < 0.05)
printc(paste0(
  "4a. We reject the null hypothesis that the proportions ",
  "within the disturbed and undisturbed columns are the same. ",
  "There is some difference in proportion for one or more birds between disturbed and undisturbed groups. ",
  " (alpha=0.05, p = ", res_4a$p.value, ", chi-squared statistic = ", res_4a$statistic, ")"
))

## Q4B. To identify which, if any, bird species show a different distribution in 
## the two habitats, compare each of the 6 species to an amalgamation (a sum) of 
## the other five species in the table.  For each comparison, use R to perform 
## a Chi-square 2x2 matrix analysis (with correction) to produce a p value.
## Make sure to provide annotation for your code.
## Then, provide a list of the p values that you calculated.  

for (bird in rownames(bird_data)) {
  # Create 2x2 table for each bird
  # Filter for specific bird by row name and map to row, specific
  # Filter for all other birds by row name and map to row, other
  mtx_bird_and_other <- rbind(
    specific=bird_data[rownames(bird_data) == bird, ],
    other=colSums(bird_data[rownames(bird_data) != bird, ])
  )
  # Greater than 5 in count to meet assumption
  stopifnot(min(mtx_bird_and_other) >= 5)

  # Perform chi-square test since assumptions met
  # Also Yates' continuity correction for more accurate p-value
  res_4b_bird <- chisq.test(mtx_bird_and_other, correct = T)

  # Does meet p-value threshold?
  if (res_4b_bird$p.value < 0.05) {
    outcome <- "reject"
  } else {
    outcome <- "fail to reject"
  }

  # print message
  printc(paste0(
    "4b. We ", outcome, " the null hypothesis that there is no significant difference ",
    "between the proportions within disturbed and undisturbed birds ",
    "for ", bird, " compared to all other birds. ",
    "(alpha=0.05, ", "p-value = ", res_4b_bird$p.value, ", chi-squared statistic = ", res_4b_bird$statistic,  ")"
  ))
  # And for the comment.
  # printc(paste0(bird, " = ", res_4b_bird$p.value))
}

# 4b. P-values
# Ruby-crowned kinglet = 1.42870474661889e-07
# Lincoln's sparrow = 7.22700106812187e-11
# Bushtit = 0.289307593665988
# Spotted towhee = 0.0377520196746447
# Hermit thrush = 0.00149359849351152
# Dark-eyed junco = 3.75854499132085e-06


## Q4C. In 1-2 sentences, provide an interpretation of your results from Q4B

# [As a comment, provide your answer for Q4C.]  

# 4c. We find that the proportion in disturbed and undisturbed birds is significantly different (p < 0.05) for
# Ruby-crowned kinglet (p = 1.43e-7), Ruby-crowned kinglet (p = 7.23e-11),
# Spotted towhee (p = 0.0378), Hermit thrush (p = 0.00149), and Dark-eyed junco (p = 3.76e-6)
# compared to all other birds

###end of PS2