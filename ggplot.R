###############  ggplot  ######################
rice=read.csv("D:\\Project(Rice farm)\\RiceFarms.csv")
rice
id1=rice$id
a=as.factor(id1)
a1=cbind(rice,id1)
rice2=a1[,-c(1,2)]
colnames(rice2)
library(car)
ggplot(rice2,aes(size,goutput))
library(ggplot2)
p <- ggplot(rice2,aes(size,goutput))
print(p)
p+geom_point()
p+geom_point()+geom_line()




library(car)
ggplot(rice2,aes(hiredlabor,goutput))
library(ggplot2)
p <- ggplot(rice2,aes(hiredlabor,goutput))
print(p)
p+geom_point()
p+geom_point()+geom_line()


ggplot(rice2,aes(pesticide,goutput))
library(ggplot2)
p <- ggplot(rice2,aes(pesticide,goutput))
print(p)
p+geom_point()
p+geom_point()+geom_line()


## Boxplot##
ggplot(rice2, aes(x=varieties,y=price))+
  geom_boxplot(fill=c("red","green","blue"))
ggplot(rice2, aes(x=varieties,y=price))+
  geom_boxplot(fill=c("red","green","blue"))+
  geom_jitter()



##Histogram##
ggplot(rice2,aes(x=price)) +
  geom_histogram(bins=15,fill="pink",color="red")

## Density##
ggplot(rice2, aes(x=price))+geom_density()

ggplot(rice2, aes(x=price,fill=varieties))+
  geom_density()

##Bar Chart##
ggplot(rice2, aes(varieties,fill=varieties))+
  geom_bar()

### Plotting the Descriptive Statistics###
library(dplyr)
meanSals <- rice2 %>%
  group_by(varieties) %>%
  summarise(Mean=mean(price,na.rm = T))
ggplot(data=meanSals,aes(x=varieties,y=Mean))+
  geom_bar(stat = "identity",fill="steelblue2")

#### Facet####
p+geom_point()+geom_smooth(method="lm")+
  facet_grid(varieties~status)
  facet_wrap(~varieties,nrow = 2)
p+geom_point(color="blue", size=3)
p+geom_point(aes(color=varieties), size=2,
             alpha=3/4)
p+geom_point(aes(color=varieties), size=2, alpha=3/4)+
  labs(title="Plot by Rank")+
  labs(x="varieties",y="price",color="Rank")+
  theme(plot.title = element_text(hjust = 0.5))

p+geom_point(aes(color=varieties), size=2, alpha=3/4)+
  labs(title="Plot by Rank")+
  labs(x="varieties",y="price")+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
