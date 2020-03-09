rice=read.csv("D:\\project\\Rice production(project).csv")
rice
id1=rice$id
a=as.factor(id1)
a1=cbind(rice,id1)
rice2=a1[,-c(1,2)]
colnames(rice2)
str(rice2)
library(caret)
intrain<-createDataPartition(y=rice2$price,p=0.7,list=FALSE)
training <- rice2[intrain, ]
validation <- rice2[-intrain, ]
library(class)
trcontrol=trainControl(method = 'repeatedcv',number = 10,repeats = 3 )
set.seed(2019)
fit=train(price~.,data=training,
          tuneGride=expand.grid(k=1:70),method='knn',
                    trcontrol=trcontrol,
          metric='Rsquared',
                     preProc=c('center','scale'))
fit
plot(fit)
varImp(fit)
pred=predict(fit,newdata=validation)
RMSE(pred,validation$price)
plot(pred~validation$price)

