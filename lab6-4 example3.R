#Example 4 : Public Utility data

library(ggplot2)
library(GGally)
library(CCA)
library(MASS)

setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")

utility<-read.csv("./Lab6-data/public.csv")
head(utility)  
util.data<-utility[,1:8]
rownames(util.data)<-utility[,9]  # 9��° observation name 
dist.util<-dist(util.data,method="euclidean") # ��Ŭ���� �Ÿ�

# h cluster 
h.complete<-hclust(dist.util,method="complete")  #�Ÿ� matrix,���
summary(h.complete)
#��� �������� ���������� �� �� ����
plot(h.complete,hang=-1,main="complete linkage")
# hang= -1 �ٸ��� 

#�ڸ���, cluster �������
#1,2,3�� �������� , �׷��̸�
cutree(h.complete, h=7000) #���̿��� ������
cutree(h.complete, k=3) #�׷찳�� 3���� ������

h.complete<-hclust(dist.util,method="single")
plot(h.complete,hang=-1,main="single linkage")
cutree(h.complete,h=1900)
cutree(h.complete,k=3)

h.complete<-hclust(dist.util,method="average")
plot(h.complete,hang=-1,main="average linkage")
cutree(h.complete,h=4000)
cutree(h.complete,k=3)

kmeans.util<-kmeans(util.data,3) 
#�� ���� Ŭ�����ͷ� ���� ������ ����
kmeans.util

#group ������ ���� �� clustering �غ���
util.data$cluster<-kmeans.util$cluster
util.LDA<-lda(util.data[,-9],util.data[,9])
LDA.data<-data.frame(predict(util.LDA)$x,
                     predict=predict(util.LDA)$class,
                     cluster=as.factor(util.data[,9]))
LDA.data$error <-LDA.data$predict !=LDA.data$cluster
head(LDA.data)
ggplot(LDA.data,aes(LD1,LD2))+geom_point(aes(color=cluster,shape=predict,size
                                             =error))







