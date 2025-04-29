# import packages from library
library(tidyverse)
library(dplyr)
library(stringr)

# get data path
path_x_test <- "UCI HAR Dataset/test/X_test.txt"
path_y_test <- "UCI HAR Dataset/test/y_test.txt"
path_subject_test <- "UCI HAR Dataset/test/subject_test.txt"
path_x_train <- "UCI HAR Dataset/train/X_train.txt"
path_y_train <- "UCI HAR Dataset/train/y_train.txt"
path_subject_train <- "UCI HAR Dataset/train/subject_train.txt"
path_activity_labels <- "UCI HAR Dataset/activity_labels.txt"


# read data
x_test <- read.table(path_x_test)
y_test <- read.table(path_y_test)
x_train <- read.table(path_x_train)
y_train <- read.table(path_y_train)
subject_test <- read.table(path_subject_test)
subject_train <- read.table(path_subject_train)
activity_labels <- read.table(path_subject_train)

# read data names
features_names <- read.table("UCI HAR Dataset/features.txt")[,2]
activity_factors <- read.table(path_activity_labels)

# extract the index for mean and std measurement
extract_indx <- grep("mean\\(\\)|std\\(\\)",features_names)

# 1.Merges the training and the test sets to create one data set.
fulldata <- rbind(cbind(x_test,y_test,subject_test),cbind(x_train,y_train,subject_train))

# 3.Uses descriptive activity names to name the activities in the data set
names(fulldata) <- c(features_names,"activities","subjects")

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
subset <- as_tibble(fulldata[,c(extract_indx,562,563)])

# 4.Appropriately labels the data set with descriptive variable names. 
subset2 <- subset %>% mutate(
  activities = factor(activities,
                      levels = activity_factors$V1,
                      labels = activity_factors$V2)
)

# 5.From the data set in step 4, creates a second, 
#   independent tidy data set with the average of each variable for each activity and each subject.


tidydata <- subset2 %>%
  group_by(activities, subjects) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()


#output a dataset
write.table(tidydata,file="tidydata.txt",row.name=FALSE)