## Set working directory
setwd("D://Coursera - Exploratory Data Analysis//W1")

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

## Subset data
dataSet <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Plot histogram of Global Active Power
as.numeric.factor <- function(x) {  # convert factor to numeric
  as.numeric(levels(x))[x]
}
png(filename="plot1.png", width=480, height=480) 
hist(as.numeric.factor(dataSet$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
