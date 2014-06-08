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
png(filename="plot3.png", width = 480, height = 480)
# Plot the black line that show the Sub_metering_1 data 
plot(datasetFebrary_1_2_2007$Datetime, datasetFebrary_1_2_2007$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
# Plot the red line that show the Sub_metering_2 data 
points(datasetFebrary_1_2_2007$Datetime, datasetFebrary_1_2_2007$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
# Plot the blue line that show the Sub_metering_3 data 
points(datasetFebrary_1_2_2007$Datetime, datasetFebrary_1_2_2007$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
# write the legends of the lines: Sub_metering_1, Sub_metering_2, and Sub_metering_3 
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
# Close the device using dev.off
dev.off()