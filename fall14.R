survey <- read.csv("http://courses.atlas.illinois.edu/spring2016/STAT/STAT200/RProgramming/data/Stat100_2014fall_survey01.csv")
#lm y: weight x: height
fit<-lm(weight~height,data=survey)
summary(fit)
#sample 100
N <- nrow(survey) # number of students
set.seed(62345206)
subset <- sample.int(N,100)
survey_subset <- survey[subset,]

#lm sub y:weight x:height
fit_sub<-lm(weight~height,data=survey_subset)
summary(fit_sub)
#1000 times
fit <- lm(weight~height, data=survey)
slope_pop <- fit$coefficients[2] # population slope

# Initialize slope_in_CI to a vector containing 1000 NA's
slope_in_CI <- rep(NA,1000) 

set.seed(62345206)
for (i in 1:1000) {
  subset <- sample.int(N,100)
  survey_subset <- survey[subset,]
  CI <- confint(lm(weight~height, data=survey_subset), "height", level=0.8)
  # Check to see if slope_pop is inside CI
  s_in_CI <-  (slope_pop > CI[1] & slope_pop < CI[2])
  slope_in_CI[i] <- s_in_CI
}
