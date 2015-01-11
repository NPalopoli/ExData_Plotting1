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

## OPTIONAL: Set system language
Sys.setlocale("LC_TIME","C")
#Sys.setlocale("LC_TIME","Spanish_Argentina.1252")

## Plot Global Active Power per hour
png(filename="plot2.png", width=480, height=480)
plot(dataSet$DateTime, dataSet$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)
dev.off()
