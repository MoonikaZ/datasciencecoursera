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

# plot1
hist(power_consump_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480 )
dev.off()
