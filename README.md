# Getting_And_Cleaning_Data_Assignment
This repository contains the R script titled run_analysis.R that was created for the Coursera Getting and Cleaning Data course assignment. The script produces a text file titled "Tidy Output Project Assignment.txt" in the computer's working directory. 

The Getting and Cleaning Data project assignment uses Samsung Galaxy S accelerometer data described at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The full accelerometer data set used in the assignment can be found at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis.R script assumes the following data files contained in the zip file are in the working directory:
   - test/X_test.txt  
   - train/X_train.txt
   - test/y_test.txt
   - train/y_train.txt
   - test/subject_test.txt
   - train/subject_train.txt
   - features.txt

This readme file describes the steps that were taken to convert the data into a tidy form. The tidy form includes the mean of each measured variable in a given column and one activity-subject measurement on each line. The activities that were performed by the 30 subjects monitored during the data collection process included laying down, sitting, standing, walking, walking upstairs, and walking downstairs. The activities and subject identifiers are shown in the first two columns of the output file produced by run_analysis.R script. The remaining columns of the output file contain the mean() and std() data contained in the test and training data sets (i.e., X_test.txt and X_train.txt).

The steps that were followed to produce the tidy data set included:
- The data files shown above were downloaded
- The activity identification and subject identification numbers were added as the first two columns in the test and training data sets (e.g., the y_test.txt and subject_test.txt data were bound to the X_test.txt data using the cbind() command)
- The activity and subject columns were named in the test and training data sets
- The activity identification numbers contained in the y_test.txt and y_train.txt data sets were replaced with the words Laying, Sitting, Standing, Walking, WalkingUpstairs, and WalkingDownstairs to make the identifiers more understandable
- "Activity" and "Subject" were added as the first two items in the Features list to make the number of Feature items match the number of columns in the test and training data sets
- The names included in the Features list were used as the data column titles in the test and training data sets
- The test and training data sets were shortened to only include the mean() and std() data columns
- The test and training data sets were combined using the rbind() command to make a full data set
- The average value of the mean() and std() data collected for each activity-subject combination was calculated using the aggregate() command and the average values were written to "Tidy Output Project Assignment.txt"

