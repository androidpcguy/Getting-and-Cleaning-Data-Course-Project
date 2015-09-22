require(dplyr)

run_analysis <- function(debug = FALSE) {
	training_data <- read.table("./data/train/X_train.txt", header = FALSE)
	testing_data <- read.table("./data/test/X_test.txt", header = FALSE)
	
	#get list of all measurements for colnames
	measurement_labs <- read.table("./data/features.txt", stringsAsFactors = FALSE)$V2
	
	colnames(training_data) <- measurement_labs
	colnames(testing_data) <- measurement_labs

	training_subjects <- read.table("./data/train/subject_train.txt")
	testing_subjects <- read.table("./data/test/subject_test.txt")

	testing_data$Subject_ID <- testing_subjects$V1
	testing_data <- testing_data[,c(562,1:561)]

	training_data$Subject_ID <- training_subjects$V1
	training_data <- training_data[,c(562,1:561)]
	
	#Add activity labels to each dataset

	testing_data$Activity <- read.table("./data/test/y_test.txt")$V1
	training_data$Activity <- read.table("./data/train/y_train.txt")$V1

	activity_code <- c(Walking=1,`Walking Up`=2,`Walking Down`=3,Sitting=4,Standing=5,Laying=6)
	testing_data$Activity <- names(activity_code)[match(testing_data$Activity,activity_code)]
	training_data$Activity <- names(activity_code)[match(training_data$Activity,activity_code)]
	
	testing_data <- testing_data[,c(1,563,2:562)]
	training_data <- training_data[,c(1,563,2:562)]

	merged_data <- merge(x=testing_data, y=training_data, all=TRUE)

	#IGNORE: Clean up colnames to include _Test, _Train instead of .x and .y
	#colnames(merged_data) <- gsub(".x", "_Test", colnames(merged_data),fixed=TRUE)
	#colnames(merged_data) <- gsub(".y", "_Train", colnames(merged_data),fixed=TRUE)
	
	#Subset only mean and std columns
	subset_merged_data <- merged_data[,c("Subject_ID","Activity",grep("mean|std",colnames(merged_data),value=T))]

	grouped_data <- group_by(subset_merged_data, Subject_ID, Activity)	
	grouped_mean <- grouped_data %>% summarize_each(c("mean"))
	
	if(debug) {
		View(grouped_mean)
	}

	if(!dir.exists("./clean_data")) {
		dir.create("./clean_data")
	}

	write.table(x = grouped_mean, file = "./clean_data/means_per_sub_per_activity.txt",row.names = FALSE)
}
