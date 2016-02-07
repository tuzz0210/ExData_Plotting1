fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile ="./hpc.zip")
unzip("hpc.zip")
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?",
                       colClasses = c("character","character",rep("numeric",7)))
EPC<-subset(a,Date=="1/2/2007"| Date=="2/2/2007")
png(file="plot1.png")
hist(EPC$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
