setwd("~/Coursera/Johns Hopkins University - Data Science Specialization/Course 4 - Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- strptime(data$Date, '%d/%m/%Y') 
a <- data[data$Date %in% (c('2007-02-01', '2007-02-02')),]

# Plot 1
# Start PNG device driver to save output to figure.png
png(filename="Plot1.png", bg="white", width=480, height=480)
hist(as.numeric(a$Global_active_power), col="red", ylim=c(0,1200),main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", las=1)
dev.off()