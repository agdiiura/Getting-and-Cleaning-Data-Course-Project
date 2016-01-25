# CodeBook for the tidy dataset

## Original dataset
The original dataset can be obtained here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . The original pubblication can be found at this url http://link.springer.com/chapter/10.1007%2F978-3-642-35395-6_30

## Procedure
Test (`<X_test>` and `<y_test>`) and train (`<X_train>` and `<y_train>`) data were loaded separately. 
Headers for the `<X>`-values were extracted from `<features.txt>` file and applied to both datasets.

The headers were used to filter out only means and standard deviations from the set of observations using a regular expression on the header names. 
We create a logical mask using the `<grepl>` function: `<grepl("mean\\(\\)|std\\(\\)", features[, 2])>`. 
Next, test and train data sets were merged into one, named `<merged_data>`. 

An aggregation was performed on all columns of the data frame, grouping by `<subject_ID>` and `<activity>`. 


When the script `<run_analysis.R>` is executed it will output tab separated values to a text file `<tidy_dataset.txt>` in the working directory.


# Data
This code book summarizes the resulting data fields:
* subject_ID : The ID of the test subject 
*  activity : The type of activity performed when the corresponding measurements were taken Measurements

* BodyAccMeanX
* BodyAccMeanY
* BodyAccMeanZ
* BodyAccStdX
* BodyAccStdY
* BodyAccStdZ
* GravityAccMeanX
* GravityAccMeanY
* GravityAccMeanZ
* GravityAccStdX
* GravityAccStdY
* GravityAccStdZ
* BodyAccJerkMeanX
* BodyAccJerkMeanY
* BodyAccJerkMeanZ
* BodyAccJerkStdX
* BodyAccJerkStdY
* BodyAccJerkStdZ
* BodyGyroMeanX
* BodyGyroMeanY
* BodyGyroMeanZ
* BodyGyroStdX
* BodyGyroStdY
* BodyGyroStdZ
* BodyGyroJerkMeanX
* BodyGyroJerkMeanY
* BodyGyroJerkMeanZ
* BodyGyroJerkStdX
* BodyGyroJerkStdY
* BodyGyroJerkStdZ
* BodyAccMagMean
* BodyAccMagStd
* GravityAccMagMean
* GravityAccMagStd
* BodyAccJerkMagMean
* BodyAccJerkMagStd
* BodyGyroMagMean
* BodyGyroMagStd
* BodyGyroJerkMagMean
* BodyGyroJerkMagStd
* BodyAccMeanX
* BodyAccMeanY
* BodyAccMeanZ
* BodyAccStdX
* BodyAccStdY
* BodyAccStdZ
* BodyAccMeanFreqX
* BodyAccMeanFreqY
* BodyAccMeanFreqZ
* BodyAccJerkMeanX
* BodyAccJerkMeanY
* BodyAccJerkMeanZ
* BodyAccJerkStdX
* BodyAccJerkStdY
* BodyAccJerkStdZ
* BodyAccJerkMeanFreqX
* BodyAccJerkMeanFreqY
* BodyAccJerkMeanFreqZ
* BodyGyroMeanX
* BodyGyroMeanY
* BodyGyroMeanZ
* BodyGyroStdX
* BodyGyroStdY
* BodyGyroStdZ
* BodyGyroMeanFreqX
* BodyGyroMeanFreqY
* BodyGyroMeanFreqZ
* BodyAccMagMean
* BodyAccMagStd
* BodyAccMagMeanFreq
* BodyBodyAccJerkMagMean
* BodyBodyAccJerkMagStd
* BodyBodyAccJerkMagMeanFreq
* BodyBodyGyroMagMean
* BodyBodyGyroMagStd
* BodyBodyGyroMagMeanFreq
* BodyBodyGyroJerkMagMean
* BodyBodyGyroJerkMagStd
* BodyBodyGyroJerkMagMeanFreq

Activity Labels:
* WALKING (value 1 ): subject was walking during the test 
* WALKING_UPSTAIRS (value 2 ): subject was walking up a staircase during the test 
* WALKING_DOWNSTAIRS (value 3 ): subject was walking down a staircase during the test 
* SITTING (value 4 ): subject was sitting during the test 
* STANDING (value 5 ): subject was standing during the test
* LAYING (value 6 ): subject was laying down during the test
