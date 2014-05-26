qacd-course-project
===================
This repository includes a file run_analysis.R that:

Creates a directory

Reads test data and labels from "~/R/gacd/project/UCI HAR Dataset/test/"

combines test set data and test set labels

Reads trial data and labels from "~/R/gacd/project/UCI HAR Dataset/train/"

combines train data and labels and changes variable labels from numeric to human readable labels

merges test data and train data

Reads activity file

Creates a table with only mean and std values

Add the activity labels to the mean_std table

Creates a second tidy data set with avg of each variable for each activity and each subject

writes the tidy data to csv and txt file tables
