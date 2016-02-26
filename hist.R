survey <- read.csv("http://courses.atlas.illinois.edu/spring2016/STAT/STAT200/RProgramming/data/Stat100_2012spring_survey03.csv")
library(lattice)
histogram(~religion|gayMarriage, data=survey)
#calculate the percentage for each ethnicity
percent<- function(ethnicity){
  ethnicity_split<-survey$gayMarriage[survey$religion==ethnicity]
  percentage<-sum(ethnicity_split=="Favor")/length(ethnicity_split)
  cat(percentage)
}

histogram(~origin|religion, data=survey)
