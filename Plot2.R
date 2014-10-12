setwd("~/Coursera/Johns Hopkins University - Data Science Specialization/Course 4 - Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na='?')
data$Date_Time  <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")
a <- data[data$Date %in% (c('2007-02-01', '2007-02-02')),]

png("plot2.png", width=480, height=480)

plot(a$Date_Time, a$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()