score <- read.csv("http://courses.atlas.illinois.edu/spring2016/STAT/STAT200/RProgramming/data/Stat100-Final_ExamAve_cleaned.csv")
r <- NULL
slope <- NULL
set.seed(27946145)
for (i in 1:1e4) {
  subset <- sample.int(N,100)
  score_subset <- score[subset,]
  r_subset <- cor(score_subset$Final, score_subset$ExamAve)
  slope_subset <- r_subset*sd(score_subset$Final)/sd(score_subset$ExamAve)
  r <- c(r, r_subset)
  slope <- c(slope, slope_subset)
}
