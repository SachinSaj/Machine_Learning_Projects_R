# Clustering On IRIS Dataset

library(dplyr)
library(caTools)
library(ggplot2)

data("iris")
Data<-iris
View(Data)
Data<- Data[1:4]
View(Data)

Data<-as.matrix(Data)
kmeans(Data,3)->clusters
clusters

cbind(iris,clusters$cluster)->Final
Final