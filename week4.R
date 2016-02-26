score <- read.csv("http://courses.atlas.illinois.edu/spring2016/STAT/STAT200/RProgramming/data/Stat100-Final_ExamAve_cleaned.csv")
N <- nrow(score) # number of students
set.seed(27946145)
subset <- sample.int(N,100)
score_subset <- score[subset, ]
cor_final_ave<-cor(score_subset$ExamAve,score_subset$Final)
slope_fa<-cor_final_ave*(sd(score_subset$Final)/sd(score_subset$ExamAve))
std_error<-(1-cor_final_ave**2)**0.5*sd(score_subset$Final)/(100**0.5*sd(score_subset$ExamAve))
cor_pop<-cor(score$Final,score$ExamAve)
slope_pop<-cor_pop*(sd(score$Final)/sd(score$ExamAve))
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
##hist(slope, breaks=100, freq=FALSE)
##abline(v=mean(slope), col="blue", lwd=2)
##curve(dnorm(x,mean(slope),sd(slope)), col="red", add=TRUE)


hist(r, breaks=100, freq=FALSE)
abline(v=mean(r), col="blue", lwd=2)
curve(dnorm(x,mean(r),sd(r)), col="red", add=TRUE)
mean_r<-mean(r)
sd_r<-sd(r)
z_r<-(0.85-mean_r)/(sd_r*sqrt(10000))
>a<-r[r>0.85]
 length(a)/length(r)