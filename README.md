# Getting and Cleaning Data - Tidy Data Project
https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions

November 22, 2014
Prepared by Bill Kelemen

##Summary

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

### Raw data

The [raw data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the "Human Activity Recognition Using Smartphones Dataset - Version 1.0" [1] contains the experiment records carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

### R scripts

Script | Description
-------| -----------
get_raw_data.R | Download the raw data
run_analysis.R | Create the two tidy data sets
read_tidy_data.R | Read the two tidy data sets

### Tidy data produced

Tidy data set file | Description
------------------ | -----------
tidy_data_1.txt | Contains the measurements that compute the mean and standard deviation for each measurement
tidy_data_2.txt | Contains the average of each variable for each activity and each subject from the first tidy data set. This is the final result of this tidy data project.

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
