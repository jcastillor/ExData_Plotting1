#Plot 2 programming assignment course 4 week 1 data science
#Plot 2 script Programming Assignment José Castillo Rabazo
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

data_final$Global_active_power <- as.numeric(data_final$Global_active_power)

data_final$Date <- strptime(paste(data_final$Date, data_final$Time, sep=" "),
                            "%d/%m/%Y %H:%M:%S")




#Plot creation
png("./plot2.png")
plot(data_final$Date, data_final$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
