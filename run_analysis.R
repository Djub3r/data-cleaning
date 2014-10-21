# Load train dataset

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load test dataset

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge Data (point 1)

merged_X_data <- rbind(X_train,X_test)
merged_y_data <- rbind(y_train,y_test)
merged_subject_data <- rbind(subject_train,subject_test)

# Load Features

features <- read.table("UCI HAR Dataset/features.txt")

# Filter Mean or std data (point 2)

MeanOrStd_data <- merged_X_data[,grep(".*mean.*|.*std.*|.*Mean.*|.*Std.*", features[,2])]
names(MeanOrStd_data) <- features[grep(".*mean.*|.*std.*|.*Mean.*|.*Std.*", features[,2]),2]

# Load activities data (point 3)

Activities_data <- read.table("UCI HAR Dataset/activity_labels.txt")
merged_y_data[, 1] <- Activities_data[merged_y_data[, 1], 2]

# Correct columns names (point 4)

names(MeanOrStd_data) <- features[grep(".*mean.*|.*std.*|.*Mean.*|.*Std.*", features[,2]),2]
names(merged_y_data) <- "activity"
names(merged_subject_data) <- "subject"

# merge all data

All_data <- cbind(MeanOrStd_data,merged_y_data,merged_subject_data)

# create mean for subject/acitvities (point 5)

install.packages("plyr")
library(plyr)
Agg_data <- ddply(All_data, .(subject, activity), function(x) colMeans(x[,1:(dim(All_data)[2]-2)]))

write.table(Agg_data, "Agg_data.txt", row.name=FALSE)