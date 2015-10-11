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

#Create histogram
hist(as.numeric(data2$Global_active_power)/500, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Save image
dev.copy(png, file = "polt1.png")
dev.off()
