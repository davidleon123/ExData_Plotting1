library(lubridate)
setwd("~/david/data science with R/exploratory data analysis/week 1/assignment")

data <- read.csv("household_power_consumption.txt",  sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "plot2.png",width = 480, height = 480)

data$t <- with(data, ymd(Date) + hms(Time))
plot(data$t, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
