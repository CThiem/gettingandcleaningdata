gettingandcleaningdata
======================

Getting and Data Repository for Course Project


The repository contains the run_analysis.R script to analyse the data provided for the course project.

The data is required to be in your working directory with the same folder structure as in the initially downloaded ZIP file

run_analysis.R does the following:

1. Load packages plyr and dplyr as they are needed for the functions summarise_each and ddply
2. Load the variable names from the features.txt
3. Load the observations, activity labels and subject ids for the test dataset and combine them into one dataframe called "test"
4. Load the observations, activity labels and subject ids for the training dataset and combine them into one dataframe called "train"
5. Combine the test and train datasets into one dataset called "data"
6. Load the descriptive activity names from the provided activity_labels.txt and rename the factor levels of the Activity variable in data accordingly
7. Look for all variable names that contain ".mean" or ".std", save their column numbers, sort them, and include the "Activity" and "Subject" variables as well
8. Reduce data to the dataset that only contains the variables searched for in Step 7
9. Search for all variables containing "meanFreq" and save their column numbers
10. Remove the variables from Step 9 from the dataset
11. Create the tidy dataset, where the average of observations for each subject and each activity are calculated for each variable. This is done by using summarise_each in combination with ddply. Results are grouped by Subject and Activity.
12. Make sure that Activity labels are not lost.
13. Write the tidy data into the "tidy_data.txt" file.
