setwd("C:/Users/cyj90/github/data/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)

NEI<-transform(NEI, type = factor(type))
NEI<-transform(NEI, year = factor(year))
merged_NEI<-merge(x=NEI,y=SCC,by="SCC", all.x = TRUE)
merged_NEI_Baltimore<-filter(merged_NEI,fips == "24510")
Baltimore_Motorcyle<-merged_NEI_Baltimore[grep("Motor",merged_NEI_Baltimore$Short.Name,ignore.case = TRUE),]

levels(merged_NEI_Baltimore$Short.Name[grep("Motor",merged_NEI_Baltimore$Short.Name,ignore.case = TRUE)])


Motorcycle<-c(  
  round(sum(filter(Baltimore_Motorcyle,year==1999)$Emissions)),
  round(sum(filter(Baltimore_Motorcyle,year==2002)$Emissions)),
  round(sum(filter(Baltimore_Motorcyle,year==2005)$Emissions)),
  round(sum(filter(Baltimore_Motorcyle,year==2008)$Emissions))
)

Motorcycle_data<-data.frame(Motorcycle,Year<-c(1999,2002,2005,2008))
names(Motorcycle_data)<-c("Motorcycle","Year")

ggplot(data=Motorcycle_data,aes(x=Year,y=Motorcycle))+
  geom_line(color="blue")+
  geom_point(color="blue")+
  ylab('Motocycle Emmission in Baltimore(by Ton)')+
  ggtitle("Motocycle Emmission in Baltimore(by Year)")+
  geom_text(aes(label=Motorcycle), position=position_dodge(width=0.9), vjust=-0.25)

#Making File
setwd("C:/Users/cyj90/github/study/exploratory-data-analysis/course_project")
dev.copy(png, file="plot5.png")
dev.off()


