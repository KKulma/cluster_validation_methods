library(gclus)
library(ggplot2)
library(dplyr)

data(wine)
scaled_wine <- scale(wine) %>% as.data.frame()
scaled_wine2 <- scaled_wine[-1]


mwine <- as.matrix(scaled_wine2)




######## clValid ###########
install.packages("clValid")
install.packages('kohonen')

library(clValid)
library(kohonen)
library(mclust)

?clValid

intern <- clValid(mwine, 3:15, clMethods = c("hierarchical", "kmeans", #"diana", "fanny",  "som", "pam", "sota", "clara",
                                             "pam", "Mclust", "model"), 
                  validation = "internal")
summary(intern)





###### fpc package #######

library(fpc)


set.seed(20)
km.boot2 <- clusterboot(scaled_wine, B=100, bootmethod="boot",
                        clustermethod=kmeansCBI,
                        krange=2, seed=20)
km.boot2



km.boot3 <- clusterboot(scaled_wine, B=100, bootmethod="boot",
                        clustermethod=kmeansCBI,
                        krange=3, seed=20)
km.boot3

km.boot4 <- clusterboot(scaled_wine, B=100, bootmethod="boot",
                        clustermethod=kmeansCBI,
                        krange=4, seed=20)
km.boot4


km.boot15 <- clusterboot(scaled_wine, B=100, bootmethod="boot",
                        clustermethod=kmeansCBI,
                        krange=15, seed=20)
km.boot15