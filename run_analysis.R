
##Create directory
if(!file.exists("./data")){dir.create("./data")}
##Read test data and labels
testsetFile<-"~/R/gacd/project/UCI HAR Dataset/test/X_test.txt"
TestData<-read.table(testsetFile,header=F)
##head(TestData)
##names(TestData)
testLabelFile<-"~/R/gacd/project/UCI HAR Dataset/test/y_test.txt"
TestLabel<-read.table(testLabelFile)
##head(TestLabel)
##names(TestLabel)
## combine test set data and test set labels
test<-cbind(TestLabel,TestData)
##head(test)
##Read trial data and labels
trainsetFile<-"~/R/gacd/project/UCI HAR Dataset/train/X_train.txt"
TrainData<-read.table(trainsetFile,header=F)
##head(TrainData)
##names(TrainData)
trainLabelFile<-"~/R/gacd/project/UCI HAR Dataset/train/y_train.txt"
TrainLabel<-read.table(trainLabelFile)
##head(TrainLabel)
##names(TrainLable)
##combine train data and labels
train<-cbind(TrainLabel,TrainData)
##head(train)
##merge test data and train data
y<-rbind(test,train)
##head(y)
##summary(y)
##Read activity file
labelsFile<-"~/R/gacd/project/UCI HAR Dataset/activity_labels.txt"
Labels<-read.table(labelsFile)
##head(Labels)
##Read features labels and apply to merged file
featuresFile<-"~/R/gacd/project/UCI HAR Dataset/features.txt"
Features<-read.table(featuresFile)
Features[,2]
features<-as.vector(Features[,2])
##str(Features)
##str(features)
names(y)<-c("Label",features)
##names(y)
##head(y,n=2)
##str(y)
##Create a table with only mean and std values
meanlabel<-grep("mean()",names(y),fixed=T)
meanlabel
stdlabel<-grep("std()",names(y),fixed=T)
stdlabel
mean_std_Table<-y[,c(1,meanlabel,stdlabel)]
##Add the activity labels to the mean_std table
activity<-mean_std_Table[,1]
for (i in 1:6){
activity<-gsub(i,Labels[i,2],activity)
}
##head(activity)
mean_std_Table<-cbind(activity,mean_std_Table)
##head(mean_std_Table[,1:3],n=10)
##names(mean_std_Table)

##Create a second tidy data set with avg of each variable
##for each activity and each subject
library(reshape2)
DF<-as.data.frame(mean_std_Table)
aql<-melt(DF,id.vars="activity")
##tail(aql,n=100)
aqw<-dcast(aql,activity~variable,mean)
##head(aqw)
write.table(aqw,file="tidydata.csv")
write.table(aqw,file="tidydata.txt")
