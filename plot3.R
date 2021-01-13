#Plot 3 programming assignment course 4 week 1 data science
#Plot 3 script Programming Assignment José Castillo Rabazo
library(lubridate)
library(dplyr)

if(!dir.exists("./data")){dir.create("./data")}
data <- read.table("./data/exdata_data_household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep = ";")
#We select data from the selected dates
#2007-02-01 and 2007-02-02

data1 <- data %>%
  filter(Date == "1/2/2007")
data2 <- data %>%
  filter(Date == "2/2/2007")
data_final <- rbind(data1,data2)

data_final$Sub_metering_1 <- as.numeric(data_final$Sub_metering_1)
data_final$Sub_metering_2 <- as.numeric(data_final$Sub_metering_2)
data_final$Sub_metering_3 <- as.numeric(data_final$Sub_metering_3)

data_final$Date <- strptime(paste(data_final$Date, data_final$Time, sep=" "),
                            "%d/%m/%Y %H:%M:%S")



#Plot creation
png("./plot3.png")

plot(data_final$Date, data_final$Sub_metering_1, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data_final$Date, data_final$Sub_metering_2, type="l", col="red")
lines(data_final$Date, data_final$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
