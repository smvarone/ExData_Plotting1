# Read the data obtained from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset the data from 2007-02-01 and 2007-02-02
data_2007 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Create the graph
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(data_2007$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()