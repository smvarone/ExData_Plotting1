# Read the data obtained from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset the data from 2007-02-01 and 2007-02-02
data_2007 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Convert the Date and Time variables to Date/Time classes in R
data_2007$Date <- as.Date(data_2007$Date, format="%d/%m/%Y")
data_2007$Time <- strptime(data_2007$Time, format="%H:%M:%S")
data_2007[1:1440,"Time"] <- format(data_2007[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_2007[1441:2880,"Time"] <- format(data_2007[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Create the graph
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data_2007$Time,as.numeric(as.character(data_2007$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
plot(data_2007$Time,as.numeric(as.character(data_2007$Voltage)), type="l",xlab="datetime",ylab="Voltage")
plot(data_2007$Time,data_2007$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data_2007$Time,as.numeric(as.character(data_2007$Sub_metering_1)))
lines(data_2007$Time,as.numeric(as.character(data_2007$Sub_metering_2)),col="red")
lines(data_2007$Time,as.numeric(as.character(data_2007$Sub_metering_3)),col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
plot(data_2007$Time,as.numeric(as.character(data_2007$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()