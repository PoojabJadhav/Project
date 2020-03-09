
rice=read.csv("D:\\project\\Rice production(project).csv")
rice
rice3=rice[,c(10,9,11,12,17,20)]
head(rice3)
colnames(rice3)
prc <- prcomp(rice3,scale. = T)
names(prc)
prc$sdev
prc$rotation 
prc$center 
prc$scale
prc$x 
pr.var <- prc$sdev^2
pve <- pr.var / sum(pr.var)

plot(pve, xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     ylim = c(0, 1), type = "b")

# Plot cumulative proportion of variance explained
plot(cumsum(pve), xlab = "Principal Component",
     ylab = "Cummulative Proportion of Variance Explained",ylim = c(0,1),
     type = "b")

biplot(prc,cex=0.7,scale = 0)

### A verification of calculation with matrix algebra
prc$rotation %*% diag(prc$sdev^2) %*% t(prc$rotation)
### Similar to the following ###
cor(scale(rice3,scale=F))

##apply(prc$rotation,2,sd)
#prc <- prcomp(milk,scale. = T)
biplot(prc,cex=0.7,scale = 0)
prc$rotation

library(ggplot2)
library(ggfortify)
autoplot(prc, data = rice3,
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 3,
         label=T)

