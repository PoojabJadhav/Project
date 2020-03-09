####################K-fold cross validation################
rice=read.csv("D:\\project\\Rice production(project).csv")
a=rice$id
id1=as.factor(a)
rice1=cbind(rice,id1)
rice2=rice1[,-c(1,2)]
set.seed(2019)
library(caret)
model_cv <- train(price ~ .,
                  data = rice2,method="lm",
                  trControl = trainControl(method = "cv",
                                           number = 5))

model_cv

mygrid = expand.grid(k=1:10)
model_cv <- train(price ~ .,
                  data = rice2,method="knn",
                  tuneGrid = mygrid,
                  trControl = trainControl(method = "cv",
                                           number = 5))

model_cv
plot(model_cv)


########## rpart #########
mygrid = expand.grid(maxdepth=2:15)
model_cv <- train(price ~ .,
                  data = rice2,method="rpart2",
                  tuneGrid = mygrid,
                  trControl = trainControl(method = "cv",
                                           number = 5))

model_cv
plot(model_cv)

########## ctree #########
mygrid = expand.grid(mincriterion = seq(0.55,0.99,by = 0.105) )
model_cv <- train(price ~ .,
                  data = rice2,method="ctree",
                  tuneGrid = mygrid,
                  trControl = trainControl(method = "cv",
                                           number = 5))

model_cv
plot(model_cv)

########## ctree2 #########
mygrid = expand.grid(mincriterion =seq(0.55,0.99,by = 0.105),
                     maxdepth=seq(2,15))
model_cv <- train(price ~ .,
                  data = rice2,method="ctree2",
                  tuneGrid = mygrid,
                  trControl = trainControl(method = "cv",
                                           number = 5))

model_cv
plot(model_cv)


