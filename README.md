Getting and Cleaning Data - Final Assessment 
############################################################################################################################################################################################################################################################################

This readme file describes the getting, cleaning and processing of data provided for the assignment. 

The GITHUB repo https://github.com/andy-nambi/gettingcleaning_assignment contains the following files :

1.run_analysis.R
2.README.MD
3.CodeBook.MD

############################################################################################################################################################################################################################################################################

The run_analysis.R script does the following :

First the script reads the observations for the activity study from X_Train file and stores it in the "train" table.Next the "subject_train" file is read in as a table and this contains the subjects( 1 to 30) that recorded each of the observations. Now, we read in the list of features from the "features.txt" file to a table. This table has the variable names of all 561 variables that are part of the study. We now take this features table and use it to name the columns of observations in the "train" table. We now have a table with 7352 observations and 561 variables with tidy variable names. Next we read in the Y_train file to a table . This table contains the activity that resulted in each of the observations in the "train" table coded as numbers.We convert them to factors and then express them in terms of the corresponding activity labels based on the activity_labels.txt file.We then add this column to the "train" table and label it "Activity".Now the "train"" table is almost ready and tidy. We now convert the "train" table to a dibble using the dplyr library for easier manipulation ( this involved making the variable names unique since tibbles dont take duplicate column names. The descriptive nature of each feature is preserved thereby keeping the data set tidy). Finally we move the "Activity" and "Subject" columns to the first two columns of the table for easier readability. 

Repeate above steps to prepare the test dataset the exact same way. We then append/add the test dataset to the train dataset ( since they both have exact same columns, and column names the resultant dataset will be an accurate combination) and call it the "fulldataset."

The "fulldataset" is now tidy since it satisfies the following conditions:
1.One observation per row
2.Each measured variable in a column ( these are the 561 features describing the 3-axial linear acceleration and angular velocity of different activities from 30 subjects)
3. Since the variables here are essentially parts/components of the same set of measurements for the activities it is still considered tidy data to have them all in one table.
4. Variable names are human readable and descriptive.

We now subset the "fulldataset" and create another tibble "finaldataset" which contains the first two columns from "fulldataset" and any variable that contains a "mean" or "std" in the variable name (there are 86 such variables in the fulldataset). From here, we calculate the average of each variable by subject and activity and store it in a new data table "summarydata". In this table, each observation/row contains the averages of the 86 variables by each combination of subject and activity.For readability , we append the "average" suffix to each of the variable header names. This dataset is also tidy since it again follows the 4 principles outlines earlier in the readme ( this is a "narrow" version of tidy data. Per the marking rubric both "wide" and "narrow" forms of tidy data are allowe). Finally we write the resultant "summarydata" into a text file "summarydata.txt". This text file can be read in R using :

read.table("summarydata.txt",header=TRUE)

############################################################################################################################################################################################################################################################################
References : 
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

The full run_analysis script is reproduces below with comments for ease of marking.

######################################################################################################################################
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
## Subsetting full dataset to only select variables with "mean" or "std" anywhere in the feature names##
finaldataset<-select(fulldataset,Subject,Activity,matches('mean|std'))
## calculating average of each the "mean" and "std" variables from previous step and storing them by activity and subject in new dataframe##
summarydata<-finaldataset%>%
                group_by(Subject,Activity)%>%
                summarise_each(funs(mean))
##Adding "Average" to the variables in the final dataset for readability##
colnames(summarydata)[3:88]<-paste(colnames(summarydata)[3:88],"Average",sep=".")
##Writing final data set with averages to a text file for github upload##
write.table(summarydata,"summarydata.txt")

