library(readr)
zoo<-read.csv("E:\\Assignment\\knn\\zoo.csv")
View(zoo)
str(zoo)
class(zoo)
dim(zoo)
# Name of animal  column can be removed 
zoo<-zoo[-1]
View(zoo)
class(zoo$type) ## Dependent variable is integer.
## converting dependent variable in to factor.
zoo$type<-factor(zoo$type)
View(zoo)
class(zoo$type)
## count of types of animal
table(zoo$type)
# Converting the type into factor and assigning 1 as A,2 as B,3 as C,4 as D,5 as E,6 as F and 7 as G 
zoo$type<-factor(zoo$type,levels = c("1","2","3","4","5","6","7"),labels = c("A","B","C","D","E","F","G"))
View(zoo)
# count of A,B,C,D,E,F,G
table(zoo$type)
# Proportions of  A,B,C,D,E,F,G

round(prop.table(table((zoo$type))*100,digits = 1)

normalize_data<-function(x){
        return((x-min(x))/(max(x)-min(x)))
      }      

# Rather than applying each element individually we will use "lapply()" function in R which 
# it considers the list and applies the function to each list element
# Lapply function considers each column as list and it will apply function to each element under columns 
zoo_n<-as.data.frame(lapply(zoo[2:16], normalize_data))
View(zoo_n)
# for predicting the accuracy of the model we will first split the data into training and testing 
# training - 70 and test data contains - 31 data
# [ row column ] <- syntax
zoo_train<-zoo_n[1:70,]
dim(zoo_train)
View(zoo_train)
zoo_test<-zoo_n[71:101,]
dim(zoo_test)
View(zoo_test)
## labels
zoo_train_labels<-zoo[1:70,1]
View(zoo_train_labels)
class(zoo_train_labels)
zoo_test_labels<-zoo[71:101,1]
View(zoo_test_labels)
class(zoo_test_labels)
# class package for classification which is a k-nn implementation and we will use knn() to to implement
# knn algorithm. knn() takes 4 parameters - train,test,class,k
library(class)
zoo_test_pred<-knn(zoo_train,zoo_test,cl=zoo_train_labels,k=5)
class(zoo_test_pred)
View(zoo_test_pred)
