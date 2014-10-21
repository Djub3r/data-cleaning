The program run_analysis.R has following requirements :

- Download file here :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Unzip file without modification in your working directory
- Run run_analysis.R

The program has 5 steps:

The first step merges X data, y data and subject data in three datasets after loading the file.
The second step filters the mean and standard deviation features.
The third step add activities to the dataset
The fourth step corrects the columns names.
The last step generate a Agg_data.txt file with average of the columns grouped by activity and subject.

This last step need the installation of plyr library (included in the program)
