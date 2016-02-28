#CODE BOOK
####Data Provider:
UCI HAR Dataset<br>
<br>
####Data Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br>
<br>
<br>
####Dependancies:
library(plyr)<br>
library(reshape2)<br>
<br>
<br>
####Variables:
workdir <i>- working directory</i><br>
url <i>- data source url</i><br>
localzip <i>- name for local zip file</i><br>
datadir <i>- data directory path, where files were unzipped to</i><br>
testdir <i>- data directory, test subfolder path</i><br>
traindir <i>- data directory, train subfolder path</i><br>
activity <i>- data table for "activity_labels.txt"</i><br>
features <i>- data table for "features.txt"</i><br>
testdata <i>- data table for "X_test.txt"</i><br>
testlabel <i>- data table for "y_test.txt"</i><br>
testsubject <i>- data table for "subject_test.txt"</i><br>
traindata <i>- data table for "X_train.txt"</i><br>
trainlabel <i>- data table for "y_train.txt"</i><br>
trainsubject <i>- data table for "subject_train.txt"</i><br>
mergedata <i>- data table for merged data from traindata and testdata tables</i><br>
mergelabel <i>- data table for merged data from trainlabel and testlabel tables</i><br>
mergesubject <i>- data table for merged data from trainsubject and testsubject tables</i><br>
extractindexes <i>- list of indexes for features with the words mean() or std() in them</i><br>
activitylabel <i>- list of activities from mergelabel with name from activity</i><br>
tidydata <i>- data table for joined data from mergesubject, mergelabel and mergedata</i><br>
tidydatamean <i>- data table for summerized mean by subject and activity</i><br>

####OUTPUT:
###tidydata.txt
<table><tr><th>Original Name</th><th>New Name</th></tr>
<tr><td>V1</td><td>subject</td></tr>
<tr><td>*[activity_labels.txt].[V2]</td><td>activity</td></tr>
<tr><td>tBodyAcc-mean()-X</td><td>tbodyaccmeanx</td></tr>
<tr><td>tBodyAcc-mean()-Y</td><td>tbodyaccmeany</td></tr>
<tr><td>tBodyAcc-mean()-Z</td><td>tbodyaccmeanz</td></tr>
<tr><td>tBodyAcc-std()-X</td><td>tbodyaccstdx</td></tr>
<tr><td>tBodyAcc-std()-Y</td><td>tbodyaccstdy</td></tr>
<tr><td>tBodyAcc-std()-Z</td><td>tbodyaccstdz</td></tr>
<tr><td>tGravityAcc-mean()-X</td><td>tgravityaccmeanx</td></tr>
<tr><td>tGravityAcc-mean()-Y</td><td>tgravityaccmeany</td></tr>
<tr><td>tGravityAcc-mean()-Z</td><td>tgravityaccmeanz</td></tr>
<tr><td>tGravityAcc-std()-X</td><td>tgravityaccstdx</td></tr>
<tr><td>tGravityAcc-std()-Y</td><td>tgravityaccstdy</td></tr>
<tr><td>tGravityAcc-std()-Z</td><td>tgravityaccstdz</td></tr>
<tr><td>tBodyAccJerk-mean()-X</td><td>tbodyaccjerkmeanx</td></tr>
<tr><td>tBodyAccJerk-mean()-Y</td><td>tbodyaccjerkmeany</td></tr>
<tr><td>tBodyAccJerk-mean()-Z</td><td>tbodyaccjerkmeanz</td></tr>
<tr><td>tBodyAccJerk-std()-X</td><td>tbodyaccjerkstdx</td></tr>
<tr><td>tBodyAccJerk-std()-Y</td><td>tbodyaccjerkstdy</td></tr>
<tr><td>tBodyAccJerk-std()-Z</td><td>tbodyaccjerkstdz</td></tr>
<tr><td>tBodyGyro-mean()-X</td><td>tbodygyromeanx</td></tr>
<tr><td>tBodyGyro-mean()-Y</td><td>tbodygyromeany</td></tr>
<tr><td>tBodyGyro-mean()-Z</td><td>tbodygyromeanz</td></tr>
<tr><td>tBodyGyro-std()-X</td><td>tbodygyrostdx</td></tr>
<tr><td>tBodyGyro-std()-Y</td><td>tbodygyrostdy</td></tr>
<tr><td>tBodyGyro-std()-Z</td><td>tbodygyrostdz</td></tr>
<tr><td>tBodyGyroJerk-mean()-X</td><td>tbodygyrojerkmeanx</td></tr>
<tr><td>tBodyGyroJerk-mean()-Y</td><td>tbodygyrojerkmeany</td></tr>
<tr><td>tBodyGyroJerk-mean()-Z</td><td>tbodygyrojerkmeanz</td></tr>
<tr><td>tBodyGyroJerk-std()-X</td><td>tbodygyrojerkstdx</td></tr>
<tr><td>tBodyGyroJerk-std()-Y</td><td>tbodygyrojerkstdy</td></tr>
<tr><td>tBodyGyroJerk-std()-Z</td><td>tbodygyrojerkstdz</td></tr>
<tr><td>tBodyAccMag-mean()</td><td>tbodyaccmagmean</td></tr>
<tr><td>tBodyAccMag-std()</td><td>tbodyaccmagstd</td></tr>
<tr><td>tGravityAccMag-mean()</td><td>tgravityaccmagmean</td></tr>
<tr><td>tGravityAccMag-std()</td><td>tgravityaccmagstd</td></tr>
<tr><td>tBodyAccJerkMag-mean()</td><td>tbodyaccjerkmagmean</td></tr>
<tr><td>tBodyAccJerkMag-std()</td><td>tbodyaccjerkmagstd</td></tr>
<tr><td>tBodyGyroMag-mean()</td><td>tbodygyromagmean</td></tr>
<tr><td>tBodyGyroMag-std()</td><td>tbodygyromagstd</td></tr>
<tr><td>tBodyGyroJerkMag-mean()</td><td>tbodygyrojerkmagmean</td></tr>
<tr><td>tBodyGyroJerkMag-std()</td><td>tbodygyrojerkmagstd</td></tr>
<tr><td>fBodyAcc-mean()-X</td><td>fbodyaccmeanx</td></tr>
<tr><td>fBodyAcc-mean()-Y</td><td>fbodyaccmeany</td></tr>
<tr><td>fBodyAcc-mean()-Z</td><td>fbodyaccmeanz</td></tr>
<tr><td>fBodyAcc-std()-X</td><td>fbodyaccstdx</td></tr>
<tr><td>fBodyAcc-std()-Y</td><td>fbodyaccstdy</td></tr>
<tr><td>fBodyAcc-std()-Z</td><td>fbodyaccstdz</td></tr>
<tr><td>fBodyAccJerk-mean()-X</td><td>fbodyaccjerkmeanx</td></tr>
<tr><td>fBodyAccJerk-mean()-Y</td><td>fbodyaccjerkmeany</td></tr>
<tr><td>fBodyAccJerk-mean()-Z</td><td>fbodyaccjerkmeanz</td></tr>
<tr><td>fBodyAccJerk-std()-X</td><td>fbodyaccjerkstdx</td></tr>
<tr><td>fBodyAccJerk-std()-Y</td><td>fbodyaccjerkstdy</td></tr>
<tr><td>fBodyAccJerk-std()-Z</td><td>fbodyaccjerkstdz</td></tr>
<tr><td>fBodyGyro-mean()-X</td><td>fbodygyromeanx</td></tr>
<tr><td>fBodyGyro-mean()-Y</td><td>fbodygyromeany</td></tr>
<tr><td>fBodyGyro-mean()-Z</td><td>fbodygyromeanz</td></tr>
<tr><td>fBodyGyro-std()-X</td><td>fbodygyrostdx</td></tr>
<tr><td>fBodyGyro-std()-Y</td><td>fbodygyrostdy</td></tr>
<tr><td>fBodyGyro-std()-Z</td><td>fbodygyrostdz</td></tr>
<tr><td>fBodyAccMag-mean()</td><td>fbodyaccmagmean</td></tr>
<tr><td>fBodyAccMag-std()</td><td>fbodyaccmagstd</td></tr>
<tr><td>fBodyBodyAccJerkMag-mean()</td><td>fbodybodyaccjerkmagmean</td></tr>
<tr><td>fBodyBodyAccJerkMag-std()</td><td>fbodybodyaccjerkmagstd</td></tr>
<tr><td>fBodyBodyGyroMag-mean()</td><td>fbodybodygyromagmean</td></tr>
<tr><td>fBodyBodyGyroMag-std()</td><td>fbodybodygyromagstd</td></tr>
<tr><td>fBodyBodyGyroJerkMag-mean()</td><td>fbodybodygyrojerkmagmean</td></tr>
<tr><td>fBodyBodyGyroJerkMag-std()</td><td>fbodybodygyrojerkmagstd</td></tr></table>
###tidydatamean.txt
<table><tr><th>Original Name</th><th>New Name</th></tr>
<tr><td>V1</td><td>subject</td></tr>
<tr><td>*[activity_labels.txt].[V2]</td><td>activity</td></tr>
<tr><td>mean of (subject + activity) from in tidydata</td><td>mean</td></tr></table>
