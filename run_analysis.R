# Set the working directory
# getwd()
# setwd("E:/RPractice/RProject1/UCI HAR Dataset")

# Read all train and test datasets
tempXTrain<-read.table("train/X_train.txt")
tempXTest<-read.table("test/X_test.txt")

tempYTrain<-read.table("train/Y_train.txt")
tempYTest<-read.table("test/Y_test.txt")

tempSubjectTrain<-read.table("train/subject_train.txt")
tempSubjectTest<-read.table("test/subject_test.txt")


# Horizontlly merge datasets for X,Y and Subject.

# Merge train & test features datasets
mergeX<-rbind(tempXTrain,tempXTest)
# Merge train & test activities datasets
mergeY<-rbind(tempYTrain,tempYTest)
# Merge Subjects
mergeSubject<-rbind(tempSubjectTrain,tempSubjectTest)

# Remove temp variables
rm(tempXTrain,tempXTest,tempYTrain,tempYTest,tempSubjectTrain,tempSubjectTest)

# Read all features names from features.txt
featuresName<-read.table("features.txt")

# name all Features 
xfeatureIndex<-1:561
names(mergeX)<-featuresName[xfeatureIndex,2]
# Rename features
names(mergeX) <- gsub("\\(|\\)", "", names(mergeX))
# Convert feature names to lower case
names(mergeX)<-tolower(names(mergeX))


# Read activity labels
#activityLabels<-read.table("activity_labels.txt")
#mergeY[,1]<-activityLabels[mergeY[,1],2]
# mergeY[,1]<-tolower(mergeY[,1])

# Renaming variables
names(mergeY)="activity"
names(mergeSubject)="subject"


# 1. Merges the training and the test sets to create one data set.
# Merge Features,Activities and Subjects into single dataset
cleanData<-cbind(mergeSubject,mergeY,mergeX)
write.table(cleanData,"cleanData.txt")
# look into cleanData
head(cleanData)
str(cleanData)
summary(cleanData)
dim(cleanData)
names(cleanData)


# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
# Features Extraction for mean and standard deviation

xFeatureIndex<-grep("mean()|std()",names(cleanData))
meanStdData<-cleanData[,c(1,2,xFeatureIndex)]
str(meanStdData)


# 3. Uses descriptive activity names to name the activities in the data set
# Read activity labels
activityLabels<-read.table("activity_labels.txt")
cleanData[,2]<-activityLabels[cleanData[,1],2]
cleanData[,2]<-tolower(cleanData[,2])
str(cleanData)

meanStdData[,2]<-activityLabels[meanStdData[,1],2]
meanStdData[,2]<-tolower(meanStdData[,2])
str(meanStdData)

# 4. Independent tidy data set with the average of each variable 
# for each activity and each subject.

library(plyr)
# Average of each variable for each activity and each subject
datasetwithAvg1<-ddply(cleanData, .(subject, activity),colwise(mean))

# Average  calculation in extracted dataset
datasetwithAvg2<-ddply(meanStdData, .(subject, activity),colwise(mean))

# Write to txt files
write.table(datasetwithAvg1, "dataWithAverages.txt")
write.table(datasetwithAvg2, "extractedDataWithAverages.txt")
# Note: In the above method of column means, the varaible names are not renamed

# head(datasetwithAvg)
# tail(datasetwithAvg)
# datasetwithAvg[3,3]
