
setwd("C:\\Users\\shannon\\rprogramming\\CourseprojectGCD\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset")


## First I am going to download the needed packages 

install.packages("data.table")
library("data.table")
install.packages("reshape2")
library("reshape2")

## Loading the data
## ## using header=FALSE so that the header elements are read in as entries in the data frame
x_test<- read.table("./test/X_test.txt", header=FALSE,sep="")
y_test<- read.table("./test/y_test.txt", header=FALSE,sep="")
subject_test<-read.table("./test/subject_test.txt", header=FALSE,sep="")

x_train<- read.table("./train/X_train.txt", header=FALSE,sep="")
y_train<- read.table("./train/y_train.txt", header=FALSE,sep="")
subject_train<-read.table("./train/subject_train.txt", header=FALSE,sep="")

## Now its time to bind
testdata<-cbind(subject_test,y_test,x_test)
traindata<-cbind(subject_train,y_train,x_train)
newdata_set<-rbind(testdata,traindata)


##Loading the naming conventions for data frame using stringsAsFactors=FALSE 
## which tells R to keep character variables as they are rather than convert to factors 
## using header=FALSE so that the header elements are read in as entries in the data frame and making 
## sure that the first two rows are assigned to headers
features <- read.table("./features.txt",stringsAsFactors =FALSE, header=FALSE, sep="")
names(newdata_set)[3:563]<-features[,2]
names(newdata_set)[1]<-"Participant"
names(newdata_set)[2]<-"Activity"
## Now adding the activity labels to 1:6 looping through all the data sets
newlabels <- read.table("./activity_labels.txt",stringsAsFactors =FALSE, header=FALSE, sep="")
for (x in 1:6){
  newdata_set$Activity[newdata_set$Activity ==x] <- newlabels[x,2]}

##checking to see if this worked as planned

head(newdata_set)
names(newdata_set)

##needing to reshape

reshaped_data<-melt(newdata_set,id=c("Participant","Activity"))

##checking to see if this worked as planned

head(reshaped_data)

##write entire merged data sset to txt file to add to code book

write.table(newdata_set,file="NewMergedDataTable.txt",sep=" ",append=FALSE)

## Select data sample of first eight columns which are mean and std values

TidySet1Data <- newdata_set[,1:8]
write.table(TidySet1Data,file="TidySet1Data.txt",sep=" ",append=FALSE)



## Create second tidy data set of averages

reshaped_mean <- dcast(reshaped_data,Participant+Activity ~variable,fun.aggregate=mean)

TidySetAverages <- reshaped_mean[,1:8]

write.table(TidySetAverages,file="TidySetAverages.txt",sep=" ",append=FALSE)
