###############################################################################
# Getting and Cleanning Data
# Course Project
# https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions
#
# Reads the two tidy data sets craeted by run_analysis.R
# 1) tidy_data_1.txt - tidy data from Human Activity Recognition Using 
#    Smartphones Dataset (Version 1.0). Combines training and test sets, 
#    includes only the measurements on the mean and standard deviation for each 
#    measurement, uses descriptive activity names and labels the variables
#    with tidy names
# 2) tidy_data_2.txt - average of each variable for each activity and each 
#    subject from the tidy_data_1.txt data set
###############################################################################

tidy_data_1 <- read.table("tidy_data_1.txt", header=TRUE)
tidy_data_2 <- read.table("tidy_data_2.txt", header=TRUE)