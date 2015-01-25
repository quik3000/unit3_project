## Getting and Cleaning Data Course Project

## Download the zip file from the given URL and
## Unzip to the working directory

## Read data from Training set

xtrainingdata <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrainingdata <- read.table("UCI HAR Dataset/train/y_train.txt")
strainingdata <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Read data from Test set

xtestdata <- read.table("UCI HAR Dataset/test/X_test.txt")
ytestdata <- read.table("UCI HAR Dataset/test/y_test.txt")
stestdata <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Read data from features.txt

features <- read.table("UCI HAR Dataset/features.txt")
my_col <- as.vector(features[, 2])

## Merging Training and Test data sets

merge_x <- rbind(xtrainingdata, xtestdata)
merge_y <- rbind(ytrainingdata, ytestdata)
merge_s <- rbind(strainingdata, stestdata)

## Name and bind columns

names(merge_x) <- my_col
names(merge_y) <- "activity"
names(merge_s) <- "subject"
merge_all <- cbind(merge_y, merge_s, merge_x)

## One dataset created

## Extract relevant columns in data set 

labels <- "activity|subject|mean|std"

merge_all2 <- merge_all[, grep(labels, colnames(merge_all))]

## Remove unnecessary columns in data set

merge_all3 <- merge_all2[, -grep("meanFreq", colnames(merge_all2))]

## Completed extraction of measurements on the mean
## and standard deviation.

## Read data from activity_labels.txt

actlabels <- read.table("UCI HAR Dataset/activity_labels.txt")

act1 <- tolower(as.character(actlabels[1, 2]))
act2 <- tolower(as.character(actlabels[2, 2]))
act3 <- tolower(as.character(actlabels[3, 2]))
act4 <- tolower(as.character(actlabels[4, 2]))
act5 <- tolower(as.character(actlabels[5, 2]))
act6 <- tolower(as.character(actlabels[6, 2]))

## Replace activity codes with the respective activity names

activity <- gsub("1", act1, merge_all3[, 1])
activity <- gsub("2", act2, activity)
activity <- gsub("3", act3, activity)
activity <- gsub("4", act4, activity)
activity <- gsub("5", act5, activity)
activity <- gsub("6", act6, activity)

## Bind columns to form the required data set

merge_all4 <- cbind(activity, merge_all3[, -1])

## Completed using descriptive activity names to name 
## the activities in the data set.

## Convert all upper-case characters to lower-case

names(merge_all4) <- tolower(names(merge_all4))

## Replace "tbody" with "time body"; "tgravity" with "time gravity"
## Replace "fbody" with "frequency body" 
## Replace "acc" with "accelerometer"; "gyro" with "gyroscope"
## Replace "mag" with "magnitude"
## Replace "-mean" with "mean value"; "-std" with "standard deviation"
## Replace "bodybody" with "body"; "jerk" with "jerk "
## Replace "-x" with "indirection of x"; "-y" with "indirection of y"
## Replace "-z" with "indirection of z"


names(merge_all4) <- gsub("tbody", "time body ", names(merge_all4))
names(merge_all4) <- gsub("tgravity", "time gravity ", names(merge_all4))
names(merge_all4) <- gsub("fbody", "frequency body ", names(merge_all4))
names(merge_all4) <- gsub("acc", "accelerometer ", names(merge_all4))
names(merge_all4) <- gsub("gyro", "gyroscope ", names(merge_all4))
names(merge_all4) <- gsub("mag", "magnitude ", names(merge_all4))
names(merge_all4) <- gsub("-mean", "mean value ", names(merge_all4))
names(merge_all4) <- gsub("-std", "standard deviation ", names(merge_all4))
names(merge_all4) <- gsub("body body", "body ", names(merge_all4))
names(merge_all4) <- gsub("jerk", "jerk ", names(merge_all4))
names(merge_all4) <- gsub("-x", "indirection of x", names(merge_all4))
names(merge_all4) <- gsub("-y", "indirection of y", names(merge_all4))
names(merge_all4) <- gsub("-z", "indirection of z", names(merge_all4))

## Remove these characters: "(" and ")"

names(merge_all4) <- gsub("\\(", "", names(merge_all4))
names(merge_all4) <- gsub("\\)", "", names(merge_all4))

## Completed labeling of data set with descriptive names.

## Load 'dplyr' package

library(dplyr)

## Compute mean of each variables by activity and subject

tidy <- group_by(merge_all4, activity, subject)%>%
  summarise_each(funs(mean))

## Completed creating a second independent tidy data set with the
## average of each variable for each activities and each subjects.

## Save data set into a text file for submission.

write.table(tidy, file = "tidy.txt", row.names = FALSE)

#########################################################
