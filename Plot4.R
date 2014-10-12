setwd("~/Coursera/Johns Hopkins University - Data Science Specialization/Course 4 - Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na='?')
data$Date_Time  <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")
a <- data[data$Date %in% (c('2007-02-01', '2007-02-02')),]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# Plot 1
plot(a$Date_Time, a$Global_active_power, type="l", xlab="", ylab="Global Active Power ")

# Plot 2
plot(a$Date_Time, a$Voltage, type="l", xlab="datetime", ylab="Voltage ")

# Plot 3
plot(a$Date_Time, a$Sub_metering_1, type="l",col="black", xlab="", ylab="Energy Sub Metering")
lines(a$Date_Time, a$Sub_metering_2, col="red")
lines(a$Date_Time, a$Sub_metering_3, col="blue")
legend("topright", 
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, bty = "n")

# Plot 4
plot(a$Date_Time, a$Global_reactive_power, type="l",col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()