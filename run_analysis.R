###############################################################################
# Getting and Cleanning Data
# Course Project
# https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions
#
# Creates two tidy data sets:
# 1) tidy_data_1.txt - tidy data from Human Activity Recognition Using 
#    Smartphones Dataset (Version 1.0). Combines training and test sets, 
#    includes only the measurements on the mean and standard deviation for each 
#    measurement, uses descriptive activity names and labels the variables
#    with tidy names
# 2) tidy_data_2.txt - average of each variable for each activity and each 
#    subject from the tidy_data_1.txt data set
###############################################################################

# library LaF provides methods for fast access to large ASCII files, in 
# particular fixed width format files are supported without having to load 
# the whole file in memory (when only some columns are needed as is the 
# case of this prject) 
library("LaF")

# libraries to restructure, aggregate, slipt-apply-combine data frames 
library("reshape2")
library("plyr")

###############################################################################
## first read  in reference data for the features and activities in the dataset
###############################################################################

# get the 561 feature lables into a data frame as (feature_id, original_feature), 
# create new column "extract" indicating the features to extract from the raw 
# dataset ("mean()" or "std()" of other measures) and finally make tidy feature
# names (as there are duplicates and use special characters)  
fLabels <- read.table("UCI HAR Dataset/features.txt", 
                      col.names=c("feature_id", "original_feature"))

# create "extract" column with features that represent mean() and std() of
# measurements - there are 66 of these
# note that meanFreq() is not a mean (it's a weighted average) and features 
# like "angle(Z,gravityMean)" are also not means, but angles of means
fLabels$extract <- grepl("mean\\(\\)|std\\(\\)", tolower(fLabels$original_feature))

# clean up the original feature names (make unique, replace "."s with "_" 
# and remove "_" at the end)
fLabels$feature <- make.names(fLabels$original_feature, unique=TRUE)
fLabels$feature <- gsub("(\\.+)", "\\_", fLabels$feature, perl=TRUE)
fLabels$feature <- gsub("(\\_$)", "", fLabels$feature, perl=TRUE)

# get the 6 activity labels into a 6x2 data frame as (activity_id, label)
aLabels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                      col.names=c("activity_id", "activity"))

###############################################################################
## now read in the required train data set and combine
###############################################################################

# read from X_train.txt only the features of interest ("mean" and "std")
laf <- laf_open_fwf("UCI HAR Dataset/train/X_train.txt", 
                    column_width=rep(16, times=561), 
                    column_types=rep("double", 561))
x_train <- laf[, fLabels[fLabels$extract, "feature_id"]]  # only read mean/std
colnames(x_train) <- fLabels[fLabels$extract, "feature"]  # assign col names
rm(laf)

# read y_train.txt and merge to get the activity labels
y_train <-read.table("UCI HAR Dataset/train/y_train.txt", 
                     col.name=c("activity_id"))
y_train <- merge(y_train, aLabels, by="activity_id", all=TRUE)

# read subject_train.txt
subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt", 
                           col.name=c("subject"))

# now combine all data into one data frame
train_data <- cbind(subject_train, activity=y_train$activity, x_train)

###############################################################################
## now read in the required test data set and combine
###############################################################################

# read from X_test.txt only the features of interest ("mean" and "std")
laf <- laf_open_fwf("UCI HAR Dataset/test/X_test.txt", 
                    column_width=rep(16, times=561), 
                    column_types=rep("double", 561))
x_test <- laf[, fLabels[fLabels$extract, "feature_id"]]  # only read mean/std
colnames(x_test) <- fLabels[fLabels$extract, "feature"]  # assign col names
rm(laf)

# read y_test.txt and merge to get the activity labels
y_test <-read.table("UCI HAR Dataset/test/y_test.txt", 
                    col.name=c("activity_id"))
y_test <- merge(y_test, aLabels, by="activity_id", all=TRUE)

# read subject_test.txt
subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt", 
                          col.name=c("subject"))

# now combine all data into one data frame
test_data <- cbind(subject_test, activity=y_test$activity, x_test)

###############################################################################
## Make a tidy data set #1 and save to tidy_data_1.txt
###############################################################################

tidy_data_1 <- rbind(train_data, test_data)
arrange(tidy_data_1, subject, activity)

# write table (fixed the typo in the "row.names" argument in the assignment)
write.table(tidy_data_1, "tidy_data_1.txt", row.names=FALSE)

###############################################################################
## Make a tidy data set #2 with the average of each variable for each
## subject
###############################################################################

# make data frame with mean of variables
td_melt <- melt(tidy_data_1, id=c("activity", "subject"))
tidy_data_2 <- dcast(td_melt, activity + subject ~ variable, mean)

# sort it by activity and subject
arrange(tidy_data_2, activity, subject)

# make tidy variable names (add "_mean" at the end)
n <- dim(tidy_data_2)[2]
colnames(tidy_data_2)[3:n] <- paste0(colnames(tidy_data_2)[3:n], "_mean")

# write table (fixed the typo in the "row.names" argument in the assignment)
write.table(tidy_data_2, "tidy_data_2.txt", row.names=FALSE)
