fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile ="./hpc.zip")
unzip("hpc.zip")
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?",
              colClasses = c("character","character",rep("numeric",7)))
EPC<-subset(a,Date=="1/2/2007"| Date=="2/2/2007")
timedate<-strptime(paste(EPC$Date,EPC$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
plot(timedate,EPC$Global_active_power,type ="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(timedate,EPC$Global_active_power)
dev.off()