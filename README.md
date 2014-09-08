# Getting and Cleaning Data: Course Project

## Introduction

This repository contains the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.

The purpose of this project is to demonstrate the ability to collect, work
with, and clean a data set. The goal is to prepare a tidy data set that can be
used for later analysis.

The project requires the following output:

1. [A tidy data set as described below](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/tidy.txt)

1. [This Github repository with the run_analysis.R script for performing the analysis](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project)

1. A [code book](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/CodeBook.md) that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

1. [This README.md file](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/README.md)

## Project

One of the most exciting areas in all of data science right now is wearable
computing - see for example this article: http://tinyurl.com/dsatatbftwtsb. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most
advanced algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the Samsung
Galaxy S smartphone.

### Data
Here is the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the
data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Project Goal

The goal of the project is to output a tidy data set containing only the average of the mean and the standard deviations of each activity and each subject from both the training and test data included in the zip file referenced above.

## How to use

The run_analysis.R script can be run from within R Studio.

The run_analysis.R script does the following:

1. If the folder "UCI HAR Dataset" is not currently present in your current working directory, the data set zip file referenced above is downloaded and unzipped.

1. Extracts only the measurements on the mean and standard deviation for each measurement from both the test and training sets.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

### References

* [Getting and Cleaning data course](https://www.coursera.org/course/getdata)
* [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1)
