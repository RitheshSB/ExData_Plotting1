#Reading data from .txt file
mydata<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

#Subsetting the data for getting required data
data<-subset(mydata,(mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007"))

#Creating the plot1
png("plot1.png",width = 480,height = 480)
hist(data[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

