###############################################################################
# Getting and Cleanning Data
# Course Project
# https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions
#
# Download the raw data for this project. The data will be stored in the 
# "UCI HAR Dataset" folder under the current directory
###############################################################################

library("utils")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              "UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")
file.remove("UCI_HAR_Dataset.zip")