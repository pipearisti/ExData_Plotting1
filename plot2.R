## plot2.R: Reproduce Plot 2

## Felipe Aristizabal
## coursera: Exploratory Data Analysis
## Assignment 1



rm(list=ls())

## Read directly form zip: exdata-data-household_power_consumption.zip
con <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
dat <- read.delim(con,	sep=";",  nrows=69517, na.strings="?")
sel <- as.Date(dat$Date, "%d/%m/%Y") >= as.Date("2007-02-01")
dat <- dat[sel,]

## Convert to Date/Time
dt <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

## Line plot -> directly to png
png(filename="plot2.png", height = 480, width = 480)
plot(dt, dat$Global_active_power, type="n", 
	xlab = "", 
	ylab = "Global Active Power (kilowatts)")
lines(dt, dat$Global_active_power, col = "black")

dev.off()					## Write PNG image and close file
