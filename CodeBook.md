---
title: "CodeBook"
author: "Beatrice Tierra"
date: "10/16/2020"
output: html_document
---
The run_analysis.R script takes in the text files from the UCI HAR Dataset as its input and cleans up the data into a single dataframe that can be used for further analysis. 

1. The data was first downloaded and saved under the UCI HAR Dataset folder. 

2. Each text file was saved under the appropriate dataframe name
    * features <- features.txt
    * activities <- activity_labels.txt 
    * subject_test <- test/subject_test.txt 
    * x_test <- test/X_test.txt 
    * y_test <- test/y_test.txt 
    * subject_train <- test/subject_train.txt
    * x_train <- test/X_train.txt
    * train <- test/y_train.txt


3. Merges the training set, test set, and subject description into one dataframe

4. Retain only the mean and standard deviation variable measuremnts 

5. Replace the activity code number with the activity description given by the activity_labels.txt

6. Replaces abbreviated and obscure column names with more descriptive terms 
    * Acc -> Accelerometer
    * Gyro -> Gyroscope
    * BodyBody -> Body
    * Mag -> Magnitude
    * Columns that start with 'f' -> Frequency
    * Columns that start with 't' -> Time

7. Grouped dataframe by subject then activity, and calculated mean for each feature.
