setwd("/Users/cherry/Data/course4week1")
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings= "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
power <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
dev.copy(png, "plot1.png")
dev.off()

