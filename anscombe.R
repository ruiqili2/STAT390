View(anscombe)
#y1-x1
fit_1<-lm(y1~x1,data=anscombe)
summary(fit_1)
#y2-x2
fit_2<-lm(y2~x2,data=anscombe)
summary(fit_2)
#y3-x3
fit_3<-lm(y3~x3,data=anscombe)
summary(fit_3)
#plot y1-x1
plot(y1~x1,data=anscombe)
abline(fit_1)
#plot y2-x2
plot(y2~x2,data=anscombe)
abline(fit_2)
#plot y3-x3
plot(y3~x3,data=anscombe)
abline(fit_3)
#plot y4-x4
plot(y4~x4,data=anscombe)
abline(fit_4)

