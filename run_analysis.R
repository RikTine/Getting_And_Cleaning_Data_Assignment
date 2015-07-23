#
# install necessary packages
library(dplyr)
#
# The following lines read the various dataset files
Test_Data <- read.table("test/X_test.txt")  
Training_Data <- read.table("train/X_train.txt")
Test_Activity <- read.table("test/y_test.txt")
Training_Activity <- read.table("train/y_train.txt")
Test_Subject <- read.table("test/subject_test.txt")
Training_Subject <- read.table("train/subject_train.txt")
Features <- read.table("features.txt")
#
# The following lines add the subject identifiers to the test 
# and training datasets
Test_Data <- cbind(Test_Subject, Test_Data)   
colnames(Test_Data)[1] <- "Subject"
Training_Data <- cbind(Training_Subject, Training_Data)
colnames(Training_Data)[1] <- "Subject"
#
# The following lines add the activity identifiers to the test 
# and training datasets
Test_Data <- cbind(Test_Activity, Test_Data)  
colnames(Test_Data)[1] <- "Activity"
Training_Data <- cbind(Training_Activity, Training_Data)
colnames(Training_Data)[1] <- "Activity"
#
# The following lines add readable activity descriptors to 
# the test and training datasets
Test_Data$Activity[Test_Data$Activity == 1] <- "Walking"
Test_Data$Activity[Test_Data$Activity == 2] <- "WalkingUpstairs"
Test_Data$Activity[Test_Data$Activity == 3] <- "WalkingDownstairs"
Test_Data$Activity[Test_Data$Activity == 4] <- "Sitting"
Test_Data$Activity[Test_Data$Activity == 5] <- "Standing"
Test_Data$Activity[Test_Data$Activity == 6] <- "Laying"
Training_Data$Activity[Training_Data$Activity == 1] <- "Walking"
Training_Data$Activity[Training_Data$Activity == 2] <- "WalkingUpstairs"
Training_Data$Activity[Training_Data$Activity == 3] <- "WalkingDownstairs"
Training_Data$Activity[Training_Data$Activity == 4] <- "Sitting"
Training_Data$Activity[Training_Data$Activity == 5] <- "Standing"
Training_Data$Activity[Training_Data$Activity == 6] <- "Laying"
#
# The following lines insert "Activity" and "Subject" as the 
# first two items in the Features list
Features$V2 <- as.character(Features$V2)
Features <- rbind(c(2, "Subject"), Features) 
Features <- rbind(c(1, "Activity"), Features)
Features$V1 <- seq(from = 1, to = 563)
#
# The following lines change the test data and training data 
# column names to the descriptive titles contained in the Features list
colnames(Test_Data) <- Features$V2
colnames(Training_Data) <- Features$V2
#
# The following lines shorten the test and training datasets 
# to only include the mean() and std() values
Keep_Columns1 <- grep("mean()", names(Test_Data))
Keep_Columns2 <- grep("std()", names(Test_Data))
Columns_To_Keep <- c(1, 2, Keep_Columns1, Keep_Columns2)
Test_Data2 <- Test_Data[ , Columns_To_Keep]
Training_Data2 <- Training_Data[ , Columns_To_Keep]
#
# The following lines merge the mean() and std() test and training datasets
# and organize the full dataset by activity and subject number
Full_Data <- rbind(Test_Data2, Training_Data2)
Full_Data2 <- arrange(Full_Data, Activity, Subject)
#
# The following command creates a tidy data set containing 
# the average of each mean() and std() feature for each activity 
# and each subject
Tidy_Output <- aggregate(Full_Data2[3:81], Full_Data2[1:2], mean)
#
# The following line writes the tidy data set to the project
# assignment output text file
write.table(Tidy_Output, "Tidy Output Project Assignment.txt", row.name = FALSE)
