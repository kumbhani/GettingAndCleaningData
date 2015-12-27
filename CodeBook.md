# CodeBook for run_analysis.R

Original Data:
==========


Output file:
===========
The output of run_analysis.R will generate a tidy summary data set called "UCI_HAR_summary.txt". Properties of the data set include:
* Format: White space deliminated text file. 
* Header: First row, contains 68 quoted values (Variables, see below)
* Each row contains the mean value of the 66 remaining variables for the activity and subject listed in the first two columns. There are 6 activity types, and 30 subjects, for a total of 180 rows.

Descriptions of Columns (Variables)
=========

1. activity_name - The type of activity performed (e.g. "LAYING","SITTING", etc...)
2. subject_id - The id number of the subject performing the activity

The units for the following columns are the same as the initial data set; unfortunately the original data set did not state the actual unit.
The syntax for the columns are as follows:
* Columns are prefixed with (t or f) for (time or frequency) domain data
* Please see features_info.txt within the dataset directory for a full description of the column types
* X,Y,Z, refer to the three orthogonal axes of the accelerometer / gyroscope.
* Suffixes of mean or std refer to mean or standard deviation data, respectively.

For each activity_name and each subject_id, the mean value for each of these columns was computed.

The column names are:

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
