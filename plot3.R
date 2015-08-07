# Load a part of the dataset that contains the needed dates
data <- read.table("household_power_consumption.txt", sep = ";", skip = 65000, nrows = 5000)
cols <- names(read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1))
names(data) <- cols
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the exact dates needed
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()