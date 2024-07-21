data <- read.table(file = "C:/Users/jemim/OneDrive/ドキュメント/household_power_consumption.txt", header = T, sep = ";",na.strings = "?",stringsAsFactors = FALSE, dec=".")
head(data)

library(dplyr)
library(lubridate)
library(data.table)
data1 <- subset(data, Date >= as.Date("1/2/2007") & Date <= as.Date("2/2/2007"))
str(data1)
attach(data1)

# Create a sequence of time points for each minute
time_points <- seq.POSIXt(from = min(data1$Time), to = max(data1$Time), by = "min")

# Plot the data
plot(data1$Time, data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

# Customize the x-axis to display Thu, Fri, and Sat
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels = c("Thu", "Fri", "Sat"))

## create plot2.png

png(file = "plot2.png", width = 480, height = 480)  # Adjust width and height as needed

# Plot the data
plot(data1$Time, data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

# Customize the x-axis to display Thu, Fri, and Sat
axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels = c("Thu", "Fri", "Sat"))

dev.off()