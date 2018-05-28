library(ggplot2)
library(GGally)
library(CCA)
setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")
tot.data<- read.csv("./lab6-data/cc-1.csv")
tot.data

#y1 x1 ������ ������ ������谡 �־��

ggpairs(tot.data)
n<-row(tot.data)
Y<-tot.data[,1:2]
X<-tot.data[,3:5]
matcor(X,Y)

cc.result<-cc(X,Y)
cc.result
summary(cc.result)    #������� ���鋚 print �� �ȳ־��� list ����
# correlation matrix 
# U1 U2, V1, V2 coefficient xcoet, ycoef
cc.result$xcoef  #U1 U2
cc.result$ycoef  #V1 V2
summary(lm(Y1~X1, tot.data))
str(cc.result)

CCA.data<-data.frame(U1=cc.result$scores$xscores[,1],
                     U2=cc.result$scores$xscores[,2],
                     V1=cc.result$scores$yscores[,1],
                     V2=cc.result$scores$yscores[,2])
ggplot(CCA.data,aes(U1,V1))+geom_point()+ggtitle("1st canonical plot")
#U1, V1 �� correlation �� ����
ggplot(CCA.data,aes(U2,V2))+geom_point()+ggtitle("2nd canonical plot")
#U2, V2 �� correlation ����, U2, V2�� ����� �ʿ䰡 ����


tot.cor<-matcor(X,Y)
img.matcor(tot.cor,type=1)
img.matcor(tot.cor,type=2)
# ���ĺм��� �˾Ƽ� �ϱ� 
# U1 overall mean
