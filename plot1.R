## plot1.R: Reproduce Plot 1

## Felipe Aristizabal
## coursera: Exploratory Data Analysis
## Assignment 1



rm(list=ls())

## Read data from: ../data/household_power_consumption.txt
dat <- read.delim("../data/household_power_consumption.txt", sep=";",  nrows=69516, na.strings="?")
sel <- as.Date(dat$Date, "%d/%m/%Y") >= as.Date("2007-02-01")

dat <- dat[sel,]

## Convert to Date/Time
dt <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")


## Histogram
hist(dat$Global_active_power, col = "red",
	main = "Global Active Power",
	xlab = "Global Active Power (kilowatts)")

## Generate PNG file
dev.copy(png, filename="plot1.png", height = 480, width = 480)
dev.off()					## Write PNG image and close file

dev.off()					## Close figure (screen)
