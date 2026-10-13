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

##  Typical compounds have a mean solubility of 30.4 with a sd of 8.1 and show a normal distribution.
##  Using the z-test and the dataset "drugs", calculate whether the drugs 
##  in the table show a significantly different solubility (Sol) as compared to typical compounds, 
##  using an alpha of 0.05. Make sure to perform any additional analyses needed to assess whether a 
##  specific test is appropriate to use.

## Q1A. Provide the annotated R code that you use to calculate the statistics.

[Provide the annotated R code that you use to answer 1A]

## Q1B. Provide your interpretation of the result of the test. Specifically, you should 
## report the z-score of the test, the p value this z score represents, and whether you 
## should accept or reject the null hypothesis of no difference.

# [As a comment, provide your answer to Q1B]




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

[Provide the annotated R code that you use to answer Q2A]

## Q2B. Interpret the results of your tests.

# [As a comment, provide your answer to Q2B]




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

[Provide the annotated R code that you use to answer Q3A]

# [As a comment, provide your interpretation of your results for Q3A]


## Q3B. Use R to test the null hypothesis: "For individuals who did not fast (fed individuals), there is no difference in their glucose 
## levels before drinking juice vs after drinking juice".
## Make sure to perform any needed tests for your analysis and to annotate your code.
## Provide your interpretation of the result of the hypothesis test. Your explanation 
## should state the significance level you chose, the p value you obtained, and 
## an explanation of how you interpret your result with respect to the null hypothesis

[Provide the annotated R code that you use to answer Q3B]

# [As a comment, provide your interpretation of your results for Q3B]


## Q3C. Use R to test the null hypothesis: "There is no difference in glucose levels between fasted and non-fasted 
## individuals before drinking juice".
## Make sure to perform any needed tests for your analysis and to annotate your code.
## Provide your interpretation of the result of the hypothesis test. Your explanation 
## should state the significance level you chose, the p value you obtained, and 
## an explanation of how you interpret your result with respect to the null hypothesis

[Provide the annotated R code that you use to answer Q3C]

# [As a comment, provide your interpretation of your results for Q3C]




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

[Provide the annotated R code that you use to answer Q4A]

# [As a comment, provide your interpretation of your results for Q4A]

## Q4B. To identify which, if any, bird species show a different distribution in 
## the two habitats, compare each of the 6 species to an amalgamation (a sum) of 
## the other five species in the table.  For each comparison, use R to perform 
## a Chi-square 2x2 matrix analysis (with correction) to produce a p value.
## Make sure to provide annotation for your code.
## Then, provide a list of the p values that you calculated.  

[Provide the annotated R code that you use to answer Q4B and the output of your code as a comment]

## Q4C. In 1-2 sentences, provide an interpretation of your results from Q4B

# [As a comment, provide your answer for Q4C.]  

###end of PS2