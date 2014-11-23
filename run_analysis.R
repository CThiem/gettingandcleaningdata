require(plyr)
require(dplyr)

measurements = read.csv("./features.txt",header=FALSE,sep="",colClasses=c("NULL","character"))

test = read.csv("./test/X_test.txt",stringsAsFactors=FALSE,header=FALSE,col.names=as.list(measurements$V2),sep="")
test_labels = read.csv("./test/y_test.txt",header=FALSE,col.names="Activity",colClasses="factor")
test_subject = read.csv("./test/subject_test.txt",header=FALSE,col.names="Subject",colClasses="factor")
test = cbind(test_subject,test_labels,test)


train = read.csv("./train/X_train.txt",stringsAsFactors=FALSE,header=FALSE,col.names=as.list(measurements$V2),sep="")
train_labels = read.csv("./train/y_train.txt",header=FALSE,col.names="Activity",colClasses="factor")
train_subject = read.csv("./train/subject_train.txt",header=FALSE,col.names="Subject",colClasses="factor")
train = cbind(train_subject,train_labels,train)

data = rbind(test,train)

levels(data$Activity) = read.csv("./activity_labels.txt",header=FALSE,sep="",stringsAsFactors=FALSE)$V2

meanstds = sort(c(1,2,grep(".mean",names(data)),grep(".std",names(data))))

data = data[,meanstds]

meanfreq = sort(grep(".meanFreq",names(data)))

data = data[,-meanfreq]

tidy_data = ddply(data,.(Subject,Activity),summarise_each,funs(mean))

tidy_data$Activity = factor(tidy_data$Activity)
levels(tidy_data$Activity) = read.csv("./activity_labels.txt",header=FALSE,sep="",stringsAsFactors=FALSE)$V2

write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)
