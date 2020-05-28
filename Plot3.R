setwd("C:/Users/mattm/Desktop/Coursera")
library(base)
library(tidyverse)
library(dplyr)
library(readr)

electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
#electric$Time <- strptime(electric$Time, format = "%H:%M:%S")
power <- electric[(electric$Date=="2007-02-01") | (electric$Date=="2007-02-02"),] #?
datetime <- paste(power$Date, power$Time)
power$timestamp <- as.POSIXct(datetime)
#power$Global_active_power <- (as.numeric(as.character(power$Global_active_power)))
power$Sub_metering_1 <- (as.numeric(as.character(power$Sub_metering_1)))
power$Sub_metering_2 <- (as.numeric(as.character(power$Sub_metering_2)))
power$Sub_metering_3 <- (as.numeric(as.character(power$Sub_metering_3)))
####################################
par(mfrow = C(1, 1))
plot(power$timestamp, power$Sub_metering_1, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
lines(power$timestamp, power$Sub_metering_2, col = "red")
lines(power$timestamp, power$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),
                  lty=c(1,1), lwd=c(1,1), cex = .2)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()