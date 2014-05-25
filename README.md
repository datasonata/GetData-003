### Running the script

- Clone the repository
- Download the [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract the zip file. It should result in a `UCI HAR Dataset` folder that has all the files in the required structure.
- Rename "UCI HAR Dataset" folder to "data" to avoid whilespace.
- Make sure you're working in a parent folder of "data" directory
- Run "Rscript <path to>/run_analysis.R"
- The tidy dataset should get created in the "data" directory as "tidy_dataset.txt"
- Code book for the tidy dataset is available [here](CodeBook.md)


### Assumptions

- The training and test data are available in folders named "train" and "test" respectively.
- For each of these data sets:
    - X_ text file contains measurement values
    - Y_ text file contains activity ids
    - subject_ text file contains subject ids
- Activity ids and labels are present in "activity_labels.txt" file
- Measurement features are in "features.txt" file
- Columns for mean values contains ...mean keyword in their name
- COlumns for standard deviation values contain ..std keyword in their name
