run_analysis <- function()
{
    # Acquire Human Activity Recognition data from University of California, Irvine
    
    source(paste(getwd(), "downloadAndUnzip.R", sep="/"))
    
    targetDirectory <- "getAndCleanData/courseProject"
    
    downloadAndUnzip(sourceUrl        = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                     targetDirectory  = targetDirectory,
                     downloadFileName = "humanActivityRecognition.zip")
    
    # Load and merge the researchers pre-processed sensor signals, combining training and test sets
    # for measures, activities and subjects respectively.
    
    uciHarPath <- "UCI HAR Dataset"
    testPath   <- paste(targetDirectory, uciHarPath, "Test",  sep="/")
    trainPath  <- paste(targetDirectory, uciHarPath, "Train", sep="/")
    
    measures   <- rbind(read.table(paste(testPath,  "X_test.txt",  sep="/"), stringsAsFactors=FALSE),
                        read.table(paste(trainPath, "X_train.txt", sep="/"), stringsAsFactors=FALSE))
        
    activities <- rbind(read.table(paste(testPath,  "y_test.txt",  sep="/"), stringsAsFactors=FALSE),
                        read.table(paste(trainPath, "y_train.txt", sep="/"), stringsAsFactors=FALSE))
    
    subjects   <- rbind(read.table(paste(testPath,  "subject_test.txt",  sep="/"), stringsAsFactors=FALSE),
                        read.table(paste(trainPath, "subject_train.txt", sep="/"), stringsAsFactors=FALSE))

    # Create descriptive activity names
    
    activities$V1 = factor(activities$V1, labels=c("WALKING",
                                                   "WALKING_UPSTAIRS",
                                                   "WALKING_DOWNSTAIRS",
                                                   "SITTING",
                                                   "STANDING",
                                                   "LAYING"))    
        
    # Read measurement labels listed in the features.txt source file 
    
    features <- read.table(paste(targetDirectory, uciHarPath, "features.txt",  sep="/"), stringsAsFactors=FALSE)
    
    # Construct a single table by combining the subjects, activities and computed
    # mean and standard deviation measurement columns
    
    meanSumMatchPattern <- ".(-mean|-std[.]*)"
    
    harSummary <- cbind(subjects, 
                        activities, 
                        measures[, grep(meanSumMatchPattern, features$V2)])
    
    # Label data with descriptive variable names

    colnames(harSummary) <- c("subjectId", 
                              "activity", 
                              grep(meanSumMatchPattern, features$V2, value=TRUE))
          
    # Create a second, independent tidy data set with the average of each measure
    # by activity and subject. 
    
    tidy <- aggregate(harSummary[,3:ncol(harSummary)],
                      by=list(harSummary$subjectId, harSummary$activity),
                      mean)
    
    colnames(tidy)[1] <- "subjectId"
    
    colnames(tidy)[2] <- "activity"
    
    write.table(tidy, 
                file=paste(targetDirectory, "tidy.txt",  sep="/"), 
                row.names=FALSE)
}