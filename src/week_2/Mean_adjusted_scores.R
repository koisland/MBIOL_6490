#Script to calculate grades for a quiz

#Create a vector with the raw quiz scores
raw_scores <- c(8,8,9,10,6,3,7,9,9,7)

#Create a vector with the score adjustment (everyone received an extra point)
adjustment <- c(1,1,1,1,1,1,1,1,1,1)

#alternative way to do the same thing
adjustment <- rep(1,10)

#Create a vector with adjusted scores
adj_scores <- raw_scores + adjustment

#Calculate the mean adjusted score
mean_adj_score <- mean(adj_scores)

#Reality check: calculate the mean of the raw scores
raw_mean <- mean(raw_scores)

#Output the raw and mean adjusted scores
cat(raw_mean)
cat(mean_adj_score)





