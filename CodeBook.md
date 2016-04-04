# Getting and Cleaning Data 
This codebook esplains the data, the variables, and any transformations or work that is performed to clean up the data used in the program "run_analysis.R" .

## Original Data
Original dataset represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 
Data set information : 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.* Data has been labeled manually.
## Datasets used in “run_analysis.R”
These datasets are available in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* `train/X_train.txt`: Training dataset.
* `test/X_test.txt`: Test dataset.
* `train/y_train.txt`: Training activities.
* `test/y_test.txt`: Test activities.
* `train/subject_train.txt`: Subject who performed the activity in train set.
* `test/subject_train.txt` : Subject who performed the activity in test set. 
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.

## Variables (Columns of the Dataset)
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. Note the 'f' to indicate frequency domain signals. 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Measures:
* tBodyAcc-XYZ,
* tGravityAcc-XYZ,
* tBodyAccJerk-XYZ,
* tBodyGyro-XYZ,
* tBodyGyroJerk-XYZ,
* tBodyAccMag,
* tGravityAccMag,
* tBodyAccJerkMag,
* tBodyGyroMag,
* tBodyGyroJerkMag,
* fBodyAcc-XYZ,
* fBodyAccJerk-XYZ,
* fBodyGyro-XYZ,
* fBodyAccMag,
* fBodyAccJerkMag,
* fBodyGyroMag,
* fBodyGyroJerkMag.

Variables for each measure above:
* mean(): Mean value,
* std(): Standard deviation,

Variables in the tidy_data.txt are the Mean and Standard Deviation of the measures that are above.
##Description of abbreviations of measurements
1.	leading t or f is based on time or frequency measurements.
2.	Body = related to body movement.
3.	Gravity = acceleration of gravity
4.	Acc = accelerometer measurement
5.	Gyro = gyroscopic measurements
6.	Jerk = sudden movement acceleration
7.	Mag = magnitude of movement
8.	mean() and std() are calculated for each subject for each activity for each mean and std measurements for all features.

##Process in "run_analysis.R"

In the process ofrun_analysis, the following variables are created
* `X_train` : data from "train//X_train.txt"
* `X_test` : data from "test//X_test.txt"
* `X_complete` : dataset obtained by merging `X_train` & `X_test` 
* `features` : data from "features.txt" with column names "Index","Feature_label"
* `feature_labels` : 2nd column of `features` converted to character
* `split_fl` : Split the feature names in `feature_labels` with "-" sign
* `logic_MeanStd` : Logical vector  for `split_fl` which is TRUE if mean() or std() is present in the feature.
* `X_Meanstd` : from `X_complete`  filtered out the columns that has names that has only mean() and std() in them
* `subject_train` : data from "test//subject_train.txt"
* `subject_test` : data from "test//subject_test.txt"
* `subject` : merged data from `subject_train` & `subject_test` with column name "Subject"
* `y_train` : data from "train//subject_train.txt"
* `y_test` : data from "test//subject_test.txt"
* `activity` : merged data from `y_train` & `y_test` with column name "activity_num "
* `activity_labels ` : activity label data from "activity_labels.txt" with column names " activity_num","Activity"
* `activity_final ` : joined datasets `activity`, `activity_labels` ,by column " activity_num " and making the 1st column null so that only the activity names are in the dataframe
* `X_final` : binding the columns in `X_Meanstd`, `activity_final`, `subject`
* `temp_names` : Names of all columns in `X_Meanstd`
* `melted_X_final` : Melted `X_final` by "Subject" & "Activity"
* `mean_X_final` : Mean of `X_final` by each "Subject" & "Activity" combination
* `final_col_names` : tidy column names for `mean_X_final` dataset
* `raw_data.txt` : Data for of 3-axial signals in the X, Y and Z directions with mean() and std() estimates.
* `tidy_data.txt` : Final output tidy dataset

## Transfromations

* One data set is obtained by merging  Train and Test datasets consisting all subjects and activities merged together.
* mean() and std()  of features columns were extracted out
* Corresponding names are given for the activity numbers.
* A text file is written, named 'tidy_data.txt',  that consists tidy data for means variable, subject and activitywise.

## References

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.


