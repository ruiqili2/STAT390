stock <- read.csv("http://courses.atlas.illinois.edu/spring2016/STAT/STAT200/RProgramming/data/YHOOStock.csv")
n <- nrow(stock) # number of rows
stock$Change[n] <- NA 
for (i in 1:(n-1)) {
  stock$Change[i]<-100*((stock$Close[i]-stock$Close[i+1])/stock$Close[i+1])
  # calculates stock$Change in rows 1 ¨C n-1
}
went_up<-sum(stock$Change>0,na.rm=T)
fraction<-went_up/(nrow(stock)-1)
dr<-which(stock$Change<0)
drop_most<-min(stock$Change[dr])

for (i in range(length(stock$Change))){
  if (identical(stock$Change[i],drop_most)){
    worst_day<-stock$Date[i]
  }
}
stock$UpModel[(n-2):n] <- NA
for (i in 1:(n-3)) {
 stock$UpModel[i]<-(stock$Change[i+1] + stock$Change[i+2] >0)
  
}
correct_day<-0
go_up<-sum(stock$UpModel,na.rm = T)
frac<-go_up/(n-3)

stock$Correct<-NA
for (i in 1:n){
  if ((stock$UpModel[i]==T & stock$Change[i]>0) |(stock$UpModel[i]==F & stock$Change[i]<=0)){
    stock$Correct[i]<-1
  }else{
    stock$Correct[i]<-0
  }
}

pos_correct<-sum(!is.na(stock$Date[stock$UpModel==T & stock$Change>0]))
neg_correct<-sum(!is.na(stock$Date[stock$UpModel==F & stock$Change<=0]))

sum_split<-pos_correct+neg_correct
frac_new<-sum_split/(n-3)
sum_for<-sum(stock$Correct,na.rm = T)


