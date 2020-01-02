# Regression Analysis on Longley Economic Regression Data

library(dplyr)
library(caTools)
library(ggplot2)

data("longley")
Data<-longley
View(Data)
nrow(Data)
ncol(Data)
summary(Data)
pairs(Data)
cor(x=Data$Employed,y=Data$Population) # .96

sample.split(Data$Employed,SplitRatio = .70)->mydata
subset(Data,mydata==T)->train
subset(Data,mydata==F)->test
lm(Employed~.,data=train)->mytree

predict(mytree,test)->results
cbind(Actual = test$Employed, Predicted = results)->final
Final<-as.data.frame(final)
cbind(Final, error = Final$Actual-Final$Predicted)->Final
rmse<-sqrt(mean((Final$error)^2))  # 0.4739

lm(Employed~.,-Unemployed,data=train)->mytree2
predict(mytree2,test)->results2
cbind(Actual = test$Employed, Predicted = results2)->final2
Final2<-as.data.frame(final2)
cbind(Final2, error = Final2$Actual-Final2$Predicted)->Final2
rmse2<-sqrt(mean((Final$error)^2))  # 0.4739
summary(mytree2)
