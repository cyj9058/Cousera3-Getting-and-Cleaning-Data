#4_Managing_DataFrames_with_the _dplyr_package
chicago<-readRDS("chicago_data/chicago.rds")
dim(chicago)
names(chicago)[1:3]

library(dplyr)
select(chicago,-(city:dptp))
str(chicago)

i<-match("city",names(chicago))
j<-match("dptp",names(chicago))
head(chicago[,-(i:j)])

chic.f<-filter(chicago,pm25tmean2>30)
filter(chicago,city!="chic")

arrange(chicago,desc(date))

chicago1<-rename(chicago,dewpoint=dptp,pm25=pm25tmean2)
chicago2<-mutate(chicago1,pm25detrend=pm25-mean(pm25,na.rm=TRUE))
chicago3<-mutate(chicago2, year=as.POSIXlt(date)$year+1900)
years <-group_by(chicago3,year)
summarize(years, pm25=mean(pm25,na.rm=TRUE),o3=max(o3tmean2,na.rm=TRUE), no2=median(no2tmean2,na.rm=TRUE))

group_by(chicago3,year) %>%
  summarize(pm25=mean(pm25,na.rm=TRUE),o3=max(o3tmean2,na.rm=TRUE), no2=median(no2tmean2,na.rm=TRUE))

#5_Exploratory_Data_Analysis_Checklist
ozone<-read_csv("hourly_44201_2014.csv",col_types = "ccccinnccccccncnncccccc")
nrow(ozone)
ncol(ozone)
str(ozone)

table(ozone$`Time Local`)

x<-filter(ozone, 'Time Local' == "18:00") %>%
    select('State Name', 'County Name', 'Date Local','Time Local', 'Sample Measurement')


select(ozone, 'State Name') %>% 
  unique %>% 
  nrow

ranking<-group_by(ozone,'State Name', 'County Name')

summarize(ranking,ozone=mean(.data[['Sample Measurement']],na.rm=TRUE))

## The Base Plotting System

library(datasets)
hist(airquality$Ozone)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")
str(airquality)

plot(airquality$Wind, airquality$Ozone)
with(airquality, plot(Wind,Ozone))
title(main = "Ozone and Wind in New York City")
with(subset(airquality, Month == 5),points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)



with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = TRUE)
  })





par(mfrow=c(1,2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  })

par(mfrow=c(1,1))
set.seed(1234)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
str(kmeansObj)

install.packages("ggplot2")
library(ggplot2)
ggplot(airquality, aes(Temp, Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE)

qplot(displ,hwy,data=mpg)
qplot(displ, hwy, data = mpg, color = drv, geom = c("point", "smooth"))+
qplot(displ, hwy, data = mpg)+
  geom_point() +
  geom_smooth()
qplot(hwy, data = mpg, fill = drv, binwidth = 2)
qplot(drv, hwy, data = mpg, geom = "boxplot")
qplot(displ, hwy, data = mpg, facets = . ~ drv, geom = c("point", "smooth"))
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
str(mpg)

testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100 ## Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()

g + geom_line() + coord_cartesian(ylim = c(-3, 3))

testdat[50,2] <- 100 ## Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

with(airquality, plot(Wind, Ozone, main="Ozone and Wind in Newyork"))
with(airquality, plot(Wind, Ozone, main="Ozone and Wind in Newyork", pch=20))
model<-lm(Ozone~Wind, airquality)
abline(model,lwd=2)

par(mfrow=c(1,2))
with(airquality,{
  plot(Wind,Ozone, main="Ozone and Wind")
  plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
  
  })

x<-rnorm(100)
hist(x)
