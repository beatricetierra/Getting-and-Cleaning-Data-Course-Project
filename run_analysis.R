# Import datasets
setwd("C:/Users/btierra/courses/03_GettingData/UCI HAR Dataset")

# Import descriptions
features <- read.table("features.txt", col.names = c("idx","measurement"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")

# Import measurement datasets
x_test <- read.table("test/X_test.txt", col.names = features$measurement)
y_test <- read.table("test/y_test.txt", col.names = "code")
x_train <- read.table("train/X_train.txt", col.names = features$measurement)
y_train <- read.table("train/y_train.txt", col.names = "code")

# Combine test and train datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data <- cbind(subject, x_data, y_data)

# Extract only the subject, code, mean, and std columns 
data_extracted <- data %>% select(subject, code, matches("mean|std"))

# Replace activity code with the activity description
data_extracted$code <- activities[data_extracted$code, 2]

# Replace column names with descriptive variable names
current_names <- names(data_extracted) # check current names
names(data_extracted)[2] = "activity"
names(data_extracted)<-gsub("Acc", "Accelerometer", names(data_extracted))
names(data_extracted)<-gsub("Gyro", "Gyroscope", names(data_extracted))
names(data_extracted)<-gsub("BodyBody", "Body", names(data_extracted))
names(data_extracted)<-gsub("Mag", "Magnitude", names(data_extracted))
names(data_extracted)<-gsub("^t", "Time", names(data_extracted))
names(data_extracted)<-gsub("^f", "Frequency", names(data_extracted))
names(data_extracted)<-gsub("tBody", "TimeBody", names(data_extracted))

# Summary dataframe (averaged by subject and activity)
Summary <- data_extracted %>% group_by(subject, activity) %>% summarise_all(list(mean))