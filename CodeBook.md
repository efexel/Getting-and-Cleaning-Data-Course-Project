# CodeBook

The data in [tidy.txt](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/tidy.txt) was produced by [run_analysys.R](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R).  The data was derived from the following source:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the
data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data Transformation

The data transformation produced by [run_analysys.R](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) is described below:

1. For each of the training and test datasets
    1. Merges data set (X_*dataset*.txt), activity ids (y_*dataset*.txt), subject ids (subject_*dataset*.txt), and activity names (activity_labels.txt) into a single data frame, using only the columns on mean and standard deviation from each measurement in the data set.
    1. Column names obtained from features.txt have been cleaned up, removing punctuation, and adjusting case for readability and assigned to the data
    obtained from X_*dataset*.txt.
1. Merge the training and the test sets into a single data frame
1. Pivot the data turning the measurements into rows using melt
1. Rollup each measurement into a mean for each unique subject/activity
1. Save the tidy dataset as `tidy.txt`


# Data Columns

The file [tidy.txt](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/tidy.txt) contains the following columns:

* **activity_name**:  Activity being performed
* **subject_id**: ID of subject that data was collected from
* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccMeanfreqX
* fBodyAccMeanfreqY
* fBodyAccMeanfreqZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyAccJerkMeanfreqX
* fBodyAccJerkMeanfreqY
* fBodyAccJerkMeanfreqZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyGyroMeanfreqX
* fBodyGyroMeanfreqY
* fBodyGyroMeanfreqZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccMagMeanfreq
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStd
* fBodyBodyAccJerkMagMeanfreq
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStd
* fBodyBodyGyroMagMeanfreq
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStd
* fBodyBodyGyroJerkMagMeanfreq
