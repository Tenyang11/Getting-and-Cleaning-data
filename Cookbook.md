Getting and Cleaning Data Project

TenYang

Description

Additional information about the variables, data and transformations used in the course project.

Source Data

A full description of the data used in this project can be found at from the course.

Section 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read tables into Rstudio, assign column names and merge to create a new data set including test and train data.

features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt
Assign column names and merge to create one data set.

Section 2. Extract only the measurements on the mean and standard deviation for each measurement.

Extract the features which only contains mean and standard deviation and display them.

Section 3 &4. Use descriptive activity names to name the activities in the data set

read descriptive activity table, and names to activities label. Use gsub function for pattern replacement

Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

Produce only a data set with the average of each veriable for each activity and subject, and write the result as csv file.
