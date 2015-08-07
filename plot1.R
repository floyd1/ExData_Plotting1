# Load a part of the dataset that contains the needed dates
data <- read.table("household_power_consumption.txt", sep = ";", skip = 65000, nrows = 5000)
cols <- names(read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1))
names(data) <- cols
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the exact dates needed
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# First plot
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()