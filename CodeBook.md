# CodeBook

The data output by [run_analysys.R](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) was derived from the following source:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the
data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data Transformation

[run_analysys.R](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) transforms the data by doing the following:

Note:  The italicized *dataset* below is a placeholder for the *train* or *test* datasets included in the zip file above.

1. For each *train* and *test* *dataset* a data frame is produced by:
    1. Merging data set (*dataset*/X_*dataset*.txt), activity ids
    (*dataset*/y_*dataset*.txt), subject ids
    (*dataset*/subject_*dataset*.txt), and activity names
    (activity_labels.txt) into a single data frame.
    1. Only the time and frequency columns containing mean and standard deviation values from each measurement in the data set are retained.
    1. Column names obtained from features.txt have been cleaned up, removing punctuation, and adjusting case for readability and assigned to the data.
1. Merging the train and the test data frames into a single data frame
1. Pivoting the data turning the measurements into rows using melt
1. Rolling up each measurement into a mean for each unique subject/activity
1. Saving the tidy dataset to the current working directory as "tidy.txt"

# Data Columns

The resulting file, tidy.txt, contains the following columns:

* **subject_id**: ID of subject that data was collected from
* **activity_name**:  Activity being performed
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
* fBodyAccMeanFreqX
* fBodyAccMeanFreqY
* fBodyAccMeanFreqZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyAccJerkMeanFreqX
* fBodyAccJerkMeanFreqY
* fBodyAccJerkMeanFreqZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyGyroMeanFreqX
* fBodyGyroMeanFreqY
* fBodyGyroMeanFreqZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccMagMeanFreq
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStd
* fBodyBodyAccJerkMagMeanFreq
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStd
* fBodyBodyGyroMagMeanFreq
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStd
* fBodyBodyGyroJerkMagMeanFreq
