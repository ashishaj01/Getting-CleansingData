Getting & Cleaning Data

Step1. Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
        into a folder on your local drive.

Step2. Open Rstudio  and set working directory using setwd() command


Step3. Create Rscript run_analysis.R and then: source("run_analysis.R")

Step4. Run the R script, it will read the train and test data dataset, merge dataset and write these files :

 cleanData.txt (# Merge Features,Activities and Subjects into single dataset)
 The R dataframe "meanStdData" contains Features Extracted for mean and standard deviation 
 The Rscript also correctly labels each activities

 Use plyr package and ddply() function to calculate average of each variable for each activity and each subject
 write the average output to text files
 
 datawithaverages.txt 
 extractedDataWithAverages.txt
 
 
Step5. Use data <- read.table("cleanData.txt") to read the latter. There are 30 subjects and 6 activities.Also read datafile
datawithaverages.txt and extractedDataWithAverages.txt  "for each activity and each subject".

Note that the provided R script has no assumptions on numbers of records, only on locations of files.
