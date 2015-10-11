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

#Create plot
plot(data2$Time, data2$Global_active_power, typ="l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Save image
dev.copy(png, file = "plot2.png")
dev.off()