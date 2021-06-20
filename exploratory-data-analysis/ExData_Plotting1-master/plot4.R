#Data_Loading
setwd("C:/Users/cyj90/github/data")
#download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "electricity_consumption_zip")
#unzip(zipfile= "electricity_consumption_zip")
elec_consumption<-read.table(file = "household_power_consumption.txt", sep=";",header =TRUE)
str(elec_consumption)
Sys.setlocale(category = "LC_ALL", locale = "English")

#Data_Cleaning
elec_consumption1<-elec_consumption
elec_consumption1$Datetime<-paste(elec_consumption1$Date,elec_consumption1$Time)
elec_consumption1$Datetime<-strptime(elec_consumption1$Datetime,"%d/%m/%Y %H:%M:%S")
elec_consumption1$Date <-as.Date(elec_consumption1$Date,"%d/%m/%Y")
elec_consumption1$Global_active_power<-as.numeric(elec_consumption1$Global_active_power)
elec_consumption1$Global_reactive_power<-as.numeric(elec_consumption1$Global_reactive_power)
elec_consumption1$Voltage<-as.numeric(elec_consumption1$Voltage)
elec_consumption1$Global_intensity<-as.numeric(elec_consumption1$Global_intensity)
elec_consumption1$Sub_metering_1<-as.numeric(elec_consumption1$Sub_metering_1)
elec_consumption1$Sub_metering_2<-as.numeric(elec_consumption1$Sub_metering_2)
elec_consumption2$Global_active_power[is.na(elec_consumption2$Global_active_power)]<-0

library(dplyr)
elec_consumption2<-filter(elec_consumption1,Date<="2007-02-02"& Date>="2007-02-01")
elec_consumption2$Global_active_power[is.na(elec_consumption2$Global_active_power)]<-0


#making plot
par(mfrow=c(2,2))

#plot1
with(elec_consumption2, plot(Datetime,Global_active_power,
                             type="l",
                             xlab="",
                             ylab="Global Active Power"))
#plot2
with(elec_consumption2, plot(Datetime,Voltage,
                             type="l",
                             xlab="",
                             ylab="Voltage"))

#plot3
with(elec_consumption2, plot(Datetime,Sub_metering_1,
                             type="l",
                             xlab="",
                             ylab="Energy sub metering"))
with(elec_consumption2,lines(Datetime, Sub_metering_2, col = "red", type = "l"))
with(elec_consumption2,lines(Datetime, Sub_metering_3, col = "blue", type = "l"))

#plot4
with(elec_consumption2, plot(Datetime,Global_reactive_power,
                             type="l",
                             xlab="",
                             ylab="Global Reactive Power"))

#Making File
setwd("C:/Users/cyj90/github/study/exploratory-data-analysis/ExData_Plotting1-master/figure")
dev.copy(png, file="plot4.png")
dev.off()

