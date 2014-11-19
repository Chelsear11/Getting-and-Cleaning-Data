## Coursera Getting and Cleaning Data Course Project 
### run_analysis.r ReadMe
The dataset used for this project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and more information on the study can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The files used for this analysis are:
* subject_test.txt and subject_train.txt - vector of the subjects used for each of the observations in X_test and X_train
* X_test.txt and X_train.txt - table of the values (rows) for all the observations (columns) 
* Y_test.txt and Y_train.txt - vector of the activity identification (1-6)
* activity_labels.txt - table that defines the activity id in Y_train and Y_test
* features.txt - table that defines the column names (observation type) in X_test and X_train
 
The output from this script is a tidy dataset.
  
This data is a tidy data set because it follows the principles of tidy data:
1. Each measured variable is in one column (subject id, activity, variable, meanValue)
2. Each different observation of that variable is in a different row (ie each row has a unique combination of the columns)
3. There is only one table because there is only 1 "kind" of variable (ie motion measurements for the subjects)
4. Each row at the top of the table has variable names
5. Variable names are easy to understand
 
This tidy data set provides the average of the average and standard deviation measurements by subject and activity using the following steps:

1. Renamed the columns of x.train and x.test using features
2. Combined the test and training datasets with the activity_labels
3. Combined the test and training datasets into one dataset
4. Select only columns (measurementDescription) that are the mean (excluding meanFreq) or standard deviation
5. Cleaned up the names of these columns by removing _ and () and replacing t with time and f with Fourier
6. Added the activity labels (i.e. walking, etc) into the dataframe, and removed the id number for this variable
7. Melted the data into tidy data (see tidy data description above)
8. Averaged the observations by subject id and activity