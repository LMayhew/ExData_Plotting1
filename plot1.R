data <- read.table("../Data/household_power_consumption.txt", header=TRUE, sep=";",
      stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
dataSubSet <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
png(filename="Plot1.png")
hist(as.numeric(dataSubSet$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
