## Cleaning Data Project
setwd("/Users/ezwieg/Documents/Coursera/Clean_data")

## 1. Merge training and test datasets
# subject files contain the ID variables
train_sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
test_sub  <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
colnames(train_sub) <- "ID"
colnames(test_sub) <- "ID"

# Y files contain the activity variable
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
test_y  <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
colnames(train_y) <- "activity"
colnames(test_y) <- "activity"

# X files contain the actual data
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
test_x  <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

# variable names for the x files  (STEP #4)
var_names <-read.table("./data/UCI HAR Dataset/features.txt")
var_names <- var_names[,2]
colnames(train_x) <- var_names
colnames(test_x) <- var_names

# merge the three tables together
train <- cbind(train_x, train_sub, train_y)
test  <- cbind(test_x, test_sub, test_y)

# create one dataset
data <- rbind(train, test)

# Remove the source tables since they've been merged in train and test tables
rm(train_sub, train_x, train_y, train, test_sub, test_x, test_y, test, var_names)

## 2. Extract mean and std of each measurement
data <- data[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,562,563)]

## 3. Use descriptive names for activities
#activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
data$activity_label[data$activity == 1] <- "WALKING"
data$activity_label[data$activity == 2] <- "WALKING_UPSTAIRS"
data$activity_label[data$activity == 3] <- "WALKING_DOWNSTAIRS"
data$activity_label[data$activity == 4] <- "SITTING"
data$activity_label[data$activity == 5] <- "STANDING"
data$activity_label[data$activity == 6] <- "LAYING"

## 5 create tidy dataset with average of each variable for each activity and each subject
# subject, activity, variable, average
# define ID and activity_label as factors
data$ID <- factor(data$ID)
data$activity_label <- factor(data$activity_label)

tidy = aggregate(data, by=list(activity_label = data$activity_label, ID=data$ID), mean)

write.table(tidy, "tidy.txt", row.name=FALSE)

## list of variables
# 1 tBodyAcc-mean()-X
# 2 tBodyAcc-mean()-Y
# 3 tBodyAcc-mean()-Z
# 4 tBodyAcc-std()-X
# 5 tBodyAcc-std()-Y
# 6 tBodyAcc-std()-Z
# 41 tGravityAcc-mean()-X
# 42 tGravityAcc-mean()-Y
# 43 tGravityAcc-mean()-Z
# 44 tGravityAcc-std()-X
# 45 tGravityAcc-std()-Y
# 46 tGravityAcc-std()-Z
# 81 tBodyAccJerk-mean()-X
# 82 tBodyAccJerk-mean()-Y
# 83 tBodyAccJerk-mean()-Z
# 84 tBodyAccJerk-std()-X
# 85 tBodyAccJerk-std()-Y
# 86 tBodyAccJerk-std()-Z
# 121 tBodyGyro-mean()-X
# 122 tBodyGyro-mean()-Y
# 123 tBodyGyro-mean()-Z
# 124 tBodyGyro-std()-X
# 125 tBodyGyro-std()-Y
# 126 tBodyGyro-std()-Z
# 161 tBodyGyroJerk-mean()-X
# 162 tBodyGyroJerk-mean()-Y
# 163 tBodyGyroJerk-mean()-Z
# 164 tBodyGyroJerk-std()-X
# 165 tBodyGyroJerk-std()-Y
# 166 tBodyGyroJerk-std()-Z
# 201 tBodyAccMag-mean()
# 202 tBodyAccMag-std()
# 214 tGravityAccMag-mean()
# 215 tGravityAccMag-std()
# 240 tBodyGyroMag-mean()
# 241 tBodyGyroMag-std()
# 253 tBodyGyroJerkMag-mean()
# 254 tBodyGyroJerkMag-std()
# 266 fBodyAcc-mean()-X
# 267 fBodyAcc-mean()-Y
# 268 fBodyAcc-mean()-Z
# 269 fBodyAcc-std()-X
# 270 fBodyAcc-std()-Y
# 271 fBodyAcc-std()-Z
# 345 fBodyAccJerk-mean()-X
# 346 fBodyAccJerk-mean()-Y
# 347 fBodyAccJerk-mean()-Z
# 348 fBodyAccJerk-std()-X
# 349 fBodyAccJerk-std()-Y
# 350 fBodyAccJerk-std()-Z
# 424 fBodyGyro-mean()-X
# 425 fBodyGyro-mean()-Y
# 426 fBodyGyro-mean()-Z
# 427 fBodyGyro-std()-X
# 428 fBodyGyro-std()-Y
# 429 fBodyGyro-std()-Z
# 503 fBodyAccMag-mean()
# 504 fBodyAccMag-std()
# 516 fBodyBodyAccJerkMag-mean()
# 517 fBodyBodyAccJerkMag-std()
# 529 fBodyBodyGyroMag-mean()
# 530 fBodyBodyGyroMag-std()

