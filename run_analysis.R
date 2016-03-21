library(reshape2)

#set path
setwd("/Users/TenYang/Desktop/Rstudio/cleaning data/project")

#read data into R
features<-read.table("features.txt")
subject.train<-read.table("./train/subject_train.txt")
x.train<-read.table("./train/X_train.txt")
y.train<-read.table("./train/y_train.txt")
subject.test<-read.table("./test/subject_test.txt")
x.test<-read.table("./test/X_test.txt")
y.test<-read.table("./test/y_test.txt")
activity.label<-read.table("activity_labels.txt")
activity.label

#name the column 
colnames(x.train)<-features[,2]
colnames(x.test)<-features[,2]
colnames(subject.train)<-"subjectID"
colnames(subject.test)<-"subjectID"
colnames(y.train)<-"label"
colnames(y.test)<-"label"

#combine train dataset
trainset<-cbind(subject.train,x.train,y.train)
head(trainset)
#combine test dataset
testset<-cbind(subject.test,x.test,y.test)
head(testset)
#Q1:combine the whole dataset
all_data<-rbind(trainset,testset)
nrow(all_data)

#Q2:Extracts only the measurements on the mean and standard deviation
colName<-colnames(all_data)
colName
require_col<-grep("-(*mean*|*std*)\\(\\)",features[,2])
require_col
new_data<-all_data[,require_col]
new_data

#Q3:Uses descriptive activity names to name the activities in the data set
activity.label[,2] <- as.character(activity.label[,2])

current=1
for(currentlabel in activity.label$V2){
  all_data$label<-gsub(current,currentlabel,all_data$label)
  current<-current+1
}
#Q4:Appropriately labels the data set with descriptive variable names
names(all_data)

#Q5:creates a  tidy data set with the average of each variable for each activity and each subject.
all_data$subjectID<-as.factor(all_data$subjectID)
all_data$label<-as.factor(all_data$label)
aggre_data<-melt(all_data,id=c("subjectID","label"))
aggre_mean<-dcast(aggre_data,subjectID+label~variable,mean)
summary(aggre_mean)
write.csv(aggre_mean, "aggre_mean.csv", row.names = FALSE, quote = FALSE)