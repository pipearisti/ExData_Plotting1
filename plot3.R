## plot3.R: Reproduce Plot 3

## Felipe Aristizabal
## coursera: Exploratory Data Analysis
## Assignment 1

## Clean workspace
rm(list=ls())

## Read directly form zip: exdata-data-household_power_consumption.zip
con <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
dat <- read.delim(con,	sep=";",  nrows=69517, na.strings="?")
sel <- as.Date(dat$Date, "%d/%m/%Y") >= as.Date("2007-02-01")
dat <- dat[sel,]

## Convert to Date/Time
dt <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

## Line plot -> directly to png
png(filename="plot3.png", height = 480, width = 480)
par(bg = NA)
plot(dt, dat$Global_active_power, type="n", 
	xlab = "", 
	ylab = "Energy sub metering", 
	ylim = c(0, 38))
lines(dt, dat$Sub_metering_1, col = "black")
lines(dt, dat$Sub_metering_2, col = "red")
lines(dt, dat$Sub_metering_3, col = "blue")
legend("topright", names(dat[7:9]), lwd = 1, 
       col = c("black", "red", "blue") )
dev.off()					## Write PNG image and close file
