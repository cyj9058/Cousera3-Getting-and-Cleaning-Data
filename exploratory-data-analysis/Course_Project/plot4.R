setwd("C:/Users/cyj90/github/data/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)

NEI<-transform(NEI, type = factor(type))
NEI<-transform(NEI, year = factor(year))
merged_NEI<-merge(x=NEI,y=SCC,by="SCC", all.x = TRUE)
levels(merged_NEI$EI.Sector)

# Data Cleaning
Combustion <- c(
    sum(filter(merged_NEI,year==1999 & EI.Sector=="Fuel Comb - Comm/Institutional - Coal")$Emissions),
    sum(filter(merged_NEI,year==2002 & EI.Sector=="Fuel Comb - Comm/Institutional - Coal")$Emissions),
    sum(filter(merged_NEI,year==2005 & EI.Sector=="Fuel Comb - Comm/Institutional - Coal")$Emissions),
    sum(filter(merged_NEI,year==2008 & EI.Sector=="Fuel Comb - Comm/Institutional - Coal")$Emissions),
    
    sum(filter(merged_NEI,year==1999 & EI.Sector=="Fuel Comb - Electric Generation - Coal")$Emissions),
    sum(filter(merged_NEI,year==2002 & EI.Sector=="Fuel Comb - Electric Generation - Coal")$Emissions),
    sum(filter(merged_NEI,year==2005 & EI.Sector=="Fuel Comb - Electric Generation - Coal")$Emissions),
    sum(filter(merged_NEI,year==2008 & EI.Sector=="Fuel Comb - Electric Generation - Coal")$Emissions),
    
    sum(filter(merged_NEI,year==1999 & EI.Sector== "Fuel Comb - Industrial Boilers, ICEs - Coal")$Emissions),
    sum(filter(merged_NEI,year==2002 & EI.Sector== "Fuel Comb - Industrial Boilers, ICEs - Coal")$Emissions),
    sum(filter(merged_NEI,year==2005 & EI.Sector== "Fuel Comb - Industrial Boilers, ICEs - Coal")$Emissions),
    sum(filter(merged_NEI,year==2008 & EI.Sector== "Fuel Comb - Industrial Boilers, ICEs - Coal")$Emissions)
)

Combustion<-round(Combustion)
Year<-rep(c(1999,2002,2005,2008),3)
Type<-c(rep("Commercial&Instutional",4),rep("Electricity Generation",4),rep("Boiler",4))
Fuel_Combustion_data<-data.frame(Combustion,Year,Type)

#ggplot
opt <- options("scipen" = 100)
ggplot(data=Fuel_Combustion_data,aes(x=Year,y=Combustion,group=Type,color=Type))+
  geom_line()+
  geom_point()+
  ylab('Coal Combustion(by Ton)')+
  ggtitle("Coal Combustion Data in U.S.(by Type)")+
  geom_text(aes(label=Combustion), position=position_dodge(width=0.9), vjust=-0.25)

#Making File
setwd("C:/Users/cyj90/github/study/exploratory-data-analysis/course_project")
dev.copy(png, file="plot4.png")
dev.off()


