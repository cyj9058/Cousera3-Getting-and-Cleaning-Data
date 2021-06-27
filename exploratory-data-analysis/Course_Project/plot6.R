setwd("C:/Users/cyj90/github/data/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)

NEI<-transform(NEI, type = factor(type))
NEI<-transform(NEI, year = factor(year))
merged_NEI<-merge(x=NEI,y=SCC,by="SCC", all.x = TRUE)
merged_NEI_Baltimore<-filter(merged_NEI,fips == "24510")
merged_NEI_LA<-filter(merged_NEI,fips == "06037")

Baltimore_Motorcycle<-merged_NEI_Baltimore[grep("Motor",merged_NEI_Baltimore$Short.Name,ignore.case = TRUE),]
LA_Motorcycle<-merged_NEI_LA[grep("Motor",merged_NEI_LA$Short.Name,ignore.case = TRUE),]

Motorcycle<-c(  
  round(sum(filter(Baltimore_Motorcycle,year==1999)$Emissions)),
  round(sum(filter(Baltimore_Motorcycle,year==2002)$Emissions)),
  round(sum(filter(Baltimore_Motorcycle,year==2005)$Emissions)),
  round(sum(filter(Baltimore_Motorcycle,year==2008)$Emissions)),
  
  round(sum(filter(LA_Motorcycle,year==1999)$Emissions)),
  round(sum(filter(LA_Motorcycle,year==2002)$Emissions)),
  round(sum(filter(LA_Motorcycle,year==2005)$Emissions)),
  round(sum(filter(LA_Motorcycle,year==2008)$Emissions))
)

Year<-rep(c(1999,2002,2005,2008),2)
Type<-c(rep("Baltimore",4),rep("LA",4))
Motorcycle_data<-data.frame(Motorcycle,Year,Type)
names(Motorcycle_data)<-c("Motorcycle","Year","Type")

ggplot(data=Motorcycle_data,aes(x=Year,y=Motorcycle,group=Type,color=Type))+
  geom_line()+
  geom_point()+
  ylab('Motocycle Emmission(by Ton)')+
  ggtitle("Motocycle Emmission in Baltimore vs LA(by Year)")+
  geom_text(aes(label=Motorcycle), position=position_dodge(width=0.9), vjust=-0.25)


#Making File
setwd("C:/Users/cyj90/github/study/exploratory-data-analysis/course_project")
dev.copy(png, file="plot6.png")
dev.off()


