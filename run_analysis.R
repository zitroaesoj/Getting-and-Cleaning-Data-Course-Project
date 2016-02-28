## Month 3 Week 4 - PROJECT

## 1. Merges the training and the test sets to create one data set.

## install.packages("plyr", dependencies = TRUE)
library(plyr)
library(reshape2)

## workdir <- "C:/Users/JoseO/Documents/GitHub/Getting-and-Cleaning-Data-Course-Project/" ## my working directory
## setwd(workdir)

workdir <- paste0(getwd(), "/") ## Use existing working directory or change it to what works for your machine
setwd(workdir) ## Set working directory

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localzip <- paste0(workdir,"Project.zip")
download.file(url, destfile = localzip)
unzip(localzip)

## Rename folder created by unzipping to data
file.rename(paste0(workdir, "UCI HAR Dataset"), "data") 

## set directory defaults
datadir <- paste0(workdir,"data/") ## data directory 
testdir <- paste0(datadir,"test/") ## test directory
traindir <- paste0(datadir,"train/") ## train directory

## read.table on all necessary files in test and train directories
activity <- read.table(paste0(datadir, "activity_labels.txt"))
features <- read.table(paste0(datadir, "features.txt"))
testdata <- read.table(paste0(testdir, "X_test.txt"))
testlabel <- read.table(paste0(testdir, "y_test.txt"))
testsubject <- read.table(paste0(testdir, "subject_test.txt"))
traindata <- read.table(paste0(traindir, "X_train.txt"))
trainlabel <- read.table(paste0(traindir, "y_train.txt"))
trainsubject <- read.table(paste0(traindir, "subject_train.txt"))

## verify all tables have data
dim(features)
## [1] 561   2
dim(testdata)
## [1] 2947  561
dim(testlabel)
## [1] 2947    1
dim(testsubject)
## [1] 2947    1
dim(traindata)
## [1] 7352  561
dim(trainlabel)
## [1] 7352    1
dim(trainsubject)
## [1] 7352    1

## row bind test/train data/label/subject
mergedata <- rbind(traindata, testdata)
mergelabel <- rbind(trainlabel, testlabel)
mergesubject <- rbind(trainsubject, testsubject)

## verify all merged tables have data
dim(mergedata)
## [1] 10299   561
dim(mergelabel)
## [1] 10299     1
dim(mergesubject)
## [1] 10299     1



## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
extractindexes <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(extractindexes)
## [1] 66

## keep only mergedata columns where mean or std found in name
mergedata <- mergedata[, extractindexes]
dim(mergedata)
## [1] 10299    66

## use features[,2] as column names for mergedata, remove ()- and lowercase
names(mergedata) <- tolower(gsub("-", "", gsub("\\(\\)", "", features[extractindexes, 2])))



## 3. Uses descriptive activity names to name the activities in the data set
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activitylabel <- activity[mergelabel[, 1], 2]
mergelabel[, 1] <- activitylabel
names(mergelabel) <- "activity"


## 4. Appropriately labels the data set with descriptive variable names.
names(mergesubject) <- "subject"
tidydata <- cbind(mergesubject, mergelabel, mergedata)
dim(tidydata) 
## [1] 10299    68

## Export first table
write.table(tidydata, paste0(workdir,"tidydata.txt"), row.names = FALSE) 


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydatamean <- ddply(melt(tidydata, id.vars=c("subject", "activity")), .(subject, activity, variable), summarise, mean=mean(value))
dim(tidydatamean)
## [1] 11880     4

## Export second table
write.table(tidydatamean, paste0(workdir,"tidydatamean.txt"), row.names = FALSE) 