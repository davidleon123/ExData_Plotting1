library(lubridate)
setwd("~/david/data science with R/exploratory data analysis/week 1/assignment")

data <- read.csv("household_power_consumption.txt",  sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$t <- with(data, ymd(Date) + hms(Time))

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
plot(data$t, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(data$t, data$Voltage, type = "l", 
     xlab = "", ylab = "Voltage")
plot(data$t, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub-metering")
lines(data$t, data$Sub_metering_2, col = "red")
lines(data$t, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty ="n" ,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$t, data$Global_reactive_power, type = "l", ylab ="Global_reactive_power")
dev.off()
