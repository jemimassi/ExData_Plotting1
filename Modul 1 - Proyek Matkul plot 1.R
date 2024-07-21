data <- read.table(file = "C:/Users/jemim/OneDrive/ドキュメント/household_power_consumption.txt", head = TRUE)
head(data)
View(data)
data1 <- subset(data, subset =! (data$Date >= "2007/02/01"))
data1
str(data1)

