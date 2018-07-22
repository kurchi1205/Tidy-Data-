library(data.table)
library(reshape2)
#Reading test data
xtest<-read.table("E:/Coursera/UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("E:/Coursera/UCI HAR Dataset/test/y_test.txt")
subtest<-read.table("E:/Coursera/UCI HAR Dataset/test/subject_test.txt")
#reading train data
xtrain<-read.table("E:/Coursera/UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("E:/Coursera/UCI HAR Dataset/train/y_train.txt")
subtrain<-read.table("E:/Coursera/UCI HAR Dataset/train/subject_train.txt")
#reading activity labels
act<-read.table("E:/Coursera/UCI HAR Dataset/activity_labels.txt")
#reading features
f<-read.table("E:/Coursera/UCI HAR Dataset/features.txt")
#selecting only std and mean
features_req<-grepl("std()|mean()",f[,2])
#naming the train and test data columns
names(xtest)<-f[,2]
names(xtrain)<-f[,2]
#selecting the required columns
xtest<-xtest[,features_req]
xtrain<-xtrain[,features_req]
#giving activity labels with ids
ytest<-cbind(act[ytest[,1],])
ytrain<-cbind(act[ytrain[,1],])
names(ytest)<-c("Id","Activity_label")
names(ytrain)<-c("Id","Activity_label")
#naming the subject data
names(subtrain)<-"Subject"
names(subtest)<-"Subject"
#joining x_test,y_test,subject
testdata<-cbind(xtest,ytest,subtest)
#joining x_train,y_train,subject
traindata<-cbind(xtrain,ytrain,subtrain)
#merging test and train data
data3<-rbind(testdata,traindata)
actlabel<-c("Subject","Id","Activity_label")
measurelabel<-setdiff(colnames(data3),actlabel)
#melting the data based on id and measure values
mdata<-melt(data3,id = actlabel,measure.vars = measurelabel,na.rm = TRUE)
#casting back the data with calculated mean
fdata<-dcast(mdata,Subject+Activity_label~variable,mean)
write.table(fdata,"E:/Coursera/UCI HAR Dataset/tidy_data.txt")
