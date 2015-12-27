# run_analysis.R
# Romesh Kumbhani, 12-26-2015
# Coursera - Getting & Cleaning Data - Course Project

# Clear work environment
rm(list = ls())

# Load necessary libraries (or install them if necessary)
if ("data.table" %in% rownames(installed.packages()))
{
        library(data.table)
} else {
        install.packages("data.table")
        library(data.table)
}


# Check to see if we have the data, if not, get it and uncompress it.
if (!dir.exists("UCI HAR Dataset"))
{
        if (!file.exists("data.zip"))
                if (download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip",method="curl")==0) unzip("data.zip") 
        else stop("Could not download the required data set. Download the file manually, and unzip it in the same directory as the run_analysis.R script.")
        else unzip("data.zip")
}

# Read in the column labels, training data and testing data
feature_labels   <- as.character(read.table("./UCI HAR Dataset/features.txt")[,2])
activity_labels  <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names=c("activity_id","activity_name"))

# read in training data
trainingData     <- fread("./UCI HAR Dataset/train/X_train.txt",      header=FALSE,col.names = feature_labels)
trainingResult   <- fread("./UCI HAR Dataset/train/y_train.txt",      header=FALSE,col.names = c("activity_id"))
trainingSubjects <- fread("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names = c("subject_id"))

# read in testing data
testingData      <- fread("./UCI HAR Dataset/test/X_test.txt",        header=FALSE,col.names = feature_labels)
testingResult    <- fread("./UCI HAR Dataset/test/y_test.txt",        header=FALSE,col.names = c("activity_id"))
testingSubjects  <- fread("./UCI HAR Dataset/test/subject_test.txt",  header=FALSE,col.names = c("subject_id"))

# Merge training and testing datasets into one large data set (10299 observations x 561 variables)
allData          <- rbindlist(list(trainingData,testingData))

# Extract only the columns containing means and standard deviations
subData          <- allData[,grep("(mean\\(\\))|(std\\(\\))",feature_labels),with=FALSE]

# prepend columns with activity and subject IDs
tmp              <- merge(rbindlist(list(trainingResult,testingResult)),activity_labels,by="activity_id",sort=FALSE)
tmp$subject_id   <- factor(rbindlist(list(trainingSubjects,testingSubjects))[,subject_id])
subData          <- cbind(tmp[,names(tmp)[2:3],with=FALSE],subData)

# rename the data fields with better names (eg. something-mean()-X becomes something_X_mean)
names(subData)   <- gsub("-(mean|std)\\(\\)-([XYZ])","_\\2_\\1",names(subData))
names(subData)   <- gsub("-(mean|std)\\(\\)","_\\1",names(subData))

# create a summary data set ordered by two factors (activity_name & subject_id), then applies the mean function on the remaining variables
summaryData    <- dcast(melt(subData,id.vars = c("activity_name","subject_id")),activity_name+subject_id ~ variable,mean)

#set summaryData to be ordered by activity name, then subject id
setorder(summaryData,activity_name,subject_id)

# write out tidy summary data set
write.table(summaryData,file = "UCI_HAR_summary.txt",row.name=FALSE)