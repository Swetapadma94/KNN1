cancer<-read.csv("E:\\Assignment\\knn\\wbcd.csv")
View(cancer)
str(cancer)
class(cancer)
dim(cancer)

wbcd1<-cancer[,-1]
View(wbcd1)
## count types of cancer
table(wbcd1$diagnosis)
View(table(wbcd1$diagnosis))
# Converting the diagnosis into factor and assigning M as Malignant and B as Benign
wbcd1$diagnosis=factor(wbcd1$diagnosis,levels = c("B","M"), labels = c("Benign","Malignant"))
View(wbcd1)
table(wbcd1$diagnosis)
round(prop.table(table(wbcd1$diagnosis))*100,digits=1)
summary(wbcd1)
normalalize<-function(x){
 return ((x-min(x))/(max(x)-min(x))
}
normalize_data<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
wbcd1_n<-as.data.frame(lapply(wbcd[2:31], normalize_data))
summary(wbcd1_n)
View(wbcd1_n)
wbcd1_train<-wbcd1_n[1:469,]
View(wbcd1_train)
summary(wbcd1_train)
dim(wbcd1_train)
wbcd1_test<-wbcd_n[470:569,]
View(wbcd1_test)
summary(wbcd1_test)
dim(wbcd1_test)
wbcd1_train_labels<-wbcd1[1:469,1]
View(wbcd1_train_labels)
wbcd1_tst_labels<-wbcd1[470:569,1]
View(wbcd1_tst_labels)
library(class)
wbcd1_test_pred<-knn(wbcd1_train,wbcd1_test,cl=wbcd1_train_labels,k=21)
View(wbcd1_test_pred)
class(wbcd1_test_pred)
CrossTable(x=wbcd1_tst_labels,y=wbcd1_test_pred,prop.chisq = FALSE)
confusionMatrix(wbcd1_test_pred,wbcd1_tst_labels)
class(wbcd1_test)
class(wbcd1_test_pred)
class(wbcd1_tst_labels)
