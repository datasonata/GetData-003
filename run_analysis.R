library(reshape2)

## function to load data from test and training data files
## valid values for data_type: "test", "train"

loadData <- function(data_type) {
  ## first load features vector
  feature_file <- file.path("data", "features.txt")
  features <- read.table(file=feature_file, sep=" ", header=FALSE, colClasses="character")
  
  ## extract feature vector to use with the test and training tables
  flist <- features[[2]]
  
  ## set names of required features
  req_features <- grep(".*mean\\(\\)|.*std\\(\\)", flist)
  
  ## read X data
  x_file <- file.path("data", data_type, paste0("X_", data_type, ".txt"))
  x_data <- read.table(file=x_file, header=FALSE, col.names=flist)
  
  ## keep only required features 
  x_data <- x_data[, req_features]
  
  ## read y data
  y_file <- file.path("data", data_type, paste0("y_", data_type, ".txt"))
  y_data <- read.table(file=y_file, header=FALSE, col.names=c("activityId"))
  
  ## read subject data
  s_file <- file.path("data", data_type, paste0("subject_", data_type, ".txt"))
  s_data <- read.table(file=s_file, header=FALSE, col.names=c("subjectId"))
  
  ## add activity and subject data as columns to the X data
  x_data$activityId <- y_data$activityId
  x_data$subjectId <- s_data$subjectId
  x_data
}

## function to get activity label factors/lables to be used in merging
getActivityLabelFactors <- function() {
  activity_label_file <- file.path("data", "activity_labels.txt")
  activity_labels <- read.table(file=activity_label_file, header=FALSE, as.is=TRUE, col.names=c("activityId", "activityType"))
  activity_labels$activityType <- as.factor(activity_labels$activityType)
  activity_labels
}


## load test data
test_data <- loadData("test")

## load training data
train_data <- loadData("train")

## merge test and training data
merged_data <- rbind(test_data, train_data)

## get activity labels
activity_label_factors <- getActivityLabelFactors()

## label the merged data with activity labels
labeled_data <- merge(merged_data, activity_label_factors)

## set id columns (columns 1,68,69)
id_cols = c("activityId", "activityType", "subjectId")

## set measurement columns (all the other)
measure_cols = colnames(labeled_data)[-c(1,68,69)]

## melt labeled dataset
melted_data <- melt(labeled_data,id=id_cols, measure.vars=measure_cols)

## reshape the melted dataset
reshaped_data <- dcast(melted_data, activityType + subjectId ~ variable, mean) 

## save reshaped_data (tidy dataset) into a file called tidy_dataset.txt
write.table(reshaped_data, "data/tidy_dataset.txt")


