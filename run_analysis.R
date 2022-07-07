#Set working directory
setwd("~/Coursera/Getting and Cleaning Data_John Hopkins Uni/UCI HAR Dataset/UCI HAR Dataset")

#Load libraries
library(dplyr)

#Load label datasets
activity_labels=read.table("activity_labels.txt")
features=read.table("features.txt")

#Load test datasets
subject_test=read.table("~/Coursera/Getting and Cleaning Data_John Hopkins Uni/UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
X_test=read.table("~/Coursera/Getting and Cleaning Data_John Hopkins Uni/UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test=read.table("~/Coursera/Getting and Cleaning Data_John Hopkins Uni/UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

#Load train datasets
subject_train=read.table("~/Coursera/Getting and Cleaning Data_John Hopkins Uni/UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
X_train=read.table("~/Coursera/Getting and Cleaning Data_John Hopkins Uni/UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
y_train=read.table("~/Coursera/Getting and Cleaning Data_John Hopkins Uni/UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

#Apply appropriate column names and row identifiers to test dataset
  #Apply column names from the features table
  colnames(X_test)=features$V2
  
  #Add subject ID to the test dataframe
  X_test=cbind(X_test,as.vector(subject_test$V1))
  #Rename the subject ID column
  colnames(X_test)[562]="Subject_ID"
  
  #Add activity ID to test dataframe
  X_test=cbind(X_test,as.vector(y_test$V1))
  #Rename the activity ID column
  colnames(X_test)[563]="Activity_ID"
  
  
#Apply appropriate column names and row identifiers to train dataset
  #Apply column names from the features table
  colnames(X_train)=features$V2
  
  #Add subject ID to the train dataframe
  X_train=cbind(X_train,as.vector(subject_train$V1))
  #Rename the subject ID column
  colnames(X_train)[562]="Subject_ID"
  
  #Add activity ID to train dataframe
  X_train=cbind(X_train,as.vector(y_train$V1))
  #Rename the activity ID column
  colnames(X_train)[563]="Activity_ID"
  
  
#Combine the test and train data together
X_test_train=rbind(X_test,X_train)

#Select only columns with means or sd
X_test_train=X_test_train%>%
  select((contains("mean")|contains("sd")|contains("Mean")),Subject_ID,Activity_ID)

#Summarize dataset by grouping by Activity_ID, Subject_ID, and averaging the values
Summarized_X_test_train=X_test_train%>%group_by(Activity_ID,Subject_ID)%>%summarise_all(mean)
