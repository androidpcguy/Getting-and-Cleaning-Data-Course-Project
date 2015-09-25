require(dplyr)


#TODO: ADD COMMENTS
run_analysis <- function(debug = FALSE) {
	#read train and test data into separate data frames
	training_data <- read.table("./data/train/X_train.txt", header = FALSE)
	testing_data <- read.table("./data/test/X_test.txt", header = FALSE)
	
	#get list of all measurements for colnames
	measurement_labs <- read.table("./data/features.txt", stringsAsFactors = FALSE)$V2
	
	#set the colnames of both data frames to the correct measurement labels
	colnames(training_data) <- measurement_labs
	colnames(testing_data) <- measurement_labs

	#read in subject ids for both train and test data frames
	training_subjects <- read.table("./data/train/subject_train.txt")
	testing_subjects <- read.table("./data/test/subject_test.txt")

	#attach Subject_ID to test data by row number
	testing_data$Subject_ID <- testing_subjects$V1

	#arrange data frame so that Subject_ID is 1st column
	testing_data <- testing_data[,c(562,1:561)]
	
	#do same thing for train data frame
	training_data$Subject_ID <- training_subjects$V1
	training_data <- training_data[,c(562,1:561)]
	
	#Add activity labels to each data frame by row
	testing_data$Activity <- read.table("./data/test/y_test.txt")$V1
	training_data$Activity <- read.table("./data/train/y_train.txt")$V1

	#I looked at the file that had the activity codes and just created a vector with the codes
	activity_code <- c(Walking=1,`Walking Up`=2,`Walking Down`=3,Sitting=4,Standing=5,Laying=6)
	
	#replace the activity code numbers with descriptive names in both test and train data frames
	testing_data$Activity <- names(activity_code)[match(testing_data$Activity,activity_code)]
	training_data$Activity <- names(activity_code)[match(training_data$Activity,activity_code)]
	
	#rearrange columns of both data frames such that Activity variable is 2nd column
	testing_data <- testing_data[,c(1,563,2:562)]
	training_data <- training_data[,c(1,563,2:562)]

	#merge test and train datasets using default merging parameters and new rows for new entries
	#so that no data are ommitted. ( by = intersect(names(x), names(y)) ) merge by all variables with
	#common names. Can do this since I set colnames on both data frames to be exactly the same and in
	#the same order
	merged_data <- merge(x=testing_data, y=training_data, all=TRUE)

	#IGNORE: Clean up colnames to include _Test, _Train instead of .x and .y
	#colnames(merged_data) <- gsub(".x", "_Test", colnames(merged_data),fixed=TRUE)
	#colnames(merged_data) <- gsub(".y", "_Train", colnames(merged_data),fixed=TRUE)
	
	#Subset only mean and std columns. 
	#I subsetted such that I would get mean(), std(), and meanFreq().
	subset_merged_data <- merged_data[,c("Subject_ID","Activity",grep("mean|std",colnames(merged_data),value=T))]
	
	#I grouped the merged data by Subject_ID and Activity so that I could calculate
	#mean of variables for each Activity each subject participated in
	grouped_data <- group_by(subset_merged_data, Subject_ID, Activity)
	
	#calculated mean of all variables for each activity for each subject
	grouped_mean <- grouped_data %>% summarize_each(c("mean"))
	
	#IGNORE: used this for testing purposes only
	if(debug) {
		View(grouped_mean)
	}

	#I will be creating a new subdirectory in the workspace called "clean_data/" and outputting tidy dataset there.
	if(!dir.exists("./clean_data")) {
		dir.create("./clean_data")
	}
	
	#write a .txt file using the parameter values as indicated on the submission page
	write.table(x = grouped_mean, file = "./clean_data/means_per_sub_per_activity.txt",row.names = FALSE)
}
