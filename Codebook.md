Code Explanation

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:


1. Read train and test data for features(X), activities(Y) and subject into temporary R objects

tempXTrain<-read.table("train/X_train.txt")
tempXTest<-read.table("test/X_test.txt")

tempYTrain<-read.table("train/Y_train.txt")
tempYTest<-read.table("test/Y_test.txt")

tempSubjectTrain<-read.table("train/subject_train.txt")
tempSubjectTest<-read.table("test/subject_test.txt")


2. Merges the training and test sets to create one data set, namely
mergeX,mergeY and mergeSubject

3. Remove temporary Objects
tempXTrain,tempXTest,tempYTrain,tempYTest,tempSubjectTrain,tempSubjectTest

4. Reads file features.txt and assign names all features in "mergeX" R dataframe
   Convert featurenames to lower case
   
5. Rename variables in mergeY and mergeSubject for "activity" and "subject"    

6. columns combined to create a single dataset "cleanData" containing features,activity and subject
   write to txt file cleanData.txt
   
7. Create featureindex to extract mean and std for each measurement.
   subset cleanData to extract features into R dataframe meanStdData 

8. Read activity_labels.txt file and assign lables in R dataframe "cleanData" and "meanStdData"
There are 6 activities with labels
A. walking
B. walkingupstairs
C. walkingdownstairs
D. sitting
E. standing
F. laying

9. The script also appropriately labels the data set with descriptive names: all feature names (attributes) and
activity names are converted to lower case,and brackets () are removed.

10.  create independent tidy data set with the average of each variable for each activity and each subject
     and write to txt files.
     use plyr package and ddply() function to calculate average of each variables groupby each factors (subject and activity)
     
     txt files created are:
     dataWithAverages.txt
     extractedDataWithAverages.txt (extracted data for mean and std measurement of features)

