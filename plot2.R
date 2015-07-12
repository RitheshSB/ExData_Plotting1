#Reading data from .txt file
mydata<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

#Subsetting the data for getting required data
data<-subset(mydata,(mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

#Creating the plot2
png("plot2.png",width = 480,height = 480)
plot(data$DateTime, data$Global_active_power, ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()
