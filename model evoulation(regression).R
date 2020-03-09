########Method of model evaluation###########
rice=read.csv("D:\\project\\Rice production(project).csv")
a=rice$id
id1=as.factor(a)
rice1=cbind(rice,id1)
rice2=rice1[,-c(1,2)]
set.seed(2019)
fit=lm(price~.,data=rice2)
fit
summary(fit)
colnames(rice2)
rice3=rice2[,c(2,4,7,9,10,13,15,18)]
fit1=lm(price~.,data=rice3)
sampleIndex=sample(1:nrow(rice3),size = nrow(rice3)*0.7)
sampleIndex
training=rice3[sampleIndex,]
training
validation=rice3[-sampleIndex,]
validation
library(MLmetrics)
yhat1=predict.lm(fit1,newdata = validation)
RMSE(y_pred = yhat1,y_true =validation$price)
MAPE(y_pred = yhat1,y_true =validation$price)
MSE(y_pred = yhat1,y_true =validation$price)
RMSPE(y_pred = yhat1,y_true =validation$price)
RMSLE(y_pred = yhat1,y_true =validation$price)

###Hence MAPE is the best model to our data.
