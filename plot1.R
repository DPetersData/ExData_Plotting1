# R Code to produce Plot 1 of the Exploratory Data Analysis Course

# Read the txt file named "household_power_consumption.txt"
power_data <- read.table("Data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

# Convert Date column to date type
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

# Subset to just the dates from 2007/02/01 to 2007/02/02
power_data <- power_data[(power_data$Date == "2007-02-01" | power_data$Date == "2007-02-02"), ]

# Convert Global_active_power column to numeric
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

# Convert Global_active_power column from watts to kilowatts
power_data$Global_active_power <- power_data$Global_active_power / 1000

# Open PNG, create plot, close the file
png("plot1.png", width = 480, height = 480)
hist(power_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Reactive Power (kilowatts)")
dev.off()