## Getting and Cleaning Data Course Project

## READ ME


Project details extracted from Coursera :

Here are the data for the project : 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following :

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
==============
   
## Project Work

In the repo 'unit3_project', there are 3 files :

1. 'run_analysis.R' - Contain the code for processing the original data set into the tidy data set. Do note that in order for the code to run, you need to have Samsung data extracted to your working directory. 

2. 'README.md' - This Readme file provides the project background and details of how the code works.

3. 'CodeBook.md' - Explains the variables in the processed tidy data set.
   
   
==============
   
## The code in run_analysis.R does the following :

## Step 1 :

- Read data sets in 'train' and 'test' folder

- Extract the name of each feature variables from 'features.txt'

- Name all the columns in the data sets : 'activity', 'subject', and the corresponding feature variable name

- Merge all these data sets into a single data set with the following column order : 'activity', 'subject', and the list of 'feature variables'

## Step 2 :

- From the data set in Step 1, take a subset of only the measurements on the mean and standard deviation for each measurement

- Only those features with variable names that contain '-mean()' or '-std() will be extracted.  For e.g. 'tBodyAccMag-mean()' and 'fBodyAccJerk-std()-Y'

- A smaller data set will be output with the following column order : 'activity', 'subject', and the reduced list of 'feature variables' for mean and standard deviation measurements only

## Step 3 :

- Extract the list of activity names from 'activity_labels.txt'

- Convert the activity names to lower case

- For the 'activity' column in the data set from Step 2, replace the activity code with the corresponding activity name

- This will result in a similar data set as Step 2, but with descriptive activity names instead of activity codes

## Step 4 :

For all variable names in the data set from Step 3,

- Convert all characters to lower case

- Replace short forms with more descriptive forms

- Remove '(' and ')' characters

- Refer to CodeBook.md for a full descriptions of each variable name

## Step 5 :

- It is required to install the 'dplyr' package  in order to run this script

- Load the library for 'dplyr'

- Group the data set from Step 4 by activity and subject

- Create a data set that computes the mean of each variable for each group

## For submission :

- Write the data set from Step 5 to a text file named tidy.txt
