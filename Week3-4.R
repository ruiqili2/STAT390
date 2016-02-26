survey <- read.csv("Stat100_2013spring_survey01.csv")
#test<-cor(survey$Shoe_number,survey$Shoe_size)
#plot(Shoe_number ~ Shoe_size, data=survey, xlim=c(0,16))
#fit <- lm(Shoe_number ~ Shoe_size, data=survey)
#abline(fit)
library(lattice)
xyplot(Shoe_number ~ Shoe_size | Gender, data=survey, layout=c(1,2))

male <- survey[survey$Gender=="male", ]
female <- survey[survey$Gender=="female", ]


plot(Shoe_number ~ Shoe_size, data=male)
plot(Shoe_number ~ Shoe_size, data=female)

cor(male$Shoe_number,male$Shoe_size)
cor(female$Shoe_number, female$Shoe_size)

fit_male <- lm(Shoe_number ~ Shoe_size, data=male)
fit_female <- lm(Shoe_number ~ Shoe_size, data=female)

xyplot(Shoe_number ~ Shoe_size | Gender, data=survey, layout=c(1,2),
       panel = function(x, y, ...) {
         panel.xyplot(x, y, ...)
         panel.lmline(x, y, col = "red")})
