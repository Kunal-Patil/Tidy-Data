Source Data repo:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The directory structure is as follows:
─UCI HAR Dataset
 │   activity_labels.txt
 │   features.txt
 │   features_info.txt
 │   README.txt
 │
 ├───test
 │   │   subject_test.txt
 │   │   X_test.txt
 │   │   y_test.txt
 │   │
 │   └───Inertial Signals
 │           body_acc_x_test.txt
 │           body_acc_y_test.txt
 │           body_acc_z_test.txt
 │           body_gyro_x_test.txt
 │           body_gyro_y_test.txt
 │           body_gyro_z_test.txt
 │           total_acc_x_test.txt
 │           total_acc_y_test.txt
 │           total_acc_z_test.txt
 │
 └───train
     │   subject_train.txt
     │   X_train.txt
     │   y_train.txt
     │
     └───Inertial Signals
             body_acc_x_train.txt
             body_acc_y_train.txt
             body_acc_z_train.txt
             body_gyro_x_train.txt
             body_gyro_y_train.txt
             body_gyro_z_train.txt
             total_acc_x_train.txt
             total_acc_y_train.txt
             total_acc_z_train.txt


Files test\X_test.txt, test\y_test.txt, and test\subject_test.txt merged into "test" data table.
Files test\X_train.txt, test\y_train.txt, test\subject_train.txt were merged into "train" data table.
List of indices corresponding to variables describing mean and SD were obtained from features.txt file. NOTE: grep command was used to obtain only those with mean and std as substring. Variable with gravityMean and meanFreq is not a part of the dataset.
Measurements on the mean and SD for each measurement were extracted from both train and test data tables, which were then merged into a single table "cbind"ed with subjects and activit-labels).
Another data set with the average of each variable for each activity and each subject was created. 
The rows were reodered so that activities performed by each subject are in adjacent rows.
Each activity label was replaced with corresponding activity name from activity_labels.txt.

Column names:

    Subject: .. range of values [1:30] .. id of a subject performing ther activity
    Activity: .. Name of activity performed

Rest of the columns correspond to averaged variables describing mean/std measurements.
Names of these variables are same as in features.txt but the values are averages of each variable for each activity and each subject.
