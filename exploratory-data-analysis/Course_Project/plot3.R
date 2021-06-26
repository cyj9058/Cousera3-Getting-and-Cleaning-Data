setwd("C:/Users/cyj90/github/data/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)

NEI<-transform(NEI, type = factor(type))
NEI<-transform(NEI, year = factor(year))
levels(NEI$type)
levels(NEI$year)

#Baltimore Data 
NEI_Baltimore<-filter(NEI,fips == "24510")
str(NEI_Baltimore)

Baltimore_Emissions<-c(
  sum(filter(NEI_Baltimore,year==1999 & type=="POINT")$Emissions),
  sum(filter(NEI_Baltimore,year==1999 & type=="NONPOINT")$Emissions),
  sum(filter(NEI_Baltimore,year==1999 & type=="ON-ROAD")$Emissions),
  sum(filter(NEI_Baltimore,year==1999 & type=="NON-ROAD")$Emissions),
  sum(filter(NEI_Baltimore,year==2002 & type=="POINT")$Emissions),
  sum(filter(NEI_Baltimore,year==2002 & type=="NONPOINT")$Emissions),
  sum(filter(NEI_Baltimore,year==2002 & type=="ON-ROAD")$Emissions),
  sum(filter(NEI_Baltimore,year==2002 & type=="NON-ROAD")$Emissions),
  sum(filter(NEI_Baltimore,year==2005 & type=="POINT")$Emissions),
  sum(filter(NEI_Baltimore,year==2005 & type=="NONPOINT")$Emissions),
  sum(filter(NEI_Baltimore,year==2005 & type=="ON-ROAD")$Emissions),
  sum(filter(NEI_Baltimore,year==2005 & type=="NON-ROAD")$Emissions),
  sum(filter(NEI_Baltimore,year==2008 & type=="POINT")$Emissions),
  sum(filter(NEI_Baltimore,year==2008 & type=="NONPOINT")$Emissions),
  sum(filter(NEI_Baltimore,year==2008 & type=="ON-ROAD")$Emissions),
  sum(filter(NEI_Baltimore,year==2008 & type=="NON-ROAD")$Emissions)
)

Baltimore_year<-c(rep(1999,4),rep(2002,4),rep(2005,4),rep(2008,4))
Baltimore_type<-rep(c("POINT","NONPOINT","ON-ROAD","NON-ROAD"),4)
Baltimore_data<-data.frame(Baltimore_year,Baltimore_type,Baltimore_Emissions)
names(Baltimore_data)<-c("year","type","Emissions")

ggplot(data=Baltimore_data,aes(x=year,y=Emissions,group=type,color=type))+
  geom_line()+
  ggtitle("Total Emission by Type in Batimore City")

#Making File
setwd("C:/Users/cyj90/github/study/exploratory-data-analysis/course_project")
dev.copy(png, file="plot3.png")
dev.off()


