## including library
library(data.table)
library(dplyr)


feature <- read.table("../data/UCI HAR Dataset/features.txt")        ## reading features names

activity_labels <- read.table("../data/UCI HAR Dataset/activity_labels.txt")  ## reading acivities

X_train <- read.table("../data/UCI HAR Dataset/train/X_train.txt")     ## reading training dataset
y_train <- read.table("../data/UCI HAR Dataset/train/y_train.txt")      ## reading activity dataset
subject_train <- read.table("../data/UCI HAR Dataset/train/subject_train.txt")   ## reading subject names in training dataset

X_test <- read.table("../data/UCI HAR Dataset/test/X_test.txt")         ## reading testing dataset
y_test <- read.table("../data/UCI HAR Dataset/test/y_test.txt")         ## reaind activity dataset
subject_test <- read.table("../data/UCI HAR Dataset/test/subject_test.txt")   ## reading subject names in testing dataset

## 4.
feature$V2 <- gsub("()|-","",feature$V2)
names(X_test) <- feature$V2    ## assigning names to dataset from features
names(X_train) <- feature$V2  
names(subject_train) <- c("subject")  ## assigning name to subject variable
names(subject_test) <- c("subject")
names(y_train) <- c("result") ## assigning name to result variable
names(y_test) <- c("result")


data_train <- cbind(subject_train, X_train, y_train)  ## subject_train + X_train + y_train
data_test <- cbind(subject_test, X_test, y_test)   ## subject_test + X_test + y_test

## 1.
data <- rbind(data_train , data_test)  ## data_train + data_test

## 2.
colnumbers <- grep("mean()|std()", names(data)) ## columns with mean or std
data_sim <- data[,c(1, colnumbers, 563)]  ## new data with only mean and std 

## 3.
## assigning names to result variable as activity name
data_sim$result = as.character(factor(data_sim$result, labels = activity_labels$V2)) 

## 5.
data_sim_tbl <- tbl_df(data_sim)                                ## to tbl format
data_sim_tbl_group <- group_by(data_sim_tbl, subject, result)   ## grouping by subject and result
data_final <- summarise_all(data_sim_tbl_group, mean)           ## applying mean over the group

## Final
write.table(data_final, row.names = FALSE,"../data/data_final.txt")   ## Writing data in file
