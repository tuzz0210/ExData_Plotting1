fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile ="./hpc.zip")
unzip("hpc.zip")
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?",
              colClasses = c("character","character",rep("numeric",7)))
EPC<-subset(a,Date=="1/2/2007"| Date=="2/2/2007")
timedate<-strptime(paste(EPC$Date,EPC$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
plot(timedate,EPC$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(timedate,EPC$Sub_metering_1)
lines(timedate,EPC$Sub_metering_2,col="red")
lines(timedate,EPC$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()