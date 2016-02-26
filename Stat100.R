survey <- read.csv("Stat100_2010fall_survey01.csv")
View(survey$Speed)
ave_speed=mean(survey$Speed,rm.na=T)
sd_speed=sqrt((length(survey$Speed)-1)/length(survey$Speed))*sd(survey$Speed)
##nondriver
nondriver=sum(survey$Speed==0)
##male nondriver
maleNonDriver=sum(survey$Speed==0 & survey$Gender=="male")
##regular
regularDriver=survey$Speed[survey$speed>30]
ave_reg=mean(survey$Speed[survey$Speed>30],rm.na=T)
