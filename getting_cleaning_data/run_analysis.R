library(dplyr)
setwd("C:/Users/cyj90/github/study/getting_cleaning_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

## DATA Binding
activity_labels<-read.table(file="activity_labels.txt",col.names=c("acitivity","labels"),sep= " ")
features<-read.table(file="features.txt")

feature_test<-read.table(file="test/X_test.txt")
activity_test<-read.table(file="test/y_test.txt")
subject_test<-read.table(file="test/subject_test.txt",sep= " ",fill=TRUE)

feature_train<-read.table(file="train/X_train.txt")
activity_train<-read.table(file="train/y_train.txt")
subject_train<-read.table(file="train/subject_train.txt",sep= " ",fill=TRUE)

feature_total<-rbind(feature_test, feature_train)
activity_total<-rbind(activity_test, activity_train)
subject_total<-rbind(subject_test, subject_train)

## Making activity data to factor
names(feature_total)<-features[,2]
names(activity_total)<-"activity"
names(subject_total)<-"subject"
activity_total<-factor(activity_total$activity, labels = as.character(activity_labels[,2]))

## Create total data and write table down)
Total_data<-cbind(subject_total,activity_total,feature_total)
Total_data_mean_std<-Total_data[,grep("subject|activity|mean|std",names(Total_data),ignore.case = TRUE)]

setwd("C:/Users/cyj90/github/study/getting_cleaning_data")
write.table(Total_data_mean_std, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE)


