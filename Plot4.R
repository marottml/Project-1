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
power$Global_active_power <- (as.numeric(as.character(power$Global_active_power)))
power$Global_reactive_power <- (as.numeric(as.character(power$Global_reactive_power)))
power$Sub_metering_1 <- (as.numeric(as.character(power$Sub_metering_1)))
power$Sub_metering_2 <- (as.numeric(as.character(power$Sub_metering_2)))
power$Sub_metering_3 <- (as.numeric(as.character(power$Sub_metering_3)))
power$Voltage <- (as.numeric(as.character(power$Voltage)))
####################################
par(mfrow = c(2, 2), mar = c(3,3,2,1), oma = c(0,0,2,0)) 
#plot1
plot(power$timestamp, power$Global_active_power, type = 'l', 
     ylab = "Global Active Power (kilowatts)", xlab = "")
#plot2
plot(power$timestamp, power$Voltage, type = 'l', 
     ylab = "Voltage", xlab = "datetime")
#Plot3
plot(power$timestamp, power$Sub_metering_1, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
lines(power$timestamp, power$Sub_metering_2, col = "red")
lines(power$timestamp, power$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),
       lty=c(1,1), lwd=c(1,1), cex = .2)
#Plot4
plot(power$timestamp, power$Global_reactive_power, type = 'l', 
     ylab = "Global Reactive Power (kilowatts)", xlab = "datetime")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()