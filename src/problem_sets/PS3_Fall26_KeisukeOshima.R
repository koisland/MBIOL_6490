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

##   
## 1A. You previously (in PS2) tested the null hypothesis:
##  "For individuals who had previously fasted, there is no difference in their  
##   glucose levels before drinking juice vs after drinking juice"
##
##  Use R to calculate the effect size (Cohen's d) and power for the relevant group 
##  comparison, and explain your result with respect to effect size, power, and 
##  Type II error rate.

##  1Ai. 3 pts. Provide the annotated R code that you use for your calculations.

[Provide the annotated R code that you use to answer 1Ai]

##  1Aii. 2 pts. Provide the value for effect size that you calculated.  

# [As a comment, provide your answer to Q1Aii.]

##  1Aiii. 2 pts. Provide the value for power that you calculated.

# [As a comment, provide your answer to Q1Aiii.]

##  1Aiv. 2 pts. In 1-3 sentences, explain the interpretation of your result with respect
##  to effect size and Type II error rate.

# [As a comment, provide your answer to Q1Aiv.]

##   
## 1B. You previously tested the null hypothesis:
## "For individuals who did not fast, there is no difference in their glucose 
## levels before drinking juice vs after drinking juice"
##
##  Use R to calculate the effect size (Cohen's d) and power for the relevant group 
##  comparison, and explain your result with respect to effect size, power, and 
##  Type II error rate.

##  1Bi. 3 pts. Provide the annotated R code that you use for your calculations.

[Provide the annotated R code that you use to answer 1Bi]

##  1Bii. 2 pts. Provide the value for effect size that you calculated.  

# [As a comment, provide your answer to Q1Bii.]

##  1Biii. 2 pts. Provide the value for power that you calculated.

# [As a comment, provide your answer to Q1Biii.]

##  1Biv. 2 pts. In 1-3 sentences, explain the interpretation of your result with respect
##  to effect size and Type II error rate.

# [As a comment, provide your answer to Q1Biv.]

##   
## 1C. You previously tested the null hypothesis:
## "There is no difference in glucose levels between fasted and non-fasted 
##  individuals before drinking juice."
##
##  Use R to calculate the effect size (Cohen's d) and power for the relevant group 
##  comparison, and explain your result with respect to effect size, power, and 
##  Type II error rate.

#  1Ci. 3 pts. Provide the annotated R code that you use for your calculations.

[Provide the annotated R code that you use to answer 1Bi]

## 1Cii. 2 pts. Provide the value for effect size that you calculated.  

# [As a comment, provide your answer to Q1Cii.]

## 1Ciii. 2 pts. Provide the value for power that you calculated.

# [As a comment, provide your answer to Q1Ciii.]

## 1Civ. 2 pts. In 1-3 sentences, explain the interpretation of your result with respect
##          to effect size and Type II error rate.

# [As a comment, provide your answer to Q1Civ.]

## 1Cv. 2 pts. In 1-3 sentences, compare your result for part 1C to that obtained in part 
##  1A and 1B.

# [As a comment, provide your answer to Q1Cv.]

## 1Cvi. Use R to determine how many pairs of samples would be required to achieve
##  a power of 0.8.

##  3 pts. Provide the annotated R code that you use for your calculations.

[Provide the annotated R code that you use to answer 1Cvi]

## 1Cvii. 2 pts. Provide the value that you calculated.  

# [As a comment, provide your answer to Q1Cvii.]

## 1Cviii. 2 pts. In 1-3 sentences, explain why the number of samples required to achieve 
#  a power of 0.8 is different from what you calculated previously.

# [As a comment, provide your answer to Q1Cviii.]

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

Low	High
A	12	18
A	14	19
A	15	20
B	16	21
B	17	23
B	18	22
C	13	16
C	14	17
C	15	18

## 2A. Unfortunately, she forgot to attach an appropriately-formatted data file 
##  to her email message. You don't mind too much, because you know how to format 
##  the data yourself. 

## 2Ai. 3 pts. Use R to create this dataset in RStudio (note that "A", "B", "C" are row names, 
## and "Low" and "High" are column names).
## Provide the annotated R code that you use for your analysis.

[Provide the annotated R code that you use to answer Q2Ai.]

## 2Aii. 3 pts. Next, create the appropriate long-form data from this initial dataset.
## Provide the annotated R code that you use for your analysis.

[Provide the annotated R code that you use to answer Q2Aii.]

## 2Aiii. 2 pts. How many factors and how many levels of each factor does your long-form dataset contain?

# [As a comment, provide your answer to Q2Aiii.]

## 2B. Check the data for homogeneity of variance (you should just assume the data is normally distributed)
## 2Bi. 3 pts. Provide the annotated R code that you use for your analysis.

[Provide the annotated R code that you use to answer Q2Bi.]

## 2Bii. 2 pts. Provide the values that you calculated.

# [As a comment, provide your answer to Q2Bii.]

## 2Biii. 3 pts. In 1-2 sentences, provide an interpretation of the variance testing results.

# [As a comment, provide your answer to Q2Biii.]

## 2C. Perform one-way ANOVA to determine whether (1) fertilizer type and 
##  (2) watering frequency has/have a significant effect on plant height.
## For both parts, use an alpha of 0.05

## 2Ci. 4 pts. Provide the annotated R code that you use for your analysis.

[Provide the annotated R code that you use to answer Q2Ci.]

## 2Cii. 2 pts. Provide the values that you calculated.

# [As a comment, provide your answer to Q2Cii.]

## 2Ciii. 3 pts. In 1-2 sentences, provide an interpretation of the ANOVA results.

# [As a comment, provide your answer to Q2Ciii.]

## 2D. Use R to perform the appropriate multi-comparison tests needed
##  to determine which pairs of treatments result in differential plant growth 
##  at a significance level of 0.05. 

## 2Di. 4 pts. Provide the annotated R code that you use for your analysis.

[Provide the annotated R code that you use to answer Q2Di.]

## 2Dii. 2 pts. Provide the values that you calculated.

# [As a comment, provide your answer to Q2Dii.]

## 2Diii. 4 pts. In 2-4 sentences, provide an interpretation of the results.

# [As a comment, provide your answer to 2Diii]

###
### QUESTION 3 
### 29 pts total
##
## This question involves some visualization and p value adjustments to explore a dataset. 
## You will use the dataset "plotting" to answer it. Download the dataset (plotting.RData) from Canvas and open it in R

## 3A. 5 pts Use the R function plot() to create a scatterplot from columns x and y of "plotting". 
## Provide your code.

[Provide the annotated R code that you use to answer Q3A.]

## 3B. 5 pts. Save your plot as a .pdf file, using the “export” menu. 
## Upload the PDF to Canvas.

## 3C. The column "raw" in "plotting" contains a raw p-value for each of the data points
## Create a new column in the "plotting" dataframe made from adjusting the raw p-values using the Bonferroni correction.
## Next, plot the points in "plotting" in which the Bonferroni corrected p value <= 0.05
## You will show your code, save your plot as a .pdf file, using the “export” menu, 
## and upload the file to Canvas.

## 3Ci. 4 pts. Provide the code for 3C.

[Provide the annotated R code that you use to answer Q3C.]

## 3Cii. 2 pts. Upload the PDF to Canvas.

## 3D. Create a new column in the "plotting" dataframe made from adjusting the 
## raw p-values using the BH (fdr) correction. 
## Then, plot the points in the "plotting" dataframe in which the BH corrected p value <= 0.05

## 3Di. 3 pts. Provide your code for Q3D.

[Provide the annotated R code that you use to answer Q3D.]

## 3Dii. 2 pts. Upload the PDF to Canvas.

## 3E. Personalize your plot from 3D.
## a) Within the plot() function, add the parameter main = "Hello, my name is [your name]" 
## b) Change the plot’s appearance. You can choose your own combination of dot pattern/color/size, 
## as long as it is not the default and the image is recognizable. 

## 3Ei. 4 pts. Provide your code and save your personalized plot as a .pdf file, using the “export” menu. 

[Provide the annotated R code that you use to answer Q3E.]

## 3Eii. 4 pts. Upload the PDF plot to Canvas.

###
### END OF PROBLEM SET 3