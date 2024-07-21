data <- read.table(file = "C:/Users/jemim/OneDrive/ドキュメント/household_power_consumption.txt", header = T, sep = ";",na.strings = "?",stringsAsFactors = FALSE, dec=".")
head(data)

library(dplyr)
library(lubridate)
library(data.table)
data1 <- subset(data, Date >= as.Date("1/2/2007") & Date <= as.Date("2/2/2007"))
data2 <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(data2, data1$Sub_metering_1, type = "l", ylab = "Energy Sub metering", xlab = "", ylim=c(0,38))
par(new=T)
plot(data2, data1$Sub_metering_3, type = "l", ylab = "Energy Sub metering", xlab = "", ylim = c(0,38), col = "blue")
par(new = T)
plot(data2, data1$Sub_metering_2, type = "l", ylab = "Energy Sub metering", xlab = "", ylim = c(0,38), col = "red")
legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"), cex = 0.75, lty=c(1,1,1), lwd = 3)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
