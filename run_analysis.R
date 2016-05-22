activity_labels<-read.table("activity_labels.txt",col.names = c("num","label"),stringsAsFactors = FALSE)
features<-read.table("features.txt",col.names = c("num","feature"),stringsAsFactors = FALSE)

features.sorted <- grep("mean|std", features[,2])
features.sorted.names<- features[featuresWanted,2]


train.x <- read.table("train/X_train.txt",stringsAsFactors = FALSE)[featuresWanted]
train.y <- read.table("train/Y_train.txt",stringsAsFactors = FALSE)
train.Subjects <- read.table("train/subject_train.txt",stringsAsFactors = FALSE)
train <- cbind(train.Subjects, train.y, train.x)

test.x <- read.table("test/X_test.txt",stringsAsFactors = FALSE)[featuresWanted]
test.y <- read.table("UCI HAR Dataset/test/Y_test.txt",stringsAsFactors = FALSE)
test.Subjects <- read.table("UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
test <- cbind(test.Subjects, test.y, test.x)

final.data<-rbind(train,test)
colnames(final.data)<-c()