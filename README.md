#Final Project under Getting and Cleaning Data

This is readme file contains the instructions to build a tidy data set from the collected raw data gathered from the accelerometers
and gyroscopes of Samsung Galaxy S2 phone of give human sample
Given that the requirments are met "run_analysis.R" will generate a tidy data set called "idy_data.txt" from the given data.

##initializing
Step 1 :- Download data from the source - "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
Step 2 :- Copy all the data files into a single folder. Following are the names of those data files.
  1. activity_labels
  2. features
  3. feature_info
  4. subject_test
  5. subject_train
  6. X_test
  7. X_train
  8. y_test
  9. y_train
  
Step 3 :- Set the working directory to the location where the data are saved.

Step 4 :- Load the pacakges "dplyr" ,"plyr" and "reshape2" to the environment.

##Procedure
Following is the outline of the program in "run_analysis.R"

1. Read "X_train" and "X_test" data and bind "X_test" at the bottom of "X_train" to get the data frame "X_complete".
2. Assing names from "features.txt" as the column names of "X_complete".
3. Filter the columns having means and standard deviations from the data frame "X_complete".
4. Read "subject_train.txt" and "subject_text.txt" and row bind them to appropriately to match with each observation.
5. Read "activity_labels.txt" and assign activities to each observation using the activity number.
6. Melts down by getting the average to create the tidy data set.
7. Find the mean for the data in the tidy dataset that belongs to each Activity & Subject combination for each Feature.

And finally generate the "tidy_data.txt" to the working directory.

  

