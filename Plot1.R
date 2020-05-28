setwd("C:/Users/mattm/Desktop/Coursera")
library(base)
library(tidyverse)
library(dplyr)
library(readr)

electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$Time <- strptime(electric$Time, format = "%H:%M:%S")
power <- electric[(electric$Date=="2007-02-01") | (electric$Date=="2007-02-02"),]
par(mfrow = C(1, 1))
hist(as.numeric(as.character(power$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()