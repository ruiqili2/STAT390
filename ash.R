data<- read.table("E:/2016 Spring/STAT 390/II.csv", quote="\"", comment.char="")
e<-exp(1)
data<-data/11000
write.csv(data,"E:/2016 Spring/STAT 390/II.1.csv")
data_e<-logb(data,e)
write.csv(data_e,"E:/2016 Spring/STAT 390/II.2.csv")
data_1<-1/data
write.csv(data_1,"E:/2016 Spring/STAT 390/II.3.csv")

