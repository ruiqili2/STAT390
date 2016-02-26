data=data(chickwts)
#mean chick weight by horsebean
hrsb_mean<-mean(chickwts$weight[chickwts$feed=="horsebean"])
#mean chick weight by meatmeal
mtml_chick<-mean(chickwts$weight[chickwts$feed=="meatmeal"])
