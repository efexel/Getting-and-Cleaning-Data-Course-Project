# Getting and Cleaning Data: Course Project

## Introduction

This repository contains the course project for the Coursera course [Getting and Cleaning data course](https://www.coursera.org/course/getdata), part of the [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1).

The purpose of this project is to demonstrate the ability to collect, work
with, and clean a data set. The goal is to prepare a tidy data set that can be
used for later analysis.

The project requires the following output:

1. A [tidy data set](https://s3.amazonaws.com/coursera-uploads/user-4c00dfb3c037b811b28c2e7b/972585/asst-3/b424bf503c6811e49ad54de1ab168c2e.txt) as described below

1. [This Github repository with the run_analysis.R script for performing the analysis](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project)

1. A [code book](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/CodeBook.md) that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

1. [This README.md file](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/README.md)

## Project

One of the most exciting areas in all of data science right now is wearable
computing - see for example this article: http://tinyurl.com/dsatatbftwtsb. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most
advanced algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the Samsung
Galaxy S smartphone.

### Source Data
The source data for this project was obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the
data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Project Goal

The goal of the project is to output a tidy data set containing only the average of the mean and the standard deviations of each activity and each subject from both the training and test data included in the zip file referenced above.

## How to use

The run_analysis.R script can by sourcing the file from within R Studio.

The script will attempt to read data, download data if needed, and output results to the current working directory so it is recommended that you set it accordingly with setwd() prior to running it.  If you already have a copy of the data on your local system, set the working directory to the parent folder of that data, or its zip file.

The run_analysis.R script does the following:

1. If the folder "UCI HAR Dataset" is not present in your current working directory, it will do the following:
    1. Check to see if the zip file is present
    1. If the zip file is not present, it is downloaded to the current working directory.
    1. Uzip the zip file.

1. Extracts only the measurements on the mean and standard deviation for each measurement from both the test and training sets.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

The output file, tidy.txt, can be read back into R Studio with:

      data <- read.table("tidy.txt", header = TRUE)
      View(data)

See [CodeBook.md](https://github.com/efexel/Getting-and-Cleaning-Data-Course-Project/blob/master/CodeBook.md) for more detail on the output.


### References

* [Getting and Cleaning data course](https://www.coursera.org/course/getdata)
* [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1)
