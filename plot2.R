 data <- read.table("../Data/household_power_consumption.txt", header=TRUE, sep=";",
      stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data1 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
data1$Weekday <- weekdays(strptime(paste(data1$Date, data1$Time, sep=""), '%Y-%m-%d %H:%M:%S'))
tickIndex0 <- 1
tickIndex1 <- which(data1$Date == "2007-02-01" & data1$Time=="23:59:00")
tickIndex2 <- which(data1$Date == "2007-02-02" & data1$Time=="23:59:00")
png(filename="Plot2.png")
plot(as.numeric(data1$Global_active_power), type="l",ylab = "Global Active Power (kilowatts)",
      xlab = "", xaxt = "n")
axis(1, at=c(tickIndex0, tickIndex1, tickIndex2), labels=c("Thu", "Fri", "Sat") )
dev.off()
