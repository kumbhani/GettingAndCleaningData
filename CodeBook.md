# CodeBook for run_analysis.R

Original Data:
==========
The original data can be obtained from the following URL:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

An extended description of the data is available from the source:
[University of California - Irvine, Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

run_analysis.R:
===============

This script performs the following transformations on the original data set:

1. Loads the data.table package (downloads if necessary)
2. Downloads and uncompresses the raw data
3. Reads in following data files and stores them as data tables.
	1. feature.txt - containing labels for the raw data column names
	2. activity_labels.txt - containing ids and labels for the different activity types
	3. train/X_train.txt - containing the full training data 
	4. train/y_train.txt - containing the proper activity id for each row in X_train.txt
	5. train/subject_train.txt - containing the subject id for each row in X_train.txt
	6. test/X_test.txt - containing the full testing data 
	7. test/y_test.txt - containing the proper activity id for each row in X_test.txt
	8. test/subject_test.txt - containing the subject id for each row in X_test.txt
4. Merges the training and testing data into an overall data set.
5. Subsets the overall dataset, selecting only columns pertaining to mean and std data
6. Prepends two columns to the subsetted data:
	1. Activity name (derived from joining the entries from y_*.txt and the labels from activity_labels.txt)
	2. Subject ID (from subject_*.txt)
7. Changes some of the column names to make them easier to read (removes extra parentheses, puts the function name at the end))
8. Creates a summary data set ordered by two factors (activity_name & subject_id), then applies the mean function on the remaining variables
9. Sets the summary data to be ordered by activity name, then subject id
10. Writes out tidy summary data set ("UCI_HAR_summary.txt") as per course instructions.

Output file:
===========
The output of run_analysis.R will generate a tidy summary data set called "UCI_HAR_summary.txt". Properties of the data set include:
* Format: White space deliminated text file. 
* Header: First row, contains 68 quoted values (Variables, see below)
* Each row contains the mean value of the 66 remaining variables for the activity and subject listed in the first two columns. There are 6 activity types, and 30 subjects, for a total of 180 rows.

Descriptions of Columns (Variables)
=========

The first two columns are the activity names and subject ids.
The units for columns 3-68 are the same as the initial data set; unfortunately the original data set did not state the actual unit.
The syntax for columns 3-68 are as follows:
- Columns are prefixed with (t or f) for (time or frequency) domain data
- Please see features_info.txt within the dataset directory for a full description of the column types
- X,Y,Z, refer to the three orthogonal axes of the accelerometer / gyroscope
- Suffixes of mean or std refer to mean or standard deviation data, respectively


1. activity_name - The type of activity performed (e.g. "LAYING","SITTING", etc...)
2. subject_id - The id number of the subject performing the activity
3. tBodyAcc_X_mean
4. tBodyAcc_Y_mean
5. tBodyAcc_Z_mean
6. tBodyAcc_X_std
7. tBodyAcc_Y_std
8. tBodyAcc_Z_std
9. tGravityAcc_X_mean
10. tGravityAcc_Y_mean
11. tGravityAcc_Z_mean
12. tGravityAcc_X_std
13. tGravityAcc_Y_std
14. tGravityAcc_Z_std
15. tBodyAccJerk_X_mean
16. tBodyAccJerk_Y_mean
17. tBodyAccJerk_Z_mean
18. tBodyAccJerk_X_std
19. tBodyAccJerk_Y_std
20. tBodyAccJerk_Z_std
21. tBodyGyro_X_mean
22. tBodyGyro_Y_mean
23. tBodyGyro_Z_mean
24. tBodyGyro_X_std
25. tBodyGyro_Y_std
26. tBodyGyro_Z_std
27. tBodyGyroJerk_X_mean
28. tBodyGyroJerk_Y_mean
29. tBodyGyroJerk_Z_mean
30. tBodyGyroJerk_X_std
31. tBodyGyroJerk_Y_std
32. tBodyGyroJerk_Z_std
33. tBodyAccMag_mean
34. tBodyAccMag_std
35. tGravityAccMag_mean
36. tGravityAccMag_std
37. tBodyAccJerkMag_mean
38. tBodyAccJerkMag_std
39. tBodyGyroMag_mean
40. tBodyGyroMag_std
41. tBodyGyroJerkMag_mean
42. tBodyGyroJerkMag_std
43. fBodyAcc_X_mean
44. fBodyAcc_Y_mean
45. fBodyAcc_Z_mean
46. fBodyAcc_X_std
47. fBodyAcc_Y_std
48. fBodyAcc_Z_std
49. fBodyAccJerk_X_mean
50. fBodyAccJerk_Y_mean
51. fBodyAccJerk_Z_mean
52. fBodyAccJerk_X_std
53. fBodyAccJerk_Y_std
54. fBodyAccJerk_Z_std
55. fBodyGyro_X_mean
56. fBodyGyro_Y_mean
57. fBodyGyro_Z_mean
58. fBodyGyro_X_std
59. fBodyGyro_Y_std
60. fBodyGyro_Z_std
61. fBodyAccMag_mean
62. fBodyAccMag_std
63. fBodyBodyAccJerkMag_mean
64. fBodyBodyAccJerkMag_std
65. fBodyBodyGyroMag_mean
66. fBodyBodyGyroMag_std
67. fBodyBodyGyroJerkMag_mean
68. fBodyBodyGyroJerkMag_std
