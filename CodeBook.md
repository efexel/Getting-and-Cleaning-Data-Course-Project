# CodeBook

## Data Source

The data output by [run_analysys.R](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) was derived from the following source:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the
data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Description

The following information was extracted from the README.txt contained in the the zip file referenced above.  Check the README.txt for additional information.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## Data Transformation

The goal of the data transformation is to aggregate each mean and standard deviation measurement in the original data file to each unique subject and activity combination.

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

## Output Data Columns

The resulting file, tidy.txt, contains the following columns.  All variables are the mean of all measurement values for each unique subject and activity combination.

Variables ending in X, Y, or Z represent the measurements along the X, Y, and axis.  Items not ending in X, Y, or Z represent the mean of all axis combined in order to measure the magnitude of the movement.

Variables beginning with t are time based measurements.
Variables beginning with f are frequency based measurements.

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

### activity_name

The possible values for activity_name are:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
