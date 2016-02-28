# Getting and Cleaning Data Course Project
Coursera - M3W4 - Due 2016-02-28

Here are the data for the project:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Requirements:<br />
You should create one R script called run_analysis.R that does the following.<br />
<br />
1. Merges the training and the test sets to create one data set.<br />
2. Extracts only the measurements on the mean and standard deviation for each measurement.<br />
3. Uses descriptive activity names to name the activities in the data set<br />
4. Appropriately labels the data set with descriptive variable names.<br />
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br />

Script Notes:<br />
1. Requires packages for plyr and reshape2.<br />
2. Downloads zip to working directory.<br />
3. Unzips to working directy and then renames folder to data.<br />
4. Imports 8 files into different variables.
5. Merges data from test and train (X, y and subject) files.
6. Cleanup of column names.
7. Exports tidydata.txt and tidydatamean.txt to working directory.<br />
