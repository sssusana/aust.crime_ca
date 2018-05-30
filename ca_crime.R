library(readxl)
library('ca')
library('FactoMineR')
library('MASS')
library('factoextra')
library("ExPosition")
library('ggsci')
library('ggthemes')

#The tricky part here is to deal with the table type.
#First i imported as a csv file, passing all the col classes (you can do it also in the read_table function)
#Then I import with the read.table with row.names=1
crime<-read.table("aust.csv", header = T, sep=';', row.names = 1, check.names = FALSE)
View(crime)

crime_prop <- prop.table(crime)
A1<-ca(crime)
plot(ca(crime), mass = TRUE, contrib = "absolute", 
     map = "symmetric", arrows = c(TRUE, TRUE))

A1$

A2<-corresp(crime, nf=2)
plot(A2)
biplot(corresp(crime_prop, nf=2))
A2$rscore


fviz_eig(A2, geom = c('bar', 'line'), addlabels = TRUE)
fviz_ca_col(A2)
fviz_ca_row(A2)
fviz_ca_biplot(A2, repel = TRUE, col.row="cos2", gradient.cols = c("#6AB187", "#488A99", "#B3C100"))


##CLustering