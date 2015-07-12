#Reading data from .txt file
mydata<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

#Subsetting the data for getting required data
data<-subset(mydata,(mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

#Creating the plot4
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, ylab="Global Active Power",type="l",xlab="")

plot(data$DateTime, data$Voltage, ylab="Voltage",type="l",xlab="datetime")

plot(data$DateTime, data$Sub_metering_1, ylab="Energy sub metering",type="l",xlab="")
lines(data$DateTime, data$Sub_metering_2,type="l",col="red")
lines(data$DateTime, data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,bty="n", col=c("black", "red", "blue"))

plot(data$DateTime, data$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")

dev.off()