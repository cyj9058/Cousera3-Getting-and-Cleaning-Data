library(lattice)
library(datasets)

p<-xyplot(Ozone ~ Wind, data=airquality)

str(airquality)

airquality1<- transform(airquality, Month=factor(Month))
xyplot(Ozone ~ Wind|Month, data=airquality1, layout=c(5,1))

print(p)

set.seed(10)
x<-rnorm(100)
f<- rep(0:1, each=50)
f<- factor(f,labels=c("Group1", "Group2"))
xyplot(y~x|f, layout=c(2,1))

library(ggplot2)
str(mpg) #miles per gallon
qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
qplot(displ,hwy,data=mpg,geom=c("point"))
qplot(displ,hwy,data=mpg)
qplot(hwy,data=mpg,fill=drv)

qplot(displ, hwy, data=mpg, facets = .~drv)

qplot(hwy, data=mpg, facets = .~drv)


setwd("C:/Users/cyj90/github/data")
library(datasets)
load("maacs.Rda")
str(maacs)
qplot(log(eno),data=maacs)
qplot(log(eno),data=maacs, fill=mopos)
qplot(log(eno),data=maacs, geom="density")
qplot(log(eno),data=maacs, geom="density",color=mopos)
qplot(log(pm25),log(eno),data=maacs)
qplot(log(pm25),log(eno),data=maacs,shape=mopos)
qplot(log(pm25),log(eno),data=maacs,color=mopos)
qplot(log(pm25),log(eno),data=maacs,color=mopos)+geom_smooth(method="lm")

qplot(log(pm25),log(eno),data=maacs, facets = .~mopos)+geom_smooth(method="lm")
g<-qplot(logpm25,NocturnalSympt, data=maacs, facets = .~bmicat, geom=c("point","smooth"), method="lm")
print(g)

g+geom_point(color="steelblue", size=4, alpha=1/2)
g+geom_point(aes(color=bmicat),size=4, alpha=1/2)+labs(title("MAACS Cohort"))
g

testdat<- data.frame(x=1:100, y=rnorm(100))
testdat[50,2]<-100
plot(testdat$x,testdat$y, type="l",ylim=c(-3,3))

g<-ggplot(testdat, aes(x=x,y=y))
g+geom_line()+ylim(-3,3)
g+geom_line()+coord_cartesian(ylim=c(-3,3))

cutpoints<-quantile(maacs)

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
splom(p)
trellis.par.set(p)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
qplot(votes, rating, data = movies) + geom_smooth()
