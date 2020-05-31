# **Getting and Cleaning Data Course Project**

### Summary
***
This project involved the cleaning of data from the accelerometers of the Samsung Galaxy S smartphone. 

The data was prepared to create a new independent tidy data set with the average of each variable for each activity and each subject. 

This repo contains the following files:

* `run_analysis.R` = The R script used to create the new data set.

* `CodeBook.md`= Description of the variables in the data set and data transformations performed. 

* `ReadMe.md`= The file you are reading, lays out how the new data set can be created. 

* `tidy_data.txt` = The end product of the data cleaning.

### Source Data
***
The source data set was downloaded from:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The authors of the data describe how this data set was created:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."
 
 
### Creating a new cleaned data set
***
The `run_analysis.R` script allows the user to create a new cleaned data set from the source data. The new data set contains the average of each variable for each activity and each subject from the source data.
This R scrip requires the use of the `dplyr`package.

The following steps provide an overview of the steps completed in the code : 

* Downloading and unzipping the source data

* Reading the appropriate data tables into R

* Merging the training and the test sets to create one data set

* Extracting **only** the mean and standard deviation for each of the study measurements

* Creates more descriptive names for the activity variable

* Cleans variable names by removing confusing special characters and typos

* Forms a new, independent tidy data set with the average of each variable for each activity and each subject

* Writes the new data set to a new .txt file = `tidy_data.txt`

More detailed explanation of the code can be found in the `CodeBook.md`

This project was complete using R version 3.6.3 (2020-02-29).

