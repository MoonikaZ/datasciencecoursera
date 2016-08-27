#loading library
library(dplyr)

#loading data
setwd ("C:/Users/Monika/Documents/DS_Specialization_Coursera/Explanatory data analysis/WK1/power_consumption/")
power_consumption <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings=c("?"), stringsAsFactors = FALSE)
head(power_consumption)
#str(power_consumption)
power_consump_data <- filter(power_consumption,Date=="1/2/2007" | Date=="2/2/2007")
power_consump_data$Date_Time <-paste(power_consump_data$Date, power_consump_data$Time)
#str(power_consump_data)

#plot3
plot(strptime(power_consump_data$Date_Time, "%d/%m/%Y %H:%M:%S"), power_consump_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(strptime(power_consump_data$Date_Time, "%d/%m/%Y %H:%M:%S"), power_consump_data$Sub_metering_2, type="l", col="red")
lines(strptime(power_consump_data$Date_Time, "%d/%m/%Y %H:%M:%S"), power_consump_data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480 )
dev.off()
