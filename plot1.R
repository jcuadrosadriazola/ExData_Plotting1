#read txt file
powerConsum <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Change classes of Date and Time variables
powerConsum$Date <- as.Date(powerConsum$Date, format = "%d/%m/%Y")
powerConsum$DateTime <- strptime(paste(powerConsum$Date,powerConsum$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
#Choose data from "2007-2-1" to "2007-2-2"
powerConsum <- powerConsum[powerConsum$Date >= "2007-2-1" & powerConsum$Date <= "2007-2-2",]

#Change classes of Data's 3:8 columns
powerConsum[,3] <- as.numeric(powerConsum[,3])
powerConsum[,4] <- as.numeric(powerConsum[,4])
powerConsum[,5] <- as.numeric(powerConsum[,5])
powerConsum[,6] <- as.numeric(powerConsum[,6])
powerConsum[,7] <- as.numeric(powerConsum[,7])
powerConsum[,8] <- as.numeric(powerConsum[,8])

#Plot 1
with(powerConsum, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
                       col = "red", main = "Global Active Power"))
#Save plot 1
dev.copy(device = png, width = 480, height = 480, file = "plot1.png")
dev.off()