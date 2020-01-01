# Classification of IRIS dataset using Decision Tree Classifier

library(dplyr)
library(ggplot2)
library(caTools)
library(rpart)

data<- read.csv('C:/Users/HP/Downloads/Practical MAchine Learning/Machine Learning with R/Classification/IRIS.csv')
View(data)
nrow(data)
ncol(data)

hist(data$sepal_length)scatter.smooth(x=data$sepal_length,y=data$petal_length,xlab='Sepal_Length',ylab='Petal_length')
summary(data)

sample.split(data$species,SplitRatio = .70)->mydata
subset(data,mydata==T)->train
subset(data,mydata==F)->test
rpart(species~.,data=train)->treemodel
predict(treemodel,test,type = "class")->results
table(test$species,results)->cm

as.matrix(cm)->cm
n = sum(cm)  # Sum of Instances
nc = nrow(cm) # number of classes
diag = diag(cm) # Getting diagonal
rowsums = apply(cm,1,sum) # number of instances per class (rowsum)
colsums = apply(cm,2,sum) # number of predictions per class (column sum)
p = rowsums / n # distribution of instances over the actual classes
q = colsums / n # distribution of instances over the predicted classes


accuracy = sum(diag) / n  # Accuracy = 91.11%
precision = diag / colsums # class 1 :1.00, class 2: 0.8232, class 3: 0.92
recall = diag / rowsums # class 1:1.00, class 2:0.93 , class 3 :0.80




