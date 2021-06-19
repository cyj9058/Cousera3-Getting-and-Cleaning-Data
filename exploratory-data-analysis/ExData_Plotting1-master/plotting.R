#Data_Loading
setwd("C:/Users/cyj90/github/data")
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "electricity_consumption_zip")
unzip(zipfile= "electricity_consumption_zip")
elec_consumption<-read.table(file = "household_power_consumption.txt", sep=";",header =TRUE)
str(elec_consumption)

#Data_Cleaning
elec_consumption1<-elec_consumption
elec_consumption1$Datetime<-paste(elec_consumption1$Date,elec_consumption1$Time)
elec_consumption1$Datetime<-as.POSIXct(elec_consumption1$Datetime,"%d/%m/%Y %H:%M:%S")
elec_consumption1$Global_active_power<-as.numeric(elec_consumption1$Global_active_power)
elec_consumption1$Global_reactive_power<-as.numeric(elec_consumption1$Global_reactive_power)
elec_consumption1$Voltage<-as.numeric(elec_consumption1$Voltage)
elec_consumption1$Global_intensity<-as.numeric(elec_consumption1$Global_intensity)
elec_consumption1$Sub_metering_1<-as.numeric(elec_consumption1$Sub_metering_1)
elec_consumption1$Sub_metering_2<-as.numeric(elec_consumption1$Sub_metering_2)
elec_consumption1<-elec_consumption1[,3:10]

