# Classification of breast Cancer by USing Decision Tree Algorithm

library(dplyr)
library(ggplot2)
library(caTools)
library(rpart)

data<-read.csv('C:/Users/HP/Downloads/Practical MAchine Learning/Machine Learning with R/Classification/breast-cancer.csv')
View(data)
nrow(data)
ncol(data)
summary(data)
summary(data$diagnosis)

sample.split(data$diagnosis,SplitRatio = 0.70)->mydata
subset(data,mydata==T)->train
subset(data,mydata==F)->test
rpart(diagnosis~.,data=train)->mytree
predict(mytree,test,type="class")->results
table(test$diagnosis,results)->cm

cm<- as.matrix(cm)
n = sum(cm)
nc = nrow(cm)
diag = diag(cm)
rowsum = apply(cm,1,sum)
colsum = apply(cm,2,sum)
p =  rowsum/n
q = colsum/n

accuracy = sum(diag)/n  # 89.47 %
precision = diag / colsum # B:0.88, M: 0.79
recall = diag / rowsum # B:0.95, M:0.79