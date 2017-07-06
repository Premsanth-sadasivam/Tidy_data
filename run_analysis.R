run_analysis <- function(){

subjecttest <- read.table("C:/Users/premsanth/Desktop/Data science coursera/R_programming/data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("C:/Users/premsanth/Desktop/Data science coursera/R_programming/data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/premsanth/Desktop/Data science coursera/R_programming/data/UCI HAR Dataset/test/y_test.txt")
test <- cbind(x_test,subjecttest,y_test)
subjecttrain <- read.table("C:/Users/premsanth/Desktop/Data science coursera/R_programming/data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("C:/Users/premsanth/Desktop/Data science coursera/R_programming/data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/premsanth/Desktop/Data science coursera/R_programming/data/UCI HAR Dataset/train/y_train.txt")
train <- cbind(x_train,subjecttrain,y_train)
final <- rbind(train,test)
names <- read.table("C:/Users/premsanth/Desktop/Data science coursera/R_programming/data/UCI HAR Dataset/features.txt")
name <- names[,2]
colnames(final) <- as.character(name)
names(final)[562:563] <- as.character(c("Subject","Activity"))

for(i in 1:length(final[,563]))
{
  dat <- c(1:6)
  cat <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
  final[,563][i] <- cat[grep(final[,563][i],dat)]
}


final1 <- (final)[c((grep(".*[Mm][Ee][aA][Nn][(][)]*.|.*[Ss][tT][dD][(][)]*.",names(final))),562,563)]

library(bazar)
x <- colnames(final1)
x <- mgsub(c("^f","^[Tt]"),c("Freq_","Time_"),x)
x <- mgsub(c("[Bb][oO][Dd][yY]","[Gr][Aa][Vv][iI][Tt][Yy]"),c("Body_","Grav_"),x)
x <- mgsub(c("[Aa][cC][Cc]","[gG][Yy][rR][Oo]"),c("Accel_","Gyro_"),x)
x <- mgsub(c("[jJ][Ee][Rr][Kk]"),c("Jerk_"),x) 
x <- mgsub(c("-[Xx]","-[Yy]","-[Zz]","[Mm][Aa][Gg]"),c("X_","Y_","Z_","Mag_"),x)
colnames(final1) <- c(x)

z <- summarise_all(group_by(final1,by=final1$Subject,final1$Activity),funs(mean))
write.table(z,file = "Tidy_data_set.txt",row.name = FALSE)

}







  
  
  
  
  
  
  
  








