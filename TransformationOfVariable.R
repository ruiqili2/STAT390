rdat <- read.csv("http://courses.atlas.illinois.edu/spring2016/STAT/STAT200/RProgramming/data/rdensity.csv")
r<-rdat$r
plot(density(r))
plot(density(r^2)) 
plot(density(r^3)) 
plot(density(r^4)) 
plot(density(sqrt(r)))
plot(density(exp(r)))
plot(density(log(r)))
plot(density(1/r))
t <- function(r,f,...) {
  plot(density(f(r,...)))
}
p <- function(x,n) {
  x^n
}

plot(density(r^3))
t(r,p,3)
t <- function(x) {
  plot(density(x))
} 
t(r,r^2*exp(r)) 
t(r^2*exp(r),r)
t(r^2*exp(r)) 
t(r,r^2*exp(r)) 
plot(density(r^2*exp(r)))
