Course Project - Getting and Cleaning Data

Using downloaded files from the Human Activity Recognition Using Smartphones Dataset

Code Book describes files in downloaded data set

For this project I was to:
•  Merge the training and the test sets to create one data set.
•	Extract only the measurements on the mean and standard deviation for each measurement. 
•	Uses descriptive activity names to name the activities in the data set
•	Appropriately label the data set with descriptive activity names. 
•	Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

I merged the files into one big set and included that new merged data set in this repository for future use under file name NewMergedDataTable.txt 

Assignment was to create two tidy data sets based on specified parameters

After merging the data sets into one and arranging the set based on Participant / Activites - I decided to do a sample of the first 8 columns verses the entire data set. When I decided to do that I saw that the first 8 columns were already sorted by mean and std so I didn't need to address that issue and write a sorting function