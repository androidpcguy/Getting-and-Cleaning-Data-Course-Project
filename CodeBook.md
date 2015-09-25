#CodeBook for Course Project

##Experimental procedure and preliminary data analysis
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The original dataset (obtained before the creation of this current dataset) was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBody AccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
`-XYZ` is used to denote 3-axial signals in the X, Y and Z directions.

##Signals

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

**NOTE:** In the output data, the signals with `-XYZ` components will be separated into 3 variables for the 3 spatial directions. *Ex: `tBodyAcc-mean()-X`, `tBodyAcc-mean()-Y`, `tBodyAcc-mean()-Z`*. 

##Format of variables in output data
As seen in the aforementioned example, the format of the variables will be `<signal>-<fun>-{X/Y/Z}`. It may be seen that some signals do not have an `XYZ` component, so the last part of the variable may be omitted.

##Functions
- `mean()`: Mean value of measurement for each activity for each subject
- `std()`: Standard deviation of measurement for each activity for each subject
- `meanFreq()`: Weighted average of the frequency components to obtain a mean frequency for each activity for each subject

These functions will be applied to the signals to obtain the variable names used in the output dataset. All other variables originally in the dataset have been omitted.

**Important:** Please note that the values in the dataset are all AVERAGES of the original data that were calculated for each Subject in each Activity he/she participated in.

##Other variables
- `Subject_ID`: Identification number of each subject in study (starting from 1)
- `Activity`: Name of activity subject partook in during data collection

There are 6 total values `Activity` can take: ***Walking, Walking Up, Walking Down, Sitting, Standing, Laying***.

##Format of output data
Dimensions of the dataset are 180 rows by ***"TODO ?NCOLS?"***

The output data will be in a wide form. The first column will have the `Subject_ID`, the second column will have `Activity`, and columns starting with column 3 will have variables and their data.

Again, the output data are all averages of the respective variables of the respective functions for each activity and each subject.
