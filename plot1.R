setwd("~/david/data science with R/exploratory data analysis/week 1/ExData_Plotting1")
data <- read.csv("household_power_consumption.txt",  sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "plot1.png",width = 480, height = 480)
hist(data$Global_active_power,col = "red", main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)")

dev.off()
