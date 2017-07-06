*DESCRIPTION OF THE "runanalysis.R"*

This is the final project for Getting and Cleaning Data.

#Goal
 
The goal is to prepare tidy data that can be used for later analysis.

The data for the project is extracted from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Flow of the program.

-Data from each table is read in to a object.
-Readed Train and Test object is merged into a single object.
-Column names are extracted from the features text file.
-The mean and standard deviation for each measurement is extracted.
-Descriptive activity names are assigned to name of the activities that are mentioned in numbers in the data set.
-Variable names are given with the appropriate labels in a standard format.
-A final independent tidy data set is extracted with the average of each variable for each activity and each subject.

#Description of the variables in the "Tidy_data_set.txt" file 180 obs. of 68 variables.

###Variable 1 Name:Subject.
Unique integer ID for each subject range from 1-30.

###Variable 2 Name : Activity.
There are six different activites,they are,
Values:
1:Walking
2:Walking_upstairs
3:Walking_downstairs
4:Sitting
5:Standing
6:Laying


###Variable 3-68. Name : Descriptive names that are given to each Variable based on the type observation that has been extracted from the subject.
