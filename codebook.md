#Codebook for John Hopkins University Data science Specialization Getting and Cleaning Data Week 4 Project

Step 1:  Download the run_analysis.R file in this repo into the working directory in R Studio
Step 2:  Execute the R script*

*Note - this R script uses the dplyr package so please make sure it is installed and up-to-date on your system

Data Source:

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  


The run_analysis.R script:

The file run_analysis.R performs the tasks required tasks in the project.  Those tasks are:
  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.  Uses descriptive activity names to name the activities in the data set
  4.  Appropriately labels the data set with descriptive variable names. 
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
