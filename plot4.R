#Download Dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"./Dataset.zip", method = "curl")

#Unzip and Load dataset
unzip("./Dataset.zip")
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Convert Date column to Date data type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Create second dataset containing only the dataset with the desired dates
data2 <- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]

#Converting Time into Datetime
data2$Time <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

#Create four section
par(mfrow = c(2,2))

#Create first plot
plot(data2$Time, data2$Global_active_power, typ="l", ylab = "Global Active Power", xlab = "")

#Create second plot
plot(data2$Time, data2$Voltage, typ="l", ylab = "Voltage", xlab = "datetime")

#Create third plot
plot(data2$Time, as.numeric(levels(data2$Sub_metering_1))[data2$Sub_metering_1], typ="l", ylab = "Energy sub metering", xlab = "")
points(data2$Time, as.numeric(levels(data2$Sub_metering_2))[data2$Sub_metering_2], typ="l", col = "red")
points(data2$Time, data2$Sub_metering_3, typ="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=c(1,1))

#Create fourth plot
plot(data2$Time, data2$Global_reactive_power, typ="l", ylab = "Global_reactive_power", xlab = "datetime")

#Save image
dev.copy(png, file = "plot4.png")
dev.off()