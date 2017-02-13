data <- read.table("../Data/household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data1 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
data1$Weekday <- weekdays(strptime(paste(data1$Date, data1$Time, sep=""), '%Y-%m-%d %H:%M:%S'))
tickIndex0 <- 1
tickIndex1 <- which(data1$Date == "2007-02-01" & data1$Time=="23:59:00")
tickIndex2 <- which(data1$Date == "2007-02-02" & data1$Time=="23:59:00")
legendStrings = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legendColors = c("black", "red", "blue")
png(filename="Plot4.png")
par(mfrow=c(2,2), cex= 0.8, mar=c(4,4,4,4), oma=c(2,2,2,2))
# Global Active Power
plot(as.numeric(data1$Global_active_power), type="l",ylab = "Global Active Power (kilowatts)",
     xlab = "", xaxt = "n")
axis(1, at=c(tickIndex0, tickIndex1, tickIndex2), labels=c("Thu", "Fri", "Sat") )
# Voltage
plot(as.numeric(data1$Voltage), type="l",ylab = "Voltage",xlab = "datetime", xaxt = "n")
axis(1, at=c(tickIndex0, tickIndex1, tickIndex2), labels=c("Thu", "Fri", "Sat") )
# Sub Metering
plot(as.numeric(data1$Sub_metering_1), type="l",ylab = "Energy sub metering",
     xlab = "", xaxt = "n")
lines(as.numeric(data1$Sub_metering_2), col="red")
lines(as.numeric(data1$Sub_metering_3), col="blue")
legend("topright", legend = legendStrings, col = legendColors, lwd=1, cex=0.6)
axis(1, at=c(tickIndex0, tickIndex1, tickIndex2), labels=c("Thu", "Fri", "Sat") )
# Global Reactive Power
plot(as.numeric(data1$Global_reactive_power), type="l",ylab = "Global_reactive_power",
     xlab = "datetime", xaxt = "n")
axis(1, at=c(tickIndex0, tickIndex1, tickIndex2), labels=c("Thu", "Fri", "Sat") )
dev.off()