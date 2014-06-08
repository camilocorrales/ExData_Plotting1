# Read of household_power_consumption.txt file that containt the data electric power consumption
dataset <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
# Convert the column "Date" of dataset electric power consumption to Date Type
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
# Select the data of the date: 2007-02-01
datasetFebrary_1_2007 <- dataset[(dataset$Date == as.Date("2007-02-01")),]
# Select the data of the date: 2007-02-02
datasetFebrary_2_2007 <- dataset[(dataset$Date == as.Date("2007-02-02")),]
# Merge the vectors datasetFebrary_1_2007 and datasetFebrary_2_2007 per Columns
datasetFebrary_1_2_2007 <- rbind(datasetFebrary_1_2007,datasetFebrary_2_2007)
# concatenate the columns: Date and Time in a new column called: Datetime
datasetFebrary_1_2_2007$Datetime <- strptime(paste(datasetFebrary_1_2_2007$Date, datasetFebrary_1_2_2007$Time), "%Y-%m-%d %H:%M:%S")
# Open png device
png(filename="plot2.png", width = 480, height = 480)
# Plot the Time Series
plot(datasetFebrary_1_2_2007$Datetime, datasetFebrary_1_2_2007$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# Close the device using dev.off
dev.off()