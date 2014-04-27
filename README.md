Getting and Cleaning Data Project
=================================

This repo include projects file for Coursera "Getting and Cleaning Data" by Jeff Leek, Roger D. Peng, Brian Caffo, PhD.

About
-----

In the project one R script called run_analysis.R was created. 
It uses the folowing dataset

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

(A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

The script does the following.
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



File list
---------

* README.md - this file
* CodeBook.md - describes the variables, the data, and any transformations or work that was performed to clean up the data
* run_analisis.R - GNU R script file used to transforme dataset
* UHDmean.txt - tidy data set with the average of each variable for each activity and each subject.
