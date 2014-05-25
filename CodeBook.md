### Source project data:

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [background](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Dataset load and transform steps

The following are the steps performed by the run_analysis.R script.

1. Load test and training datasets by using loadData() function, which does the following things for each dataset: 
    1. Creates a list of features from features.txt file
    2. Defines the list of required features (by filtering columns that have ...mean and ...std keyword in their names)
    3. Loads data from X_ text file
    4. Subsets data to keep only the required features (means, and std deviation)
    5. Loads activity id data from y_ text file
    6. Loads subject id data from the subject text file
    7. Adds activity and subject id data to the X_ data

2. Merge the test and training datasets to create merged dataset
3. Extract activity label factors by using function getActivityLabelFactors() which loads them from activity_labels.txt file
4. Merge activity label factors with the merged dataset to associate activity types with activity ids, which essentially creates additional column (activityType) in the merged dataset
5. Defined id columns and measurement columns for the merged dataset
6. Melt the merged dataset by using acitivityId, activityType, and subjectId as ID variables
7. Recast the melted dataset with activityType and subjectId as the IDs and mean() as the function for remaining variables
6. Save the recasted dataset as "tidy_dataset.txt"


### Variable Descriptions

The data for this data set was derived from the original source provided in project instructions. 

Only the following types of values were saved in the resulting tidy dataset:
- mean: Mean value
- std: Standard deviation

#### Data Columns in resulting tidy dataset

[1] "activityType"                "subjectId"                   "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
[5] "tBodyAcc.mean...Z"           "tBodyAcc.std...X"            "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
[9] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"        "tGravityAcc.std...X"        
[13] "tGravityAcc.std...Y"         "tGravityAcc.std...Z"         "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
[17] "tBodyAccJerk.mean...Z"       "tBodyAccJerk.std...X"        "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
[21] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"          "tBodyGyro.std...X"          
[25] "tBodyGyro.std...Y"           "tBodyGyro.std...Z"           "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
[29] "tBodyGyroJerk.mean...Z"      "tBodyGyroJerk.std...X"       "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
[33] "tBodyAccMag.mean.."          "tBodyAccMag.std.."           "tGravityAccMag.mean.."       "tGravityAccMag.std.."       
[37] "tBodyAccJerkMag.mean.."      "tBodyAccJerkMag.std.."       "tBodyGyroMag.mean.."         "tBodyGyroMag.std.."         
[41] "tBodyGyroJerkMag.mean.."     "tBodyGyroJerkMag.std.."      "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
[45] "fBodyAcc.mean...Z"           "fBodyAcc.std...X"            "fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
[49] "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"       "fBodyAccJerk.std...X"       
[53] "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"        "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
[57] "fBodyGyro.mean...Z"          "fBodyGyro.std...X"           "fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
[61] "fBodyAccMag.mean.."          "fBodyAccMag.std.."           "fBodyBodyAccJerkMag.mean.."  "fBodyBodyAccJerkMag.std.."  
[65] "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.." 
