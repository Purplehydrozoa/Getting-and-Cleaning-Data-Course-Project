
# Summary
# This code cleans and prepares data collected from the accelerometers from the Samsung Galaxy S smartphone.The    output of this code can be seen as "tidydata.txt"
# Please refer to README.md for details
# For descriptions of the data and variables see CodeBook.md

library(dplyr)

#__Get Data__####

# Define source of download
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#Define name of data set zip file
zipFile <- "UCI HAR Dataset.zip"

# Download zip file if it has yet to be downloaded
if (!file.exists(zipFile)) {
        download.file(URL, zipFile, mode = "wb")
}

# Define dataset folder name and check for the presence of an unzipped folder of that name. If it is not present unzip "zipFile". 
dataSet <- "UCI HAR Dataset"
if (!file.exists(dataSet)) {
        unzip(zipFile)
}

#___Reading in the Data____####

# reading in the test data files
test_subjects <- read.table(file.path(dataSet, "test", "subject_test.txt"))
test_values <- read.table(file.path(dataSet, "test", "X_test.txt"))
test_activity <- read.table(file.path(dataSet, "test", "y_test.txt"))

# reading in the training data files
training_subjects <- read.table(file.path(dataSet, "train", "subject_train.txt"))
training_values <- read.table(file.path(dataSet, "train", "X_train.txt"))
training_activity <- read.table(file.path(dataSet, "train", "y_train.txt"))



# reading in the feature variables (ensure not to convert text labels to factors)
features <- read.table(file.path(dataSet, "features.txt"), as.is = TRUE)


# reading in the activity labels
activities <- read.table(file.path(dataSet, "activity_labels.txt"))
#rename columns 
colnames(activities) <- c("activity_ID", "activity_label")



# Task 1 - Merging the training and the test data sets to create one data set ####

# bind data tables to create one data table
volntr_activity <- rbind(
        cbind(training_subjects, training_values, training_activity),
        cbind(test_subjects, test_values, test_activity)
)

# save RAM by removing orginal data tables
rm(training_subjects, training_values, training_activity, 
   test_subjects, test_values, test_activity)

# assign column names to the volntr_activity DF
colnames(volntr_activity) <- c("subject", features[, 2], "activity")


# Task 2 - Extracting only the measurements on the mean and standard deviation for each measurement ####

# determine which columns of the data set meet the task 2 criteria
correct_col <- grepl("subject|activity|mean|std", colnames(volntr_activity))

# Subset only these columns 
volntr_activity <- volntr_activity[, correct_col]



# Task 3 - Create more descriptive activity names to name the activities in the data set ####

# replace activity values with actual name of activity
volntr_activity$activity <- factor(volntr_activity$activity, 
                                 levels = activities[, 1], labels = activities[, 2])



# Task 4 - Appropriately label the data set with descriptive variable names ####

# determine the column names
volntr_activityCols <- colnames(volntr_activity)

# remove the special characters from the column names
volntr_activityCols <- gsub("[\\(\\)-]", "", volntr_activityCols)

# Rename with full names
volntr_activityCols <- gsub("^f", "frequencyDomain", volntr_activityCols)
volntr_activityCols <- gsub("^t", "timeDomain", volntr_activityCols)
volntr_activityCols <- gsub("Acc", "Accelerometer", volntr_activityCols)
volntr_activityCols <- gsub("Gyro", "Gyroscope", volntr_activityCols)
volntr_activityCols <- gsub("Mag", "Magnitude", volntr_activityCols)
volntr_activityCols <- gsub("Freq", "Frequency", volntr_activityCols)
volntr_activityCols <- gsub("mean", "Mean", volntr_activityCols)
volntr_activityCols <- gsub("std", "StandardDeviation", volntr_activityCols)

# Remove the "...BodyBody..." and replace with "Body"
volntr_activityCols <- gsub("BodyBody", "Body", volntr_activityCols)

# rename the orginal DF columns with the new new labels
colnames(volntr_activity) <- volntr_activityCols


# Step 5 - Create a new, independent tidy set with the average of each variable for each activity and each subject ####


# group by subject and activity and summarise via the mean function
volntr_activityMeans <- volntr_activity %>% 
        group_by(subject, activity) %>%
        summarise_each(list(mean))
# Write new dataset file
write.table(volntr_activityMeans, "tidy_data.txt", row.names = F, quote = F)


