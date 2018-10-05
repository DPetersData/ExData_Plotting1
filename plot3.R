# R Code to produce Plot 3 of the Exploratory Data Analysis Course

# Read the txt file named "household_power_consumption.txt"
power_data <- read.table("Data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

# Convert Date and Time columns to date type
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

# Subset to just the dates from 2007/02/01 to 2007/02/02
power_data <- power_data[(power_data$Date == "2007-02-01" | power_data$Date == "2007-02-02"), ]

# Combine Date and Time columns & produce a week day column
power_data$Day = strptime(paste(power_data$Date, power_data$Time), format = '%Y-%m-%d %H:%M:%S')
power_data$Weekday <- weekdays(power_data$Day, abbreviate = TRUE)

# Convert Sub_metering_x columns to numeric
power_data$Sub_metering_1 <- as.numeric(as.character(power_data$Sub_metering_1))
power_data$Sub_metering_2 <- as.numeric(as.character(power_data$Sub_metering_2))
power_data$Sub_metering_3 <- as.numeric(as.character(power_data$Sub_metering_3))

# Open PNG, create plot, close the file
png("plot3.png", width = 480, height = 480)
plot(power_data$Day, power_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_data$Day, power_data$Sub_metering_2, type = "l", col = "red")
lines(power_data$Day, power_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = c("-", "-", "-"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()