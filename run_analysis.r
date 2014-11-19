#load libraries
library(reshape)

# load the data
subject.test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
x.test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
y.test <- read.table("UCI HAR Dataset\\test\\Y_test.txt")
subject.train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
x.train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
y.train <- read.table("UCI HAR Dataset\\train\\Y_train.txt")
activity.labels <- read.table("UCI HAR Dataset\\activity_labels.txt")
features <- read.table("UCI HAR Dataset\\features.txt")

# =====================================================================
# Step 1: merges the training and test sets to create 1 data set

# rename the column names using features data
colnames(x.train) <- features$V2
colnames(x.test) <- features$V2

# bind the activity labels with the data and name activity labels column
test.with.labels <- cbind(y.test, x.test)
train.with.labels <- cbind(y.train, x.train)
colnames(train.with.labels)[1] <- "activity"
colnames(test.with.labels)[1] <- "activity"

# bind subject with activity labels and data. Rename subject column
test.data <- cbind(subject.test, test.with.labels)
train.data <- cbind(subject.train, train.with.labels)
colnames(test.data)[1] <- "subject"
colnames(train.data)[1] <- "subject"

# bind the test and train data, and turn subject and activity into factors
all.data <- rbind(train.data, test.data)
all.data$subject <- as.factor(all.data$subject)
all.data$activity <- as.factor(all.data$activity)

# David Hood (CTA suggested each subject did each activity. This is a check to be sure
subject.activity <- unique(all.data[c("subject", "activity")]) # export unique combos
summary(subject.activity$activity) # each activity was performed by all 30 participants

# ======================================================================
# Step 2: extract only means and std for each measurement

# This selects only the mean and std for the signals "used to estimate variables of the 
# feature vector for each pattern" as described in the features_info.txt (i.e. does not 
# include the "additional vectors obtained by averaging the signals in a signal window 
# sample" because they seemed irrelevant
data.mean.std <- all.data[, grepl("activity|subject|mean[^Freq]()|std()", names(all.data))]

# =========================================================================
# Step 4: appropriately label the data set with descriptive variable names (from features.txt)
# change names of columns to be more descriptive and a bit cleaner using features_info
colnames(data.mean.std) <- gsub("()", "", colnames(data.mean.std), fixed = TRUE)
colnames(data.mean.std) <- gsub("-", "", colnames(data.mean.std), fixed = TRUE)
colnames(data.mean.std) <- gsub("mean", "Mean", colnames(data.mean.std), fixed = TRUE)
colnames(data.mean.std) <- gsub("std", "Std", colnames(data.mean.std), fixed = TRUE)
colnames(data.mean.std) <- gsub("^t", "time", colnames(data.mean.std))
colnames(data.mean.std) <- gsub("^f", "Fourier", colnames(data.mean.std))

# ======================================================================
# Step 3 - use descriptive activity names for the data set by merging data with activity.labels
with.activity.labels <- merge(data.mean.std, activity.labels, by.x = "activity", by.y = "V1")
with.activity.labels <- with.activity.labels[, c(69, 2:68)]
colnames(with.activity.labels)[1] <- "activity"
with.activity.labels$activity <- tolower(with.activity.labels$activity)
with.activity.labels$activity <- as.factor(with.activity.labels$activity)

# TIDY DATA - make data set tidy by having each row be an independent data point
melted.data <- melt(with.activity.labels, id = c("subject", "activity"))
melted.data$subject <- as.factor(melted.data$subject)

# =======================================================================
# Step 5, aggregate by subject and activity, and export data
aggregated.data <- aggregate(value ~ subject + activity + variable, data = melted.data, mean)
colnames(aggregated.data)[3:4] <- c("measurementDescription", "meanValue")
write.table(aggregated.data, "..\\..\\tidyData.txt", row.names = FALSE)