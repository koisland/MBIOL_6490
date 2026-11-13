### PROBLEM SET 3 2026

### IMPORTANT: SEE FULL INSTRUCTIONS IN CANVAS. 
###
### Reminders: You will provide your answers in this template by replacing the   
### square-bracketed sections (including brackets and all text) with your answers. 
### DO NOT alter or delete anything apart from square-bracketed sections.
### For full credit, your blocks of code MUST RUN WITHOUT MODIFICATION, each line 
### of code must be annotated, and the answer needs to be correct. 
### When you submit this assignment in Canvas, you will need to upload:
### one .R file with your code and text answers, plus
### four PDFs with the plots you create for Q3. 

###
### QUESTION 1
### 36 pts total
### 
### For Q1, you will perform analysis of a NEW dataset file for real-world glucose data 
### collected for Biostats students. IMPORTANT: you need to download the new PS3 data file - 
### DO NOT USE the PS2 file. 
###  "fasting" contains data for those students who reported having fasted for at least 8 
###  hours prior to class. "fed" contains data for those students who reported 
###  that they did not fast. These datasets are in Canvas as "Glucose_data_PS3.RData"
###  Use a significance level of alpha = 0.01.

# Load libaries
library(pwr)
library(car)
library(reshape2)
library(effsize)

# Global alpha for Q1
alpha <- 0.01

# Load glucose data
load("Glucose_data_PS3.RData")

##   
## 1A. You previously (in PS2) tested the null hypothesis:
##  "For individuals who had previously fasted, there is no difference in their  
##   glucose levels before drinking juice vs after drinking juice"
##
##  Use R to calculate the effect size (Cohen's d) and power for the relevant group 
##  comparison, and explain your result with respect to effect size, power, and 
##  Type II error rate.

##  1Ai. 3 pts. Provide the annotated R code that you use for your calculations.

# Check the data distribution (normal? outliers?)
norm_res_1a_fasting_before <- shapiro.test(fasting$Before)
norm_res_1a_fasting_after <- shapiro.test(fasting$After)

# Both datasets have p-values >0.05, so we cannot reject null hypothesis that data is from normal distribution
# Is normally distributed

# Check for unequal variances (*)
# p-value greater than 0.05 so cannot reject H0 that variance beween groups are equal
# Variance is equal
var_res_1a <- var.test(fasting$Before, fasting$After)

# Use effsize::cohen.d to calculate the effect size of the paired dataset
res_1a <- cohen.d(
    fasting$Before,
    fasting$After,
    paired = T
)
# Use to calculate power using cohen's d from previous line.
res_1a_pwr <- pwr.t.test(
    # Number of pairs for n
    n = length(fasting$Before),
    # Use estimate calculated from cohen.d
    d = res_1a$estimate,
    sig.level = alpha,
    # Is paired data
    type = "paired",
    alternative = "two.sided"
)

##  1Aii. 2 pts. Provide the value for effect size that you calculated.  

# [As a comment, provide your answer to Q1Aii.]
# The effect size is -2.3.

##  1Aiii. 2 pts. Provide the value for power that you calculated.

# [As a comment, provide your answer to Q1Aiii.]
# The power is 1.

##  1Aiv. 2 pts. In 1-3 sentences, explain the interpretation of your result with respect
##  to effect size and Type II error rate.

# [As a comment, provide your answer to Q1Aiv.]
# For those who had previously fasted, the difference in glucose levels before and after drinking juice is large (|-2.3| > 0.8)
# With this effect size, we have a power of 1, meaning we expect to have a Type II error rate of 0.

##   
## 1B. You previously tested the null hypothesis:
## "For individuals who did not fast, there is no difference in their glucose 
## levels before drinking juice vs after drinking juice"
##
##  Use R to calculate the effect size (Cohen's d) and power for the relevant group 
##  comparison, and explain your result with respect to effect size, power, and 
##  Type II error rate.

##  1Bi. 3 pts. Provide the annotated R code that you use for your calculations.

# Check the data distribution (normal? outliers?)
norm_res_1b_fed_before <- shapiro.test(fed$Before)
norm_res_1b_fed_after <- shapiro.test(fed$After)

# Both datasets have p-values >0.05, so we cannot reject null hypothesis that data is from normal distribution
# Is normally distributed

# Check for unequal variances (*)
# p-value less than 0.05 so we reject H0 that variance between groups are equal
# Variance is not equal
var_res_1b <- var.test(fed$Before, fed$After)

# Calculate effect size
res_1b <- cohen.d(
    fed$Before,
    fed$After,
    paired = T
)
# Use effect size and determine power.
res_1b_pwr <- pwr.t.test(
    # Number of pairs for n
    n = length(fed$Before),
    # Use estimate calculated from cohen.d
    d = res_1b$estimate,
    sig.level = alpha,
    # Is paired data
    type = "paired",
    alternative = "two.sided"
)

##  1Bii. 2 pts. Provide the value for effect size that you calculated.  

# [As a comment, provide your answer to Q1Bii.]
# The effect size is 1.11.

##  1Biii. 2 pts. Provide the value for power that you calculated.

# [As a comment, provide your answer to Q1Biii.]
# The power is 0.992.

##  1Biv. 2 pts. In 1-3 sentences, explain the interpretation of your result with respect
##  to effect size and Type II error rate.

# [As a comment, provide your answer to Q1Biv.]
# For those who did not fast, the difference in glucose levels before and after drinking juice is large (|-1.11| > 0.8)
# With this effect size, we have a power of 0.992, meaning we expect to have a Type II error rate of 0.008.

##   
## 1C. You previously tested the null hypothesis:
## "There is no difference in glucose levels between fasted and non-fasted 
##  individuals before drinking juice."
##
##  Use R to calculate the effect size (Cohen's d) and power for the relevant group 
##  comparison, and explain your result with respect to effect size, power, and 
##  Type II error rate.

#  1Ci. 3 pts. Provide the annotated R code that you use for your calculations.

# Check the data distribution (normal? outliers?)
norm_res_1c_fasting_before <- shapiro.test(fasting$Before)
norm_res_1c_fed_before <- shapiro.test(fed$Before)

# Both datasets have p-values >0.05, so we cannot reject null hypothesis that data is from normal distribution
# Is normally distributed

# Check for unequal variances (*)
# p-value greater than 0.05 so we cannot reject H0 that variance between groups are equal
# Variance is equal
var_res_1c <- var.test(fasting$Before, fed$Before)

# Use effsize::cohen.d to calculate the effect size of the paired dataset
res_1c <- cohen.d(
    fasting$Before,
    fed$Before,
    # Datasets are not equal and therefore, not paired
    paired = length(fasting$Before) == length(fed$Before)
)
# With two different n's, cannot use pwr.t.test
res_1c_pwr <- pwr.t2n.test(
    n1 = length(fasting$Before),
    n2 = length(fed$Before),
    d = res_1c$estimate,
    sig.level = alpha,
    alternative = "two.sided"
)

## 1Cii. 2 pts. Provide the value for effect size that you calculated.  

# [As a comment, provide your answer to Q1Cii.]
# The effect size is -0.490.

## 1Ciii. 2 pts. Provide the value for power that you calculated.

# [As a comment, provide your answer to Q1Ciii.]
# The power is 0.227

## 1Civ. 2 pts. In 1-3 sentences, explain the interpretation of your result with respect
##          to effect size and Type II error rate.

# [As a comment, provide your answer to Q1Civ.]
# The difference in glucose levels before drinking juice between fasting and fed individuals is small (|-0.490| < 0.5)
# With this effect size, we have a power of 0.227, meaning we expect to have a Type II error rate of 0.773.

## 1Cv. 2 pts. In 1-3 sentences, compare your result for part 1C to that obtained in part 
##  1A and 1B.

# [As a comment, provide your answer to Q1Cv.]
# Compared to parts 1A (power=1.0) and 1B (power=0.992), the power for 1C (power=0.227) is much lower
# meaning we're very likely to fail to reject a false null hypothesis (high beta).

## 1Cvi. Use R to determine how many pairs of samples would be required to achieve
##  a power of 0.8.

##  3 pts. Provide the annotated R code that you use for your calculations.

# Use to calculate n for a given power and our cohen d estimate from before
res_1c_vi <- pwr.t.test(
    power = 0.8,
    d = res_1c$estimate,
    sig.level = alpha,
    type = "paired",
    alternative = "two.sided"
)

## 1Cvii. 2 pts. Provide the value that you calculated.  

# [As a comment, provide your answer to Q1Cvii.]

# We would need 52 pairs of samples to reach a power of 0.8.

## 1Cviii. 2 pts. In 1-3 sentences, explain why the number of samples required to achieve 
#  a power of 0.8 is different from what you calculated previously.

# [As a comment, provide your answer to Q1Cviii.]

# In order to increase power, we also need to increase the number of samples. This is because beta decreases with sample size.

###
### QUESTION 2
### 35 pts total
## 
## For Q2, you will use the dataset shown below. 
##  To collect these data, a friend studied the effects of fertilizer 
##  type and watering frequency on plant growth. 
##  She conducted an experiment where three different fertilizer 
##  types (A, B, and C) were tested under two watering frequencies (Low and High). 
##  The dependent variable measured was plant height (in cm) after 4 weeks. She
##  asks for help with the analysis.

# Low	High
# A	12	18
# A	14	19
# A	15	20
# B	16	21
# B	17	23
# B	18	22
# C	13	16
# C	14	17
# C	15	18

## 2A. Unfortunately, she forgot to attach an appropriately-formatted data file 
##  to her email message. You don't mind too much, because you know how to format 
##  the data yourself. 

## 2Ai. 3 pts. Use R to create this dataset in RStudio (note that "A", "B", "C" are row names, 
## and "Low" and "High" are column names).
## Provide the annotated R code that you use for your analysis.

mtx_2ai <- rbind(
    c(12, 18),
    c(14, 19),
    c(15, 20),
    c(16, 21),
    c(17, 23),
    c(18, 22),
    c(13, 16),
    c(14, 17),
    c(15, 18)
)
colnames(mtx_2ai) <- c("Low", "High")
rownames(mtx_2ai) <- c("A", "A", "A", "B", "B", "B", "C", "C", "C")

## 2Aii. 3 pts. Next, create the appropriate long-form data from this initial dataset.
## Provide the annotated R code that you use for your analysis.

mtx_2ai_long <- melt(mtx_2ai)
colnames(mtx_2ai_long) <- c("fertilizer", "watering_frequency", "plant_height")

## 2Aiii. 2 pts. How many factors and how many levels of each factor does your long-form dataset contain?

# [As a comment, provide your answer to Q2Aiii.]

# Loop through columns that are factors and get length to write comment
for (col in colnames(mtx_2ai_long)) {
    if (col == "plant_height") {
        next
    }
    num_levels <- length(unique(mtx_2ai_long[[col]]))
    print(paste0("The factor, '", col, "', has ", num_levels, " levels."))
}
# The factor, 'fertilizer', has 3 levels.
# The factor, 'watering_frequency', has 2 levels.

## 2B. Check the data for homogeneity of variance (you should just assume the data is normally distributed)
## 2Bi. 3 pts. Provide the annotated R code that you use for your analysis.

# plant height dependent variable
# fertilizer/plant height independent variable
res_2bi_var_similar_fertilizer <- leveneTest(
    plant_height ~ fertilizer,
    data = mtx_2ai_long
)
res_2bi_var_similar_watering_frequency <- leveneTest(
    plant_height ~ watering_frequency,
    data = mtx_2ai_long
)

## 2Bii. 2 pts. Provide the values that you calculated.

# [As a comment, provide your answer to Q2Bii.]

# The F value and p-value for the test for homogeneity of variance of plant_height with respect to fertilizer
# is 2.4157 and 0.1232, respectively.

# The F value and p-value for the test for homogeneity of variance of plant_height with respect to watering frequency
# is 0.6154 0.4442, respectively.

## 2Biii. 3 pts. In 1-2 sentences, provide an interpretation of the variance testing results.

# [As a comment, provide your answer to Q2Biii.]

# The variance of plant height is equal across the fertilizer and watering_frequency factors.
# We observe a p-value > 0.05, so we fail to reject the H0 that variance of plant_height is equal. 

## 2C. Perform one-way ANOVA to determine whether (1) fertilizer type and 
##  (2) watering frequency has/have a significant effect on plant height.
## For both parts, use an alpha of 0.05

alpha_2 <- 0.05

## 2Ci. 4 pts. Provide the annotated R code that you use for your analysis.

# Dependent variable is plant height
# Independent variable is fertilizer
anova_plant_height_fertilizer <- aov(
    formula = plant_height ~ fertilizer,
    data = mtx_2ai_long
)
# Get F and p-value from anova 
summary_anova_plant_height_fertilizer <- summary(anova_plant_height_fertilizer)

# Dependent variable is plant height
# Independent variable is watering_frequency
anova_plant_height_watering_frequency <- aov(
    formula = plant_height ~ watering_frequency,
    data = mtx_2ai_long
)
# Get F and p-value from anova 
summary_anova_plant_height_watering_frequency <- summary(anova_plant_height_watering_frequency)

## 2Cii. 2 pts. Provide the values that you calculated.

# [As a comment, provide your answer to Q2Cii.]

# For fertilizer's effect on plant height, the F-value is 3.7 with a significant p-value of 0.0494.
# For watering frequency's effect on plant height, the F-value is 19.51 with a significant p-value of 0.000432.

## 2Ciii. 3 pts. In 1-2 sentences, provide an interpretation of the ANOVA results.

# [As a comment, provide your answer to Q2Ciii.]

# Fertilizer has a significant effect (0.0494 < 0.05) on plant height
# Watering frequency has a significant effect (0.000432 < 0.05) on plant height.

## 2D. Use R to perform the appropriate multi-comparison tests needed
##  to determine which pairs of treatments result in differential plant growth 
##  at a significance level of 0.05. 

## 2Di. 4 pts. Provide the annotated R code that you use for your analysis.

# Get directionality, magnitude, and adjusted p-value for pairs of factors from anovas
tukey_anova_plant_height_fertilizer <- TukeyHSD(anova_plant_height_fertilizer)
tukey_anova_plant_height_watering_frequency <- TukeyHSD(anova_plant_height_watering_frequency)

## 2Dii. 2 pts. Provide the values that you calculated.

# [As a comment, provide your answer to Q2Dii.]

# The difference in plant height between B and A fertilizer is 3.167 with an adjusted p-value of 0.137.
# The difference in plant height between C and A fertilizer is -0.833 with an adjusted p-value of 0.854.
# The difference in plant height between C and B fertilizer is 4.00 with an adjusted p-value of 0.0519.

# The difference in plant height between High and Low watering frequency is 4.44 with an adjusted p-value of 0.000432.

## 2Diii. 4 pts. In 2-4 sentences, provide an interpretation of the results.

# [As a comment, provide your answer to 2Diii]
# There is a significant (p-val: 0.000432 < 0.05) positive difference (4.44) in mean plant height between the high and low watering frequency.

###
### QUESTION 3 
### 29 pts total
##
## This question involves some visualization and p value adjustments to explore a dataset. 
## You will use the dataset "plotting" to answer it. Download the dataset (plotting.RData) from Canvas and open it in R

## 3A. 5 pts Use the R function plot() to create a scatterplot from columns x and y of "plotting". 
## Provide your code.

load("plotting.RData")

# Create PDF device and file
pdf("plot_3b.pdf")
# Plot x and y
plot(plotting$x, plotting$y)
# Close PDF device
dev.off()

## 3B. 5 pts. Save your plot as a .pdf file, using the “export” menu. 
## Upload the PDF to Canvas.

## 3C. The column "raw" in "plotting" contains a raw p-value for each of the data points
## Create a new column in the "plotting" dataframe made from adjusting the raw p-values using the Bonferroni correction.
## Next, plot the points in "plotting" in which the Bonferroni corrected p value <= 0.05
## You will show your code, save your plot as a .pdf file, using the “export” menu, 
## and upload the file to Canvas.

## 3Ci. 4 pts. Provide the code for 3C.

# Add new column, adj with bonferroni corrected p-values
plotting$adj_bonf <- p.adjust(plotting$raw, method = "bonferroni")

# New PDF device with new file
pdf("plot_3c.pdf")
# Plot x and y but subset plotting dataframe where adjusted p-value is less than 0.05
plot(
    plotting[plotting$adj_bonf <= 0.05, ]$x,
    plotting[plotting$adj_bonf <= 0.05, ]$y
)
# Close PDF device
dev.off()

## 3Cii. 2 pts. Upload the PDF to Canvas.

## 3D. Create a new column in the "plotting" dataframe made from adjusting the 
## raw p-values using the BH (fdr) correction. 
## Then, plot the points in the "plotting" dataframe in which the BH corrected p value <= 0.05

## 3Di. 3 pts. Provide your code for Q3D.

plotting$adj_bh <- p.adjust(plotting$raw, method = "BH")

# New PDF device with new file
pdf("plot_3d.pdf")
# Plot x and y but subset plotting dataframe where adjusted p-value is less than 0.05
# T-rex!
plot(
    plotting[plotting$adj_bh <= 0.05, ]$x,
    plotting[plotting$adj_bh <= 0.05, ]$y
)
# Close PDF device
dev.off()

## 3Dii. 2 pts. Upload the PDF to Canvas.

## 3E. Personalize your plot from 3D.
## a) Within the plot() function, add the parameter main = "Hello, my name is [your name]" 
## b) Change the plot’s appearance. You can choose your own combination of dot pattern/color/size, 
## as long as it is not the default and the image is recognizable. 

## 3Ei. 4 pts. Provide your code and save your personalized plot as a .pdf file, using the “export” menu. 

pdf("plot_3e.pdf")
plot(
    plotting[plotting$adj_bh <= 0.05, ]$x,
    plotting[plotting$adj_bh <= 0.05, ]$y,
    main = "Hello, my name is Keith",
    col = "chocolate",
    pch = 20
)
dev.off()

## 3Eii. 4 pts. Upload the PDF plot to Canvas.

###
### END OF PROBLEM SET 3