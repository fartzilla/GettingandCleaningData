# The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

activity<-function(val) {
  if(val>6 | val<1) return(NA)
  return (activity_labels[val,2])
}
# borrowed from http://www.biostat.jhsph.edu/~rpeng/docs/R-large-tables.html
tab5rows <- read.table("UCI HAR Dataset/train/X_train.txt", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses = classes)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")
names(X_train)<-features[,2]
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = classes)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
names(X_test)<-features[,2]
X_train$activity<-apply(y_train,1,activity)
X_test$activity<-apply(y_test,1,activity)
X_train$subject<-as.factor(subject_train$V1)
X_test$subject<-as.factor(subject_test$V1)
Result.DS<-rbind(X_train,X_test)[,c(grep("-mean[(]|-std[(]",features[,2]),562,563)]
rm("X_test","X_train","activity_labels","features","subject_train",
   "tab5rows","y_test","y_train","classes","subject_test","activity")
# Now let's create the second dataset
library(reshape2)
meltData<-melt(Result.DS, id.vars = c("subject", "activity"),
     variable.name = "measure_variable", 
     value.name = "measure_value")
finalResult<-dcast(meltData, subject+activity ~ measure_variable, fun.aggregate = mean)
rm("meltData")
write.csv(finalResult,file="UHDmean.txt",row.names = F)
