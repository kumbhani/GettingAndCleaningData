Getting And Cleaning Data
==============
This is the repo for the course project for the Coursera class: Getting and Cleaning Data

Purpose:
==============
I will create one R script called run_analysis.R that does the following. 

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity type and each subject.

Required R packages:
==============
	data.table (the script will attempt to install this package if it's not already installed; requires internet access).

Input Data:
==============

* All data for this project come from the accelerometers of Samsung Galaxy S smartphones. A full description is available at the UCI [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
).
* Data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

General Instructions to run script
==============

Running the run_analysis.R script, will do the following:

1. Load the data.table package. If it's not installed, it will attempt to download it.
2. It will look in the current directory to see if the UCI HAR dataset is available (folder named "UCI HAR dataset").
3. If it's not available, it will attempt download and unzip the data into a directory called "UCI HAR Dataset"
4. It will then load the training and testing datasets, subseting the data only pertaining to mean and std values, and then summarize the average results by subject and activity type
5. The result will be saved in a file called "UCI_HAR_summary.txt". See CodeBook.md for a full description of the tidy data set.
