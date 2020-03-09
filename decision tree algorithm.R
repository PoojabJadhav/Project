##################################  Decision Tree  #######################################


rice=read.csv("D:\\project\\Rice production(project).csv")
rice
id1=rice$id
a=as.factor(id1)
a1=cbind(rice,id1)
rice2=a1[,-c(1,2)]
colnames(rice2)
library(Ecdat)
library(caret)
set.seed(2019)
intrain<-createDataPartition(y=rice2$price ,
                             p=0.7,list=FALSE)

training   <- rice2[ intrain , ]
validation <- rice2[-intrain , ]

library(rpart)
fitRT <- rpart( price ~ . , data = training ,
                method = "anova",
                control = rpart.control(minsplit = 150) )

library(rpart.plot)

rpart.plot(fitRT,type = 4,extra = 1, digits = 5)

# OR

library(visNetwork)
visTree(fitRT, main = "Regression Tree", width = "100%")


pred.RT <- predict(fitRT,newdata = validation )

postResample(pred.RT , validation$price)
# OR
RMSE <- function(y, yhat) {
  sqrt(mean((y - yhat)^2))
}
RMSE(validation$price, pred.RT)

MAPE <- function(y, yhat) {
  mean(abs((y - yhat)/y))
}
MAPE(validation$price , pred.RT)

RMSPE<- function(y, yhat) {
  sqrt(mean((y-yhat)/y)^2)
}
RMSPE(validation$price , pred.RT)


###### Conditional Inference Tree ########

library(partykit)

fitCT <- ctree(price ~ . , data = training,
               control = ctree_control(minsplit = 150))

plot(fitCT , type="simple")

plot(fitCT , type="extended" )

pred.CT <- predict(fitCT , newdata=validation)

postResample(pred.CT , validation$price)
MAPE(validation$price , pred.CT)
RMSPE(validation$price , pred.CT)

