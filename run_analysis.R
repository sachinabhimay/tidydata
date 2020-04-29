## including library
library(data.table)
library(dplyr)

## reading features names
feature <- read.table("../data/UCI HAR Dataset/features.txt")

## reading 
activity_labels <- read.table("../data/UCI HAR Dataset/activity_labels.txt")

## reading training dataset
X_train <- read.table("../data/UCI HAR Dataset/train/X_train.txt")

## 4.
## assigning names to dataset from features
names(X_train) <- feature$V2

## reading activity dataset
y_train <- read.table("../data/UCI HAR Dataset/train/y_train.txt")

## reading subject names in training dataset
subject_train <- read.table("../data/UCI HAR Dataset/train/subject_train.txt")

## reading testing dataset
X_test <- read.table("../data/UCI HAR Dataset/test/X_test.txt")

## 4.
## assigning names to dataset from features
names(X_test) <- feature$V2

## reaind activity dataset
y_test <- read.table("../data/UCI HAR Dataset/test/y_test.txt")

## reading subject names in testing dataset
subject_test <- read.table("../data/UCI HAR Dataset/test/subject_test.txt")

## 4.
## assigning name to subject variable
names(subject_train) <- c("subject")
names(subject_test) <- c("subject")

## 4.
## assigning name to result variable
names(y_train) <- c("result")
names(y_test) <- c("result")

## subject_train X_train y_train
data_train <- cbind(subject_train, X_train, y_train)

## subject_test X_test y_test
data_test <- cbind(subject_test, X_test, y_test)

## 1.
## data_train + data_test
data <- rbind(data_train , data_test)

## 2.
## columns with mean or std
colnumbers <- grep("mean()|std()", names(data))

## new data with only mean and 
data_sim <- data[,c(1, colnumbers, 563)]

## 3.
## assigning names to result variable as activity name
data_sim$result = as.character(factor(data_sim$result, labels = activity_labels$V2))

## to tbl format
data_sim_tbl <- tbl_df(data_sim)

## grouping by subject and result
data_sim_tbl_group <- group_by(data_sim_tbl, subject, result)

## 5.
## applying mean over the group
data_final <- summarise_all(data_sim_tbl_group, mean)
