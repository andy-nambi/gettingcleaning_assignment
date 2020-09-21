setwd("C:/Users/andir/Desktop/JHU_R_Certification/UCI_HAR_Project")
library(tidyverse)
library(reshape2)
## Reading values of the train dataset into a table##
train<-read.table("train/X_train.txt",header=FALSE,fill=TRUE)
## Reading the subjects contributing to the values in the train dataset into a table##
trainsub<-read.table("train/subject_train.txt", header=FALSE, fill=TRUE)
## Reading the feature names into a table##
feat<-read.table("features.txt",header=FALSE,fill=TRUE)
## Adding the feature names (561 variable names) to the header row in the train dataset##
colnames(train)<-feat[,2]
## Reading in the activities corresponding to each observation in the train dataset ##
trainlabels<-read.table("train/Y_train.txt",header=FALSE,fill=TRUE)
## Converting the activities to factors##
trainlabels$V1<-as.factor(trainlabels$V1)
## Setting levels to the activity factor variable##
levels(trainlabels$V1)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
## Adding the activity labels to the train dataset as a column##
train<-cbind(train,trainlabels)
## Re-naming the column with activity labels to satisfy tidy data requirements##
names(train)[names(train)=="V1"]<-"Activity"
## Adding the Subject column with subject informtion from the train sub dataset##
train$Subject<-trainsub$V1
## Forcing column headers to be unique for manipulation using DPLYR Tibble format##
uniquetrainnames<-make.names(names=names(train),unique=TRUE,allow_=TRUE)
names(train)<-uniquetrainnames
train<-tbl_df(train)
##Moving Activity and Subject columns to the front for easier readability##
train<-select(train,Activity,everything())
train<-select(train,Subject,everything())

## Test dataset is read and processed same way as train dataset above##
test<-read.table("test/X_test.txt",header=FALSE,fill=TRUE)
testsub<-read.table("test/subject_test.txt", header=FALSE, fill=TRUE)
colnames(test)<-feat[,2]
testlabels<-read.table("test/Y_test.txt",header=FALSE,fill=TRUE)
testlabels$V1<-as.factor(testlabels$V1)
levels(testlabels$V1)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
test<-cbind(test,testlabels)
names(test)[names(test)=="V1"]<-"Activity"
test$Subject<-testsub$V1
uniquetestnames<-make.names(names=names(test),unique=TRUE,allow_=TRUE)
names(test)<-uniquetestnames
test<-tbl_df(test)
test<-select(test,Activity,everything())
test<-select(test,Subject,everything())
## Appending test data set to the train data set to form the full data set##
fulldataset<-rbind(train,test)
view(fulldataset)
## Subsetting full dataset to only select variables with "mean" or "std" anywhere in the feature names##
finaldataset<-select(fulldataset,Subject,Activity,matches('mean|std'))
## calculating average of each the "mean" and "std" variables from previous step and storing them by activity and subject in new dataframe##
summarydata<-finaldataset%>%
                group_by(Subject,Activity)%>%
                summarise_each(funs(mean))
##Adding "Average" to the variables in the final dataset for readability##
colnames(summarydata)[3:88]<-paste(colnames(summarydata)[3:88],"Average",sep=".")
##Writing final data set with averages to a text file for github upload##
write.table(summarydata,"summarydata.txt",rownames=FALSE)
