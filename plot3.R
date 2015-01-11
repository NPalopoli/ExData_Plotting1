## Set working directory
setwd("D://Coursera - Exploratory Data Analysis//W1//ExData_Plotting1")

## Download data
if (!file.exists("household_power_consumption.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = "household_power_consumption.zip")
}

## Read data
data <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")

## OPTIONAL: Summarize data
names(data)
summary(data)

## Subset and convert data
dataSet <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dataSet$DateTime <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
as.numeric.factor <- function(x) {  # convert factor to numeric
  as.numeric(levels(x))[x]
}
dataSet$Global_active_power <- as.numeric.factor(dataSet$Global_active_power)
dataSet$Sub_metering_1 <- as.numeric.factor(dataSet$Sub_metering_1)
dataSet$Sub_metering_2 <- as.numeric.factor(dataSet$Sub_metering_2)
dataSet$Sub_metering_3 <- as.numeric.factor(dataSet$Sub_metering_3)

## OPTIONAL: Set system language
Sys.setlocale("LC_TIME","C")
#Sys.setlocale("LC_TIME","Spanish_Argentina.1252")

## Plot Sub Meterings
png(filename="plot3.png", width=480, height=480, bg = "transparent", type = "cairo")
plot(dataSet$DateTime, dataSet$Sub_metering_1, ylab = "Energy sub metering", xlab = NA, type = "n")
lines(dataSet$DateTime, dataSet$Sub_metering_1, type = "l", ylab = NA, xlab = NA, col = "black")
lines(dataSet$DateTime, dataSet$Sub_metering_2, type = "l", ylab = NA, xlab = NA, col = "red")
lines(dataSet$DateTime, dataSet$Sub_metering_3, type = "l", ylab = NA, xlab = NA, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
dev.off()
