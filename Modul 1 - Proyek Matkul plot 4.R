data <- read.table(file = "C:/Users/jemim/OneDrive/ドキュメント/household_power_consumption.txt", header = T, sep = ";",na.strings = "?",stringsAsFactors = FALSE, dec=".")
head(data)

library(dplyr)
library(lubridate)
library(data.table)
data1 <- subset(data, Date >= as.Date("1/2/2007") & Date <= as.Date("2/2/2007"))
data1 <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2))
with(data1,{
  plot(data2, data1$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(data2, data1$Sub_metering_1, type = "l", ylab = "Energy Sub metering", xlab = "", 
       ylim=c(0,38))
  par(new=T)
  plot(data2, data1$Sub_metering_3, type = "l", ylab = "Energy Sub metering", 
       xlab = "", ylim = c(0,38), col = "blue")
  par(new = T)
  plot(data2, data1$Sub_metering_2, type = "l",ylab = "Energy Sub metering", xlab = "", 
       ylim = c(0,38), col = "red")
  legend("topright", inset = .01,
         col = c("black", "red", "blue"), 
         lty = c(1,1,1), lwd = 2,
         cex=.65, bty="n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
  plot(data2, data1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(data2, data1$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
