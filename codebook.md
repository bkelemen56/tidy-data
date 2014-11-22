# Code Book for Tidy Data Project
Data Set Code Book: Tidy Data from Human Activity Recognition Using Smartphones Dataset

##Codebook

November 22, 2014

Codebook prepared by Bill Kelemen, based on data set obtained from the "Human Activity Recognition Using Smartphones Dataset - Version 1.0" [1]

The raw data contains the experiment records carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

Two tidy data sets are obtained from the raw data, that extract only the measurements that compute the mean and standard deviation for each measurement,  and a second tidy data set that contains the average of each variable for each activity and each subject from the first tidy data set.

The second tidy data set if the final result of this tidy data project.

## Raw data

The raw data of these experiments was downloaded from this URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The `get_raw_data.R` script will download and unzip the raw data into the "UCI HAR Dataset" folder under the current directory. For more information on the raw data, refer to the README.txt file in the raw data folder. 

The following files comprise the raw data:

Folder | Filename | No Observations | No Fields | Format | Description
------ | -------- | --------------- | --------- | ------ | -----------
/ | README.txt |  |  | text | "Description of the dataset: Human Activity Recognition Using Smartphones Dataset
Version 1.0"
/ | features_info.txt |  |  | text | Description of the features and variables calculated
/ | features.txt |  |  | Space separated, field#1 = feature ID; field#2 = feature name | Index of all 561 features in datasets
/ | activity_labels.txt |  |  | Space separated, field#1 = activity ID; field#2 = activity name | Index of all 6 activities
train | X_train.txt | 7352 | 561 | Fixed length, 16 chars x feature, 561 features = 8976 chars x record | See "features.txt" for description of each 561 feature
train | y_train.txt | 7352 | 1 | Fixed width, 1 char x field = 1 char x record | See "activity_labels.txt" for description of each activity id
train | subject_train.txt | 7352 | 1 | Fixed width, 2 char x field = 2 char x record | subject id <- c(1:30)
train/Inertial Signals | body_gyro_z_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | body_gyro_y_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | body_gyro_x_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | total_acc_z_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | total_acc_y_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | total_acc_x_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | body_acc_z_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | body_acc_y_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
train/Inertial Signals | body_acc_x_train.txt | 7352 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test | X_test.txt | 2947 | 561 | Fixed length, 16 chars x feature, 561 features = 8976 chars x record | See "features.txt" for description of each 561 feature
test | y_test.txt | 2947 | 1 | Fixed width, 1 char x field = 1 char x record | See "activity_labels.txt" for description of each activity id
test | subject_test.txt | 2947 | 1 | Fixed width, 2 char x field = 2 char x record | subject id <- c(1:30)
test/Inertial Signals | body_gyro_z_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | body_gyro_y_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | body_gyro_x_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | total_acc_z_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | total_acc_y_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | total_acc_x_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | body_acc_z_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | body_acc_y_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used
test/Inertial Signals | body_acc_x_test.txt | 2947 | 128 | Fixed length, 16 chars x feature, 128 features = 2049 chars x record | Not used


## Producing the tidy data files

The `run_analysis.R` script will read the raw data downloaded by the `get_raw_data.R` script and write the two tidy data set files to the current directory. tidy_data_2.txt is the final result of this project.

**tidy_data_1.txt** - Combines training and test sets, includes only the measurements from the raw data that compute the mean and standard deviation for each measurement, uses descriptive activity names instead of IDs and labels the variables (columns) with tidy names

Field label | Variable | Variable type | Allowable variables
----------- | -------- | ------------- | -------------------
activity | Activity type while wearing a smartphone (Samsung Galaxy S II) on the waist | String | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
subject | Subject (volunteer) number | Numeric (integer) | 1-30
tBodyAcc_mean_X_mean | mean(Body Acceleration Signal in the X direction) | Numeric (float) | 
tBodyAcc_mean_Y_mean | mean(Body Acceleration Signal in the Y direction) | Numeric (float) | 
tBodyAcc_mean_Z_mean | mean(Body Acceleration Signal in the Z direction) | Numeric (float) | 
tBodyAcc_std_X_mean | standard deviation(Body Acceleration Signal in the X direction) | Numeric (float) | 
tBodyAcc_std_Y_mean | standard deviation(Body Acceleration Signal in the Y direction) | Numeric (float) | 
tBodyAcc_std_Z_mean | standard deviation(Body Acceleration Signal in the Z direction) | Numeric (float) | 
tGravityAcc_mean_X_mean | mean(Gravitational Acceleration Signal in the X direction) | Numeric (float) | 
tGravityAcc_mean_Y_mean | mean(Gravitational Acceleration Signal in the Y direction) | Numeric (float) | 
tGravityAcc_mean_Z_mean | mean(Gravitational Acceleration Signal in the Z direction) | Numeric (float) | 
tGravityAcc_std_X_mean | standard deviation(Gravitational Acceleration Signal in the X direction) | Numeric (float) | 
tGravityAcc_std_Y_mean | standard deviation(Gravitational Acceleration Signal in the Y direction) | Numeric (float) | 
tGravityAcc_std_Z_mean | standard deviation(Gravitational Acceleration Signal in the Z direction) | Numeric (float) | 
tBodyAccJerk_mean_X_mean | mean(Body Acceleration Jerk Signal in the X direction) | Numeric (float) | 
tBodyAccJerk_mean_Y_mean | mean(Body Acceleration Jerk Signal in the Y direction) | Numeric (float) | 
tBodyAccJerk_mean_Z_mean | mean(Body Acceleration Jerk Signal in the Z direction) | Numeric (float) | 
tBodyAccJerk_std_X_mean | standard deviation(Body Acceleration Jerk Signal in the X direction) | Numeric (float) | 
tBodyAccJerk_std_Y_mean | standard deviation(Body Acceleration Jerk Signal in the Y direction) | Numeric (float) | 
tBodyAccJerk_std_Z_mean | standard deviation(Body Acceleration Jerk Signal in the Z direction) | Numeric (float) | 
tBodyGyro_mean_X_mean | mean(Body Gyroscope Signal in the X direction) | Numeric (float) | 
tBodyGyro_mean_Y_mean | mean(Body Gyroscope Signal in the Y direction) | Numeric (float) | 
tBodyGyro_mean_Z_mean | mean(Body Gyroscope Signal in the Z direction) | Numeric (float) | 
tBodyGyro_std_X_mean | standard deviation(Body Gyroscope Signal in the X direction) | Numeric (float) | 
tBodyGyro_std_Y_mean | standard deviation(Body Gyroscope Signal in the Y direction) | Numeric (float) | 
tBodyGyro_std_Z_mean | standard deviation(Body Gyroscope Signal in the Z direction) | Numeric (float) | 
tBodyGyroJerk_mean_X_mean | mean(Body Gyroscope Jerk Signal in the X direction) | Numeric (float) | 
tBodyGyroJerk_mean_Y_mean | mean(Body Gyroscope Jerk Signal in the Y direction) | Numeric (float) | 
tBodyGyroJerk_mean_Z_mean | mean(Body Gyroscope Jerk Signal in the Z direction) | Numeric (float) | 
tBodyGyroJerk_std_X_mean | standard deviation(Body Gyroscope Jerk Signal in the X direction) | Numeric (float) | 
tBodyGyroJerk_std_Y_mean | standard deviation(Body Gyroscope Jerk Signal in the Y direction) | Numeric (float) | 
tBodyGyroJerk_std_Z_mean | standard deviation(Body Gyroscope Jerk Signal in the Z direction) | Numeric (float) | 
tBodyAccMag_mean_mean | mean(Body Acceleration Signal Euclidean Norm) | Numeric (float) | 
tBodyAccMag_std_mean | standard deviation(Body Acceleration Signal Euclidean Norm) | Numeric (float) | 
tGravityAccMag_mean_mean | mean(Gravitational Acceleration Signal Euclidean Norm) | Numeric (float) | 
tGravityAccMag_std_mean | standard deviation(Gravitational Acceleration Signal Euclidean Norm) | Numeric (float) | 
tBodyAccJerkMag_mean_mean | mean(Body Acceleration Jerk Signal Euclidean Norm) | Numeric (float) | 
tBodyAccJerkMag_std_mean | standard deviation(Body Acceleration Jerk Signal Euclidean Norm) | Numeric (float) | 
tBodyGyroMag_mean_mean | mean(Body Gyroscope Signal Euclidean Norm) | Numeric (float) | 
tBodyGyroMag_std_mean | standard deviation(Body Gyroscope Signal Euclidean Norm) | Numeric (float) | 
tBodyGyroJerkMag_mean_mean | mean(Body Gyroscope Jerk Signal Euclidean Norm) | Numeric (float) | 
tBodyGyroJerkMag_std_mean | standard deviation(Body Gyroscope Jerk Signal Euclidean Norm) | Numeric (float) | 
fBodyAcc_mean_X_mean | mean(FFT Body Acceleration Signal in the X direction) | Numeric (float) | 
fBodyAcc_mean_Y_mean | mean(FFT Body Acceleration Signal in the Y direction) | Numeric (float) | 
fBodyAcc_mean_Z_mean | mean(FFT Body Acceleration Signal in the Z direction) | Numeric (float) | 
fBodyAcc_std_X_mean | standard deviation(FFT Body Acceleration Signal in the X direction) | Numeric (float) | 
fBodyAcc_std_Y_mean | standard deviation(FFT Body Acceleration Signal in the Y direction) | Numeric (float) | 
fBodyAcc_std_Z_mean | standard deviation(FFT Body Acceleration Signal in the Z direction) | Numeric (float) | 
fBodyAccJerk_mean_X_mean | mean(FFT Body Acceleration Jerk Signal in the X direction) | Numeric (float) | 
fBodyAccJerk_mean_Y_mean | mean(FFT Body Acceleration Jerk Signal in the Y direction) | Numeric (float) | 
fBodyAccJerk_mean_Z_mean | mean(FFT Body Acceleration Jerk Signal in the Z direction) | Numeric (float) | 
fBodyAccJerk_std_X_mean | standard deviation(FFT Body Acceleration Jerk Signal in the X direction) | Numeric (float) | 
fBodyAccJerk_std_Y_mean | standard deviation(FFT Body Acceleration Jerk Signal in the Y direction) | Numeric (float) | 
fBodyAccJerk_std_Z_mean | standard deviation(FFT Body Acceleration Jerk Signal in the Z direction) | Numeric (float) | 
fBodyGyro_mean_X_mean | mean(FFT Body Gyroscope Signal in the X direction) | Numeric (float) | 
fBodyGyro_mean_Y_mean | mean(FFT Body Gyroscope Signal in the Y direction) | Numeric (float) | 
fBodyGyro_mean_Z_mean | mean(FFT Body Gyroscope Signal in the Z direction) | Numeric (float) | 
fBodyGyro_std_X_mean | standard deviation(FFT Body Gyroscope Signal in the X direction) | Numeric (float) | 
fBodyGyro_std_Y_mean | standard deviation(FFT Body Gyroscope Signal in the Y direction) | Numeric (float) | 
fBodyGyro_std_Z_mean | standard deviation(FFT Body Gyroscope Signal in the Z direction) | Numeric (float) | 
fBodyAccMag_mean_mean | mean(FFT Body Acceleration Signal Euclidean Norm) | Numeric (float) | 
fBodyAccMag_std_mean | standard deviation(FFT Body Acceleration Signal Euclidean Norm) | Numeric (float) | 
fBodyBodyAccJerkMag_mean_mean | mean(FFT Body Acceleration Jerk Signal Euclidean Norm) | Numeric (float) | 
fBodyBodyAccJerkMag_std_mean | standard deviation(FFT Body Acceleration Jerk Signal Euclidean Norm) | Numeric (float) | 
fBodyBodyGyroMag_mean_mean | mean(FFT Body Gyroscope Signal Euclidean Norm) | Numeric (float) | 
fBodyBodyGyroMag_std_mean | standard deviation(FFT Body Gyroscope Signal Euclidean Norm) | Numeric (float) | 
fBodyBodyGyroJerkMag_mean_mean | mean(FFT Body Gyroscope Jerk Signal Euclidean Norm) | Numeric (float) | 
fBodyBodyGyroJerkMag_std_mean | standard deviation(FFT Body Gyroscope Jerk Signal Euclidean Norm) | Numeric (float) | 


**tidy_data_2.txt** - Contains average of each variable for each activity and each subject from the tidy_data_1.txt data set

Field label | Variable | Variable type | Allowable variables
----------- | -------- | ------------- | -------------------
activity | Activity type while wearing a smartphone (Samsung Galaxy S II) on the waist | String | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
subject | Subject (volunteer) number | Numeric (integer) | 1-30
tBodyAcc_mean_X_mean | mean(mean(Body Acceleration Signal in the X direction)) | Numeric (float) | 
tBodyAcc_mean_Y_mean | mean(mean(Body Acceleration Signal in the Y direction)) | Numeric (float) | 
tBodyAcc_mean_Z_mean | mean(mean(Body Acceleration Signal in the Z direction)) | Numeric (float) | 
tBodyAcc_std_X_mean | mean(standard deviation(Body Acceleration Signal in the X direction)) | Numeric (float) | 
tBodyAcc_std_Y_mean | mean(standard deviation(Body Acceleration Signal in the Y direction)) | Numeric (float) | 
tBodyAcc_std_Z_mean | mean(standard deviation(Body Acceleration Signal in the Z direction)) | Numeric (float) | 
tGravityAcc_mean_X_mean | mean(mean(Gravitational Acceleration Signal in the X direction)) | Numeric (float) | 
tGravityAcc_mean_Y_mean | mean(mean(Gravitational Acceleration Signal in the Y direction)) | Numeric (float) | 
tGravityAcc_mean_Z_mean | mean(mean(Gravitational Acceleration Signal in the Z direction)) | Numeric (float) | 
tGravityAcc_std_X_mean | mean(standard deviation(Gravitational Acceleration Signal in the X direction)) | Numeric (float) | 
tGravityAcc_std_Y_mean | mean(standard deviation(Gravitational Acceleration Signal in the Y direction)) | Numeric (float) | 
tGravityAcc_std_Z_mean | mean(standard deviation(Gravitational Acceleration Signal in the Z direction)) | Numeric (float) | 
tBodyAccJerk_mean_X_mean | mean(mean(Body Acceleration Jerk Signal in the X direction)) | Numeric (float) | 
tBodyAccJerk_mean_Y_mean | mean(mean(Body Acceleration Jerk Signal in the Y direction)) | Numeric (float) | 
tBodyAccJerk_mean_Z_mean | mean(mean(Body Acceleration Jerk Signal in the Z direction)) | Numeric (float) | 
tBodyAccJerk_std_X_mean | mean(standard deviation(Body Acceleration Jerk Signal in the X direction)) | Numeric (float) | 
tBodyAccJerk_std_Y_mean | mean(standard deviation(Body Acceleration Jerk Signal in the Y direction)) | Numeric (float) | 
tBodyAccJerk_std_Z_mean | mean(standard deviation(Body Acceleration Jerk Signal in the Z direction)) | Numeric (float) | 
tBodyGyro_mean_X_mean | mean(mean(Body Gyroscope Signal in the X direction)) | Numeric (float) | 
tBodyGyro_mean_Y_mean | mean(mean(Body Gyroscope Signal in the Y direction)) | Numeric (float) | 
tBodyGyro_mean_Z_mean | mean(mean(Body Gyroscope Signal in the Z direction)) | Numeric (float) | 
tBodyGyro_std_X_mean | mean(standard deviation(Body Gyroscope Signal in the X direction)) | Numeric (float) | 
tBodyGyro_std_Y_mean | mean(standard deviation(Body Gyroscope Signal in the Y direction)) | Numeric (float) | 
tBodyGyro_std_Z_mean | mean(standard deviation(Body Gyroscope Signal in the Z direction)) | Numeric (float) | 
tBodyGyroJerk_mean_X_mean | mean(mean(Body Gyroscope Jerk Signal in the X direction)) | Numeric (float) | 
tBodyGyroJerk_mean_Y_mean | mean(mean(Body Gyroscope Jerk Signal in the Y direction)) | Numeric (float) | 
tBodyGyroJerk_mean_Z_mean | mean(mean(Body Gyroscope Jerk Signal in the Z direction)) | Numeric (float) | 
tBodyGyroJerk_std_X_mean | mean(standard deviation(Body Gyroscope Jerk Signal in the X direction)) | Numeric (float) | 
tBodyGyroJerk_std_Y_mean | mean(standard deviation(Body Gyroscope Jerk Signal in the Y direction)) | Numeric (float) | 
tBodyGyroJerk_std_Z_mean | mean(standard deviation(Body Gyroscope Jerk Signal in the Z direction)) | Numeric (float) | 
tBodyAccMag_mean_mean | mean(mean(Body Acceleration Signal Euclidean Norm)) | Numeric (float) | 
tBodyAccMag_std_mean | mean(standard deviation(Body Acceleration Signal Euclidean Norm)) | Numeric (float) | 
tGravityAccMag_mean_mean | mean(mean(Gravitational Acceleration Signal Euclidean Norm)) | Numeric (float) | 
tGravityAccMag_std_mean | mean(standard deviation(Gravitational Acceleration Signal Euclidean Norm)) | Numeric (float) | 
tBodyAccJerkMag_mean_mean | mean(mean(Body Acceleration Jerk Signal Euclidean Norm)) | Numeric (float) | 
tBodyAccJerkMag_std_mean | mean(standard deviation(Body Acceleration Jerk Signal Euclidean Norm)) | Numeric (float) | 
tBodyGyroMag_mean_mean | mean(mean(Body Gyroscope Signal Euclidean Norm)) | Numeric (float) | 
tBodyGyroMag_std_mean | mean(standard deviation(Body Gyroscope Signal Euclidean Norm)) | Numeric (float) | 
tBodyGyroJerkMag_mean_mean | mean(mean(Body Gyroscope Jerk Signal Euclidean Norm)) | Numeric (float) | 
tBodyGyroJerkMag_std_mean | mean(standard deviation(Body Gyroscope Jerk Signal Euclidean Norm)) | Numeric (float) | 
fBodyAcc_mean_X_mean | mean(mean(FFT Body Acceleration Signal in the X direction)) | Numeric (float) | 
fBodyAcc_mean_Y_mean | mean(mean(FFT Body Acceleration Signal in the Y direction)) | Numeric (float) | 
fBodyAcc_mean_Z_mean | mean(mean(FFT Body Acceleration Signal in the Z direction)) | Numeric (float) | 
fBodyAcc_std_X_mean | mean(standard deviation(FFT Body Acceleration Signal in the X direction)) | Numeric (float) | 
fBodyAcc_std_Y_mean | mean(standard deviation(FFT Body Acceleration Signal in the Y direction)) | Numeric (float) | 
fBodyAcc_std_Z_mean | mean(standard deviation(FFT Body Acceleration Signal in the Z direction)) | Numeric (float) | 
fBodyAccJerk_mean_X_mean | mean(mean(FFT Body Acceleration Jerk Signal in the X direction)) | Numeric (float) | 
fBodyAccJerk_mean_Y_mean | mean(mean(FFT Body Acceleration Jerk Signal in the Y direction)) | Numeric (float) | 
fBodyAccJerk_mean_Z_mean | mean(mean(FFT Body Acceleration Jerk Signal in the Z direction)) | Numeric (float) | 
fBodyAccJerk_std_X_mean | mean(standard deviation(FFT Body Acceleration Jerk Signal in the X direction)) | Numeric (float) | 
fBodyAccJerk_std_Y_mean | mean(standard deviation(FFT Body Acceleration Jerk Signal in the Y direction)) | Numeric (float) | 
fBodyAccJerk_std_Z_mean | mean(standard deviation(FFT Body Acceleration Jerk Signal in the Z direction)) | Numeric (float) | 
fBodyGyro_mean_X_mean | mean(mean(FFT Body Gyroscope Signal in the X direction)) | Numeric (float) | 
fBodyGyro_mean_Y_mean | mean(mean(FFT Body Gyroscope Signal in the Y direction)) | Numeric (float) | 
fBodyGyro_mean_Z_mean | mean(mean(FFT Body Gyroscope Signal in the Z direction)) | Numeric (float) | 
fBodyGyro_std_X_mean | mean(standard deviation(FFT Body Gyroscope Signal in the X direction)) | Numeric (float) | 
fBodyGyro_std_Y_mean | mean(standard deviation(FFT Body Gyroscope Signal in the Y direction)) | Numeric (float) | 
fBodyGyro_std_Z_mean | mean(standard deviation(FFT Body Gyroscope Signal in the Z direction)) | Numeric (float) | 
fBodyAccMag_mean_mean | mean(mean(FFT Body Acceleration Signal Euclidean Norm)) | Numeric (float) | 
fBodyAccMag_std_mean | mean(standard deviation(FFT Body Acceleration Signal Euclidean Norm)) | Numeric (float) | 
fBodyBodyAccJerkMag_mean_mean | mean(mean(FFT Body Acceleration Jerk Signal Euclidean Norm)) | Numeric (float) | 
fBodyBodyAccJerkMag_std_mean | mean(standard deviation(FFT Body Acceleration Jerk Signal Euclidean Norm)) | Numeric (float) | 
fBodyBodyGyroMag_mean_mean | mean(mean(FFT Body Gyroscope Signal Euclidean Norm)) | Numeric (float) | 
fBodyBodyGyroMag_std_mean | mean(standard deviation(FFT Body Gyroscope Signal Euclidean Norm)) | Numeric (float) | 
fBodyBodyGyroJerkMag_mean_mean | mean(mean(FFT Body Gyroscope Jerk Signal Euclidean Norm)) | Numeric (float) | 
fBodyBodyGyroJerkMag_std_mean | mean(standard deviation(FFT Body Gyroscope Jerk Signal Euclidean Norm)) | Numeric (float) | 

## Reading the tidy data files

The `read_tidy_data.R` script will read the two tidy data sets into memory.


## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.