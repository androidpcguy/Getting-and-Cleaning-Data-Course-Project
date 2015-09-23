#CodeBook for Course Project

##Experimental procedure and preliminary data analysis
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAc
c-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant ra
te of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter wi
th a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated int
o body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signa
ls (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyro
JerkMag). 

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
- mean(): Average of mean value of measurement for each activity for each subject
- std(): Average of standard deviation of measurement for each activity for each subject
- meanFreq(): Average of weighted average of the frequency components to obtain a mean frequency for each activity for each subject

These functions will be applied to the signals to obtain the variable names used in the output dataset. All other variables originally in the dataset have been omitted.

##Other variables
- `Subject_ID`: Identification number of each subject in study (total 30)
- `Activity`: Name of activity subject partook in during data collection

There are 6 total values `Activity` can take: Walking, Walking Up, Walking Down, Sitting, Standing, Laying.

##Format of output data
The output data will be in a wide form. The first column will have the `Subject_ID`, the second column will have `Activity`, and columns starting with column 3 will have variables and their data.

The output data are all averages of the respective variables of the respective functions for each activity and each subject.
