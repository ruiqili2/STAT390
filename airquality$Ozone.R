survey <- read.csv("Stat100_2010fall_survey01.csv")
mean(survey$Speed)
sdSpeed<-sd(survey$Speed)
sdPopulation<-(962/963)**0.5*sdSpeed
hist(survey$Speed)

##never drive
nondriver<-survey[survey$Speed==0,]
nonDriverMale<-survey[survey$Speed==0&survey$Gender=='male',]
sum(nonDriverMale$Speed==0)

##regular driver
regularDriver<-survey[survey$Speed>30,]
avg<-mean(regularDriver$Speed)
sd(regularDriver$Speed)
sdRd<-(962/963)**0.5*sd(regularDriver$Speed)

##normal curve
hist(regularDriver$Speed,breaks=15,freq=F)
curve(dnorm(x,avg,sdRd),col="red",add=T)

