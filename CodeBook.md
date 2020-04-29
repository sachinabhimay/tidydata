# Code Book 

#### Dimension of activity labels
```{r}
dim(activity_labels)
[1] 6 2
```
#### Contents of activity labels
```{r}
activity_labels
V1                 V2
1  1            WALKING
2  2   WALKING_UPSTAIRS
3  3 WALKING_DOWNSTAIRS
4  4            SITTING
5  5           STANDING
6  6             LAYING
```
#### Dimensions of feature
```{r}
dim(feature)
[1] 561   2
```
#### Contents of feature
```{r}
head(feature)
V1                V2
1  1 tBodyAcc-mean()-X
2  2 tBodyAcc-mean()-Y
3  3 tBodyAcc-mean()-Z
4  4  tBodyAcc-std()-X
5  5  tBodyAcc-std()-Y
6  6  tBodyAcc-std()-Z
```
#### Dimensions of X_train
```{r}
dim(X_train)
[1] 7352  561
```
#### Dimensions of y_train
```{r}
dim(y_train)
[1] 7352    1
```
#### Dimension of X_test
```{r}
dim(X_test)
[1] 2947  561
```
#### Dimension of y_test
```{r}
dim(y_test)
[1] 2947    1
```
#### Dimensions of subject_train
```{r}
dim(subject_train)
[1] 7352    1
str(subject_train)
'data.frame':	7352 obs. of  1 variable:
 $ subject: int  1 1 1 1 1 1 1 1 1 1 ...
```
#### Dimension of subject_test
```{r}
dim(subject_test)
[1] 2947    1
str(subject_test)
'data.frame':	2947 obs. of  1 variable:
 $ subject: int  2 2 2 2 2 2 2 2 2 2 ...
```
#### data_train
It is consist of subject_train, X_train and y_train
```{r}
dim(data_train)
[1] 7352  563
```

#### data_test
It is consist of subject_test, X_test and y_train
```{r}
dim(data_test)
[1] 2947  563
```
#### data
It is combined dataset of data_train and data_test
```{r}
dim(data)
[1] 10299   563
```

#### data_sim
It contains of mean and standard deviation colomns out of data
```{r}
dim(data_sim)
[1] 10299    81
```

#### data_sim_tbl
It consist of tbl_df converted format of data_sim
```{r}
dim(data_sim_tbl)
[1] 10299    81
```

#### data_sim_tbl_group
It consist of data_sim_tbl divided into groups on subjects(subject) and result(y)
```{r}
dim(data_sim_tbl_group)
[1] 10299    81
```

#### data_final
It consist of summarized mean data frame of data_sim_tbl_group
```{r}
dim(data_final)
[1] 180  81
```
#### Structure of data_final
```{r}
head(data_final)
# A tibble: 6 x 81
# Groups:   subject [1]
  subject result `tBodyAcc-mean(~ `tBodyAcc-mean(~ `tBodyAcc-mean(~ `tBodyAcc-std()~ `tBodyAcc-std()~ `tBodyAcc-std()~
    <int> <chr>             <dbl>            <dbl>            <dbl>            <dbl>            <dbl>            <dbl>
1       1 LAYING            0.222         -0.0405           -0.113           -0.928          -0.837            -0.826 
2       1 SITTI~            0.261         -0.00131          -0.105           -0.977          -0.923            -0.940 
3       1 STAND~            0.279         -0.0161           -0.111           -0.996          -0.973            -0.980 
4       1 WALKI~            0.277         -0.0174           -0.111           -0.284           0.114            -0.260 
5       1 WALKI~            0.289         -0.00992          -0.108            0.0300         -0.0319           -0.230 
6       1 WALKI~            0.255         -0.0240           -0.0973          -0.355          -0.00232          -0.0195
```
## Variable discription & Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## Variable in X_train and X_test
  Variables are given in features.txt [file](https://github.com/sachinabhimay/tidydata/blob/master/features.txt)
















