setwd("C:/Users/Sarah/Dropbox/R Tutorials/UCI HAR Dataset")
library(reshape2)

# load subject, activity, features
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")
activity_train <- read.table("./train/y_train.txt")
activity_test <- read.table("./test/y_test.txt")
features_train <- read.table("./train/X_train.txt")
features_test <- read.table("./test/X_test.txt")

# combine test and train
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features <- rbind(features_train, features_test)

#set column names
names(subject) <- "subject"
names(activity) <- "activity"
feature_names <- read.table("features.txt")
names(features) <- feature_names$V2

#combine into one dataset
data <- cbind(subject, activity, features)

#select mean and sd
sub_features <- grepl("mean\\(\\)", names(data)) | grepl("std\\(\\)", names(data))
sub_features[1:2] <- TRUE
data <- data[, sub_features]

# label activity names 
data$activity <- factor(data$activity, 
                        levels = c(1, 2, 3, 4, 5, 6), 
                        labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# create new dataset with means of each variable for each activity and each subject
melted <- melt(data, id=c("subject","activity"))
tidy_data <- dcast(melted, subject + activity ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt", row.name = FALSE)
