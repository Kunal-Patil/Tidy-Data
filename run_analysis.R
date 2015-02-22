##Windows 8.1
##R 3.1.2
###############################
## Download the zip file## 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp,exdir=tempdir())
unlink(temp)
setwd(tempdir())
######################
##Begin Processing##
setwd("UCI HAR Dataset/")
features<-read.table("features.txt")["V2"] ## tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, etc.
activity_labels<-read.table("activity_labels.txt")["V2"]  ##WALKING, STANDING, etc
mean_and_std_indices<-grep("mean\\(|std\\(",features$V2,ignore.case=FALSE)  #ignore.case=FALSE to filter(not include) substring "gravityMean", and mean\\(|std\\( to filter(not include) substring "meanFreq"
setwd("train")
X_train<-read.table("X_train.txt")
names(X_train)<-features$V2
y_train<-read.table("y_train.txt")
names(y_train)<-names(y_train)<-"labels"
subject_train<-read.table("subject_train.txt")
names(subject_train)<-"subjects"
setwd("../test/")
X_test<-read.table("X_test.txt")
names(X_test)<-features$V2
y_test<-read.table("y_test.txt")
names(y_test)<-"labels"
subject_test<-read.table("subject_test.txt")
names(subject_test)<-"subjects"
setwd("../../")
only_mean_std_cols<-colnames(X_test)[mean_and_std_indices]
##subset creation
X_test_subset<-cbind(subject_test,y_test,subset(X_test,select=only_mean_std_cols))
X_train_subset<-cbind(subject_train,y_train,subset(X_train,select=only_mean_std_cols))
## Merge the training and the test sets to create one data set.
Xy<-rbind(X_test_subset, X_train_subset)
##the other tidy data set. independent tidy data set with the average of each variable for each activity and each subject.
tidy<-aggregate(Xy[,3:ncol(Xy)],list(Subject=Xy$subjects, Activity=Xy$labels), mean)
##order the dataset by Subject variable
tidy<-tidy[order(tidy$Subject),]
##Name the activities
tidy$Activity<-activity_labels[tidy$Activity,]
##Finally save the data in a file
write.table(tidy, file="./tidy_data.txt", sep="\t", row.names=FALSE)
