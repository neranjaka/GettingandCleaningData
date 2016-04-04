library(dplyr) 
library(plyr) 
library(reshape2) 
#initially all necessary files were copied to the folder ""D:\\Studies\\getting and cleaning data\\Project\\Final"
setwd("D:\\Studies\\getting and cleaning data\\Project\\Final")

#reading the X_train and X_test
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")

#merging X_train and X_table to make a single table
X_complete <- rbind(X_train,X_test)

#reading features for column names
features <- read.table("features.txt",col.names=c("Index","Feature_label"))
feature_labels <- as.character(features[,2])

#giving columns there names
colnames(X_complete) <- feature_labels

#instructions to filter out means and standard deviations
split_fl <- strsplit(feature_labels,"\\-") #split feature lables
logic_MeanStd <- grepl('mean()|std()',split_fl) #logical vector True for mean() and std()
X_Meanstd <- X_complete[,logic_MeanStd] #extract means and standard deviations

#reading subject files
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
subject <- rbind(subject_train,subject_test) #mergeing train and test subjects respectivly
colnames(subject) <- "Subject" #naming the column

#reading and merging y_train and y_test
y_train <- read.table("Y_train.txt")
y_test <- read.table("Y_test.txt")
activity <- rbind(y_train,y_test)
colnames(activity) <- "activity_num" #naming the activity column

#reading activity labels and naming the columns
activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels)=c("activity_num","Activity")

#replacing activity number by their names
activity_final <- join(activity,activity_labels,by="activity_num")
activity_final[,1] <- NULL

#final data frame
X_final <- cbind(X_Meanstd,activity_final,subject)

temp_names <- names(X_Meanstd) #temporary 

#computing Acerages of variables by each Activity and each Subject
melted_X_final <- melt(X_final, id=c("Subject", "Activity"), measure.vars=temp_names)
mean_X_final <- dcast(melted_X_final, Activity + Subject ~ variable,mean)

#adjusting column names
col_names <- names(mean_X_final)
final_col_names <- gsub("[()-]","",col_names)
final_col_names <- gsub("BodyBody","Body",final_col_names)
final_col_names <- gsub("mean","Mean",final_col_names)
final_col_names <- gsub("-","",final_col_names)
final_col_names <- gsub("std","Std",final_col_names)
colnames(mean_X_final)=final_col_names

#generating final data sets
write.table(X_Meanstd, file = "nonfinal.txt",row.names=FALSE)
write.table(mean_X_final,file = "tidy_data.txt",row.names=FALSE)




