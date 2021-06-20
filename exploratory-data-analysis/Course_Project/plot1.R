#Data Loading
setwd("C:/Users/cyj90/github/data/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)

NEI<-transform(NEI, type = factor(type))

NEI_by_year<-c(sum(filter(NEI,year==1999)$Emissions),
  sum(filter(NEI,year==2002)$Emissions),
  sum(filter(NEI,year==2005)$Emissions),
  sum(filter(NEI,year==2008)$Emissions))

getOption("scipen")
opt <- options("scipen" = 20)
getOption("scipen")

barplot(NEI_by_year,names=c(1999,2002,2005,2008),
        ylim=c(0,7000000),
        main="Sum of Emission by Year")

#Making File
setwd("C:/Users/cyj90/github/study/exploratory-data-analysis/course_project")
dev.copy(png, file="plot1.png")
dev.off()

