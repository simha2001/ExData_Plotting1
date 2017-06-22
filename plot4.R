# Exploratory Data Analysis
# Course project 1: Plot4
# Narasimham
################################################################################
## load the data

data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data$datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))

# Plot 4

par(mfrow = c(2, 2))

plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(data$Voltage ~ data$datetime, type = "l")
plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(data$Global_reactive_power ~ data$datetime, type = "l")


# Save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

