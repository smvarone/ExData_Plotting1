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
png("plot2.png", width=480, height=480)
plot(data_2007$Time,as.numeric(as.character(data_2007$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)",main="Global Active Power Vs Time")
dev.off()