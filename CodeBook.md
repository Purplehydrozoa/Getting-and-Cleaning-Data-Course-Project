
# **Code Book**


### Variables 
***
#### Categorical variables
***
`subject` = The number of a particular volunteer in the study. 

* Integers ranging from 1 to 30. 

`activity` = The activity performed by the subject. 

* Six self explanatory activities were recorded:`WALKING`; `WALKING_UPSTAIRS`; `WALKING_DOWNSTAIRS`; `SITTING`; `STANDING`; `LAYING`

***
#### Continous variables (Features)
***
According to the metadata of the source data: 
Features are normalized and bounded within [-1,1]

Variables ending in `...X` `...Y` `...Z` are used to denote 3-axial signals in the X, Y and Z directions.

***
##### Units
***
Values from the `Accelerometer`variables were recorded in standard gravity units 'g'. 

Values from the `Gyroscope` variables were recorded in radians per second.

Values from the `Magnitude` variables were calculates using the Euclidean norm. 

***
##### Domains 
***
Values from the `timeDomain` variables refer to accelerometer and gyroscope 3-axial raw signals. 

Values from the `frequencyDomain` variables refer to a Fast Fourier Transform of time-domain signals.


***
### Transformations
***
With the `run_analysis.R` scrip the following transformations are run:

1. Merging the training and the test data sets to create one data set (Lines 52 - 67)

2. Extracting only the measurements of the mean and standard deviation for each continous variable (Lines 68 - 77)

3. Descriptive activity names added to the names of the activities in the data set (Lines 78 - 85)

4. Confusing special operators removed from continous variable names and abreviations were expanded (Lines 86 - 110)
 * `f` ---> `frequencyDomain`
 * `t` ---> `timeDomain`
 * `Acc` ---> `Accelerometer`
 * `Gyro` ---> `Gyroscope`
 * `Mag` ---> `Magnitude,`
 * `Freq` ---> `Frequency`
 * `mean` ---> `Mean`
 * `std` ---> `StandardDeviation`
 
 5. Creation of the final data set by calculating the average of each variable for each activity and each subject (Lines 111- 117)
 
 6. Writing the data set to tidy_data.txt (Lines 118 - 119)
 
 
 
