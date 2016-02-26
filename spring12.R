spring12 <- read.table("2012spring_survey01.dat", header=TRUE)
#lm from height to weight
fit<-lm(Weight~Height,data=spring12)
#summary
summary(fit)
#r
r <- cor(spring12$Height,spring12$Weight)
SDy_div_SDx <- sd(spring12$Weight)/sd(spring12$Height)
slope_weight <- r*SDy_div_SDx
intercept <- mean(spring12$Weigh) - slope_weight*mean(spring12$Height)
c(intercept,slope_weight)
r_square<-r**2
#SE for slpoe
n <- nrow(spring12)
SE_slope <- sqrt((1-r^2)/(n-2))*SDy_div_SDx
t_slope <- slope_weight/SE_slope
t_slope
#CI for slope 95
t_alpha <- qt(0.025,n-2,lower.tail=FALSE)
slope_95CI <- c(slope_weight - t_alpha*SE_slope, slope_weight + t_alpha*SE_slope)
slope_95CI
#check
confint(fit,'Height')
#predictd value
predict_partyHrfromHeight <- function(Height, beta) {
  beta[1] + beta[2]*Height
}
predict_partyHrfromHeight(spring12$Height,fit$coefficients)
#check fitted value
fit$fitted.values
#SST
SST_height<-(n-1)*(sd(spring12$Weight)**2)
computeSS <- function(beta,x,y) {
  n <- length(x)
  SDy2 <- var(y)*(n-1)/n
  SST <- n*SDy2
  yhat <- beta[1] + beta[2]*x
  SSM <- sum((yhat-mean(y))^2)
  SSE <- sum((y-yhat)^2)
  output <- c(SSE,SSM,SST-SSE-SSM)
  names(output) <- c("SSE","SSM","SST-SSE-SSM")
  output
}
fitSS<-computeSS(fit$coefficients,spring12$Height,spring12$Weight)
fitSS
