# CodeBook for the tidy dataset

## Original dataset
The original dataset can be obtained here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Procedure
Test (`<X_test>` and `<y_test>`) and train (`<X_train>` and `<y_train>`) data were loaded separately. 
Headers for the `<X>`-values were extracted from `<features.txt>` file and applied to both datasets.

The headers were used to filter out only means and standard deviations from the set of observations using a regular expression on the header names. 
We create a logical mask using the `<grepl>` function: `<grepl("mean\\(\\)|std\\(\\)", features[, 2])>`. 
Next, test and train data sets were merged into one `<merged_data>`. 

An aggregation was performed on all columns of the data frame, grouping by `<subject_ID>` and `<activity>`. 


When the script `<run_analysis.R>` is executed it will output tab separated values to a text file `<tidy.txt>` in the working directory.
