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
###tidydatamean.txt
<table><tr><th>Original Name</th><th>New Name</th></tr>
<tr><td>V1</td><td>subject</td></tr>
<tr><td>*[activity_labels.txt].[V2]</td><td>activity</td></tr>
<tr><td>mean of (subject + activity) from in tidydata</td><td>mean</td></tr></table>
