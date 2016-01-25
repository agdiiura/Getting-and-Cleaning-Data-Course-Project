#########################################################
### Coursera Getting and Cleaning Data Course Project ###
#########################################################

### 1. Merge the training and test sets to create one data set
### 2. Extract only the measurements on the mean and standard deviation for each measurement
### 3. Use descriptive activity names to name the activities in the data set
### 4. Appropriately label the data set with descriptive variable names
### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject


library(reshape2)

### load test data
subject_test <- read.table("Dataset/test/subject_test.txt" , header=FALSE)
X_test <- read.table("Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("Dataset/test/y_test.txt", header=FALSE)

#head(subject_test)
#head(X_test)
#head(y_test)

### load train data
subject_train <- read.table("Dataset/train/subject_train.txt", header=FALSE)
X_train <- read.table("Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("Dataset/train/y_train.txt", header=FALSE)

#head(subject_train)
#head(X_train)
#head(y_train)

#str(subject_train)
#str(X_train)
#str(y_train)

### load activity
activity_labels <- read.table("Dataset/activity_labels.txt", sep="", header=FALSE)
#head(activityLabels)

### load features
features <- read.table("Dataset/features.txt", sep="", header=FALSE)
feature_names <- as.character(features[,2])
#head(features)

### load activity
activityLabels <- read.table("Dataset/activity_labels.txt", sep="", header=FALSE)
#head(activityLabels)


### name columns of test and train features from the feature_names dataset
names(X_test) <- feature_names
names(X_train) <- feature_names

#str(X_test)


### create a logical mask for the mean() and std()
mean_and_std_mask <- grepl("mean\\(\\)|std\\(\\)", features[, 2])
#head(mean_and_std_mask)


### create vectors/data.tables from train and test data using the logical mask
subject_all <- rbind(subject_test, subject_train)
X_all <- rbind(X_test[, mean_and_std_mask], X_train[, mean_and_std_mask])
y_all <- rbind(y_test, y_train)

### merges all vectors/data.tables into one data.tables
merged_data <- cbind(subject_all, y_all, X_all)
names(merged_data)[1] <- "subject_ID"
names(merged_data)[2] <- "activity"
#str(merged_data)

### aggregate by subject_ID and activity
merged_data <- aggregate(. ~ subject_ID + activity, data = merged_data, FUN = mean)

### give activities the activity_labels names
merged_data$activity <- factor(merged_data$activity, labels = activity_labels[,2])

write.table(merged_data, file="./tidy_dataset.txt", sep="\t", row.names=FALSE)
