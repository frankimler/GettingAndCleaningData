#Frank Imler
#22-Feb-2022
#Getting and Cleaning Data 
library(dplyr)

#Download the Data

  if(!file.exists("./gettingandcleaningdata")){dir.create("./gettingandcleaningdata")}
  dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(dataurl, destfile = "./gettingandcleaningdata/projectdata.zip")

#Unzip the Data

  unzip(zipfile = "./gettingandcleaningdata/projectdata.zip", exdir = "./gettingandcleaningdata/")

#Step 1 - Merge the Training and Test Data Sets

  #Read the Files
    #Read the Train Datasets
      xtrain <- read.table("./gettingandcleaningdata/UCI HAR Dataset/train/X_train.txt", header = FALSE)
      ytrain <- read.table("./gettingandcleaningdata/UCI HAR Dataset/train/y_train.txt", header = FALSE)
      subtrain <- read.table("./gettingandcleaningdata/UCI HAR Dataset/train/subject_train.txt", header = FALSE)  
    
    #Read the Test Datasets
      xtest <- read.table("./gettingandcleaningdata/UCI HAR Dataset/test/X_test.txt", header = FALSE)
      ytest <- read.table("./gettingandcleaningdata/UCI HAR Dataset/test/y_test.txt", header = FALSE)
      subtest <- read.table("./gettingandcleaningdata/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
    
    #Read the Features
      features <- read.table("./gettingandcleaningdata/UCI HAR Dataset/features.txt", header = FALSE)
    
    #Read the Activity Labels
      activitylabels <- read.table("./gettingandcleaningdata/UCI HAR Dataset/activity_labels.txt", header = FALSE)
    
  #Assigning Variable Names
    #Train
    colnames(xtrain) <- features[,2]
    colnames(ytrain) <- "activityId"
    colnames(subtrain) <- "subjectId"

    #Test
    colnames(xtest) <- features[,2]
    colnames(ytest) <- "activityId"
    colnames(subtest) <- "subjectId"
      
    colnames(activitylabels) <- c("activityId", "activityType")
  
  #Merging the Data Sets
      alltrain <- cbind(ytrain, subtrain, xtrain)
      alltest <- cbind(ytest, subtest, xtest)
      final <- rbind(alltrain, alltest)
    
#Step 2 - Extracting Data
    colNames <- colnames(final)
    MeanStdDev <- (grepl("activityId", colNames) |
                   grepl("subjectId", colNames) |
                   grepl("mean..", colNames) |
                   grepl("std..", colNames)
                   )
    MeanAndStdDevSubset <- final[, MeanStdDev == TRUE]
    
#Step 3 Use Descriptive Activity Names
  ActivityNames <- merge(MeanAndStdDevSubset, activitylabels, by = 'activityId', all.x = TRUE)
  
#Step 4 - Labels the Data Set with Descriptive Variable Names
  #See Assigning Variable Names in Step 1
    
#Step 5 - Create 2nd Tidy Data Set
  TidyDataSet <- aggregate(. ~subjectId + activityType, ActivityNames, mean)
  TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]
  write.table(TidyDataSet, "./gettingandcleaningdata/TidyDataSet.txt", row.name = FALSE)