#Data Loading
setwd("C:/Users/cyj90/github/data/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
NEI<-transform(NEI, type = factor(type))

#Baltimore 
NEI_Baltimore<-filter(NEI,fips == "24510")
NEI_Baltimore_by_year<-c(sum(filter(NEI_Baltimore,year==1999)$Emissions),
                         sum(filter(NEI_Baltimore,year==2002)$Emissions),
                         sum(filter(NEI_Baltimore,year==2005)$Emissions),
                         sum(filter(NEI_Baltimore,year==2008)$Emissions))
  
barplot(NEI_Baltimore_by_year,names=c(1999,2002,2005,2008),
        main="Sum of Emission in Baltimore by Year")

#Making File
setwd("C:/Users/cyj90/github/study/exploratory-data-analysis/course_project")
dev.copy(png, file="plot2.png")
dev.off()

