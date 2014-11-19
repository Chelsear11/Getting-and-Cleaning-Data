# Code book for tidy data set for Coursera Getting and Cleaning Data course project

The data for this project were obtained from accelerometers from the Samsung Galary S smartphone. 
More information about the study can be found http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The data set can be obtained here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This markdown file modifies features_info.txt obtained from above dataset

## Data Dictionary - tidydata.txt

subject - assigned values of 1-30, each participant in the study has a unique number

activity - activity that the subject was performing when data were obtained
  * laying
  * sitting
  * standing
  * walking
  * walking_downstairs
  * walking_upstairs

measurementDescription - measurement taken from subject during the activity (see below for full explanation of measurement Descriptions)

meanValue - average value for each subject, activity, and measurementDescription

### Measurement Descriptions
========================

The measurements selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 'time') were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing:
  * FourierBodyAcc-XYZ
  * FourierBodyAccJerk-XYZ
  * FourierBodyGyro-XYZ
  * FourierBodyAccJerkMag
  * FourierBodyGyroMag
  * FourierBodyGyroJerkMag 

These signals were used to estimate the mean and standard deviation of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions, and Mean or Std was added to the name to 
indicate whether it is a mean or standard deviation

* timeBodyAcc-XYZ
* timeGravityAcc-XYZ
* timeBodyAccJerk-XYZ
* timeBodyGyro-XYZ
* timeBodyGyroJerk-XYZ
* timeBodyAccMag
* timeGravityAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag
* FourierBodyAcc-XYZ
* FourierBodyAccJerk-XYZ
* FourierBodyGyro-XYZ
* FourierBodyAccMag
* FourierBodyAccJerkMag
* FourierBodyGyroMag
* FourierBodyGyroJerkMag