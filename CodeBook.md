## Code Book

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data for this project

### Source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Overview

The experiments were carried out with a group of 30 volunteers between 19-48 years of age. Each person performed different activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) while wearing a smartphone (Samsung Galaxy S II) on their waist. Various parameters of their movements were captured.


### The dataset includes the following files:

* `features.txt`: List of movement attributes
* `features_info.txt`: Description of movement attributes recorded
* `activity_labels.txt`: Names and labels of each activity type

* `X_train.txt`: Data of movement features for volunteers in the training set
* `subject_train.txt`: Subject ID for each movement observation in `X_train.txt`.
* `y_train.txt`: Activity label for each movement observation in `X_train.txt`.

* `X_test.txt`: Data of movement features for volunteers in the testing set
* `subject_test.txt`: Subject ID for each movement observation in `X_train.txt`.
* `y_test.txt`: Activity label for each movement observation in `X_train.txt`.

This analysis did not use the raw data in the "Inertial Signals" folders.

### Processing Steps

1. Read and merged the subject, activity and feature files into a single dataframe
2. Mean and standard deviation columns for each attribute were extracted
3. Descriptive activity names were applied to the subsetted dataframe
4. Created an independent data set with the average of each variable for each activity for all subjects
5. Created output for tidy data set
