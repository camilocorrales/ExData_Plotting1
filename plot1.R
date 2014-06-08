# Read of household_power_consumption.txt file that containt the data electric power consumption
dataset <- read.csv("household_power_consumption.txt", sep=";")
# Convert the column "Date" of dataset electric power consumption to Date Type
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
# Select the data of the date: 2007-02-01
datasetFebrary_1_2007 <- dataset[(dataset$Date == as.Date("2007-02-01")),]
# Select the data of the date: 2007-02-02
datasetFebrary_2_2007 <- dataset[(dataset$Date == as.Date("2007-02-02")),]
# Merge the vectors datasetFebrary_1_2007 and datasetFebrary_2_2007 per Columns
datasetFebrary_1_2_2007 <- rbind(datasetFebrary_1_2007,datasetFebrary_2_2007)
# Assign the column datasetFebrary_1_2_2007$Global_active_power to Global_active_power variable
Global_active_power <- datasetFebrary_1_2_2007$Global_active_power
# Convert the Global_active_power variable of Factor to Character
Global_active_power <- format(Global_active_power)
# Convert the Global_active_power variable of Character to Numeric
Global_active_power <- as.numeric(Global_active_power)
# Open png device
png(filename="plot1.png", width = 480, height = 480)
# Plot the Histogram
hist(Global_active_power, col = "red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
# Close the device using dev.off
dev.off()