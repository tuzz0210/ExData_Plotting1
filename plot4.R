fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile ="./hpc.zip")
unzip("hpc.zip")
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?",
              colClasses = c("character","character",rep("numeric",7)))
EPC<-subset(a,Date=="1/2/2007"| Date=="2/2/2007")
timedate<-strptime(paste(EPC$Date,EPC$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(timedate,EPC$Global_active_power,type ="n",xlab="",
     ylab="Global Active Power")
lines(timedate,EPC$Global_active_power)
plot(timedate,EPC$Voltage,type ="n",xlab="datetime",
     ylab="Voltage")
lines(timedate,EPC$Voltage)
plot(timedate,EPC$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(timedate,EPC$Sub_metering_1)
lines(timedate,EPC$Sub_metering_2,col="red")
lines(timedate,EPC$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),cex=0.6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(timedate,EPC$Global_reactive_power,type ="n",xlab="datetime",
     ylab = "Global_reactive_power")
lines(timedate,EPC$Global_reactive_power)
dev.off()