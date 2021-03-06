setwd("/Users/cherry/Data/course4week1")
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings= "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
power <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
power$Time <- strptime(paste(power$Date, power$Time), format = "%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2), mar=c(4,4,2,1))
plot(x=power$Time, y=power$Global_active_power, type = "l", lty =1, ylab = "Global Active Power (kilowatts)", xlab = "")
plot(x=power$Time, y=power$Sub_metering_1, type = "l", lty =1, ylab = "Energy sub metering", xlab = "", col="black")
points(x=power$Time, y=power$Sub_metering_2, type = "l", lty =1, col="red")
points(x=power$Time, y=power$Sub_metering_3, type = "l", lty =1, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n")
plot(x=power$Time, y=power$Voltage, type = "l", lty =1, ylab = "Voltage", xlab = "datetime")
plot(x=power$Time, y=power$Global_reactive_power, type = "l", lty =1, ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
