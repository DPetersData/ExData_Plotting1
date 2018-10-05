# R Code to produce Plot 2 of the Exploratory Data Analysis Course

# Read the txt file named "household_power_consumption.txt"
power_data <- read.table("Data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

# Convert Date and Time columns to date type
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
# may not need this -- power_data$Time <- as.Date(power_data$Time, format = "%H:%M:%S")
    
# Subset to just the dates from 2007/02/01 to 2007/02/02
power_data <- power_data[(power_data$Date == "2007-02-01" | power_data$Date == "2007-02-02"), ]

# Combine Date and Time columns & produce a week day column
power_data$Day = strptime(paste(power_data$Date, power_data$Time), format = '%Y-%m-%d %H:%M:%S')
power_data$Weekday <- weekdays(power_data$Day, abbreviate = TRUE)

# Convert Global_active_power column to numeric
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

# Convert Global_active_power column from watts to kilowatts
power_data$Global_active_power <- power_data$Global_active_power / 1000

# Open PNG, create plot, close the file
png("plot2.png", width = 480, height = 480)
plot(power_data$Day, power_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts")
dev.off()