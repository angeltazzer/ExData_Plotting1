setwd("~/Coursera/Johns Hopkins University - Data Science Specialization/Course 4 - Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na='?')
data$Date_Time  <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")
a <- data[data$Date %in% (c('2007-02-01', '2007-02-02')),]

png("plot3.png", width=480, height=480)

plot(a$Date_Time, a$Sub_metering_1, type="l",col="black", xlab="", ylab="Energy Sub Metering")
lines(a$Date_Time, a$Sub_metering_2, col="red")
lines(a$Date_Time, a$Sub_metering_3, col="blue")
legend("topright", 
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, bty = "n")

dev.off()