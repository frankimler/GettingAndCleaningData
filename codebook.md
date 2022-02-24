Codebook for John Hopkins University Data science Specialization Getting and Cleaning Data Week 4 Project

Steps to Follow:
1.  Download the run_analysis.R file in this repo into the working directory in R Studio
2.  Execute the R script*

*Note - this R script uses the dplyr package so please make sure it is installed and up-to-date on your system.  Also, this script requires that the data be unaltered.

Data Source:

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  


The run_analysis.R script:

The file run_analysis.R performs the tasks required tasks in the project.  Those tasks are:
  Step 1:   Merges the training and the test sets to create one data set.
            -#Read the Files
              -#Read the Train Datasets
              -#Read the Test Datasets
              -#Read the Features
              -Read the Activity Labels
            -#Assigning Varialble Names
              -#Train
              -#Test
            -#Merge the Datasets
  Step 2.   Extracts only the measurements on the mean and standard deviation for each measurement. 
            -#Extracting Data
  Step 3.   Uses descriptive activity names to name the activities in the data set
            -#Use Descriptive Activity Names  
  Step 4.   Appropriately labels the data set with descriptive variable names.
            -This is completed in the #Assigning Variable Names in Step 1
  Step 5.   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
            -#Create 2nd Tide Data Set
            
About the Variables:
- xtrain, ytrain, subtrain, xtest, ytest, subtest, features, activitylabels contain the downloaded data
- alltrain, alltest final contain the merged data
- TidyDataSet.txt is the 2nd data independent tidy data set
