# tidydata
This repo includes R scripts for cleaning data on coursera week 4 project.  

It uses two R Packages:  
  1. data.table
  2. dplyr
  
It uses data set from Coursera. Which can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
#### Including library
``` 
library(data.table)
library(dplyr) 
```

#### Reading features names
``` 
feature <- read.table("../data/UCI HAR Dataset/features.txt") 
```

#### Reading activity name
``` 
activity_labels <- read.table("../data/UCI HAR Dataset/activity_labels.txt") 
```

#### Reading training dataset
``` 
X_train <- read.table("../data/UCI HAR Dataset/train/X_train.txt") 
```
#### Reading activity dataset
``` 
y_train <- read.table("../data/UCI HAR Dataset/train/y_train.txt") 
```

#### Reading subject names in training dataset
``` 
subject_train <- read.table("../data/UCI HAR Dataset/train/subject_train.txt")
```

#### Reading testing dataset
```
X_test <-read.table("../data/UCI HAR Dataset/test/X_test.txt") 
```

#### Reading activity dataset
```
y_test <- read.table("../data/UCI HAR Dataset/test/y_test.txt") 
```

#### Reading subject names in testing dataset
``` 
subject_test <- read.table("../data/UCI HAR Dataset/test/subject_test.txt")
```

## Part 4:

#### Assigning names to dataset from features
```
names(X_train) <- feature$V2 
```

#### Assigning names to dataset from features
``` 
names(X_test) <- feature$V2
```

#### Assigning "Subject" as variable name 
``` 
names(subject_train) <- c("subject")
names(subject_test) <- c("subject")
```

#### Assigning "Result" as varible name
``` 
names(y_train) <- c("result")
names(y_test) <- c("result")
```
#### Read subject_train X_train y_train
```
data_train <- cbind(subject_train, X_train, y_train)
```
#### Read subject_test X_test y_test
```
data_test <- cbind(subject_test, X_test, y_test)
```

## Part 1:

#### Combining data_train + data_test
```
data <- rbind(data_train , data_test)
```
## Part 2:

#### Finding columns with mean or std
```
colnumbers <- grep("mean()|std()", names(data))
```
#### New data with only mean and standard deviation
```
data_sim <- data[,c(1, colnumbers, 563)]
```

## Part 3:

#### Assigning names to result variable as activity name
```
data_sim$result = as.character(factor(data_sim$result, labels = activity_labels$V2))
```
#### To tbl format
```
data_sim_tbl <- tbl_df(data_sim)
```
#### Grouping by subject and result
```
data_sim_tbl_group <- group_by(data_sim_tbl, subject, result)
```

## Part 5:

#### Applying mean over the group
```
data_final <- summarise_all(data_sim_tbl_group, mean)
```
