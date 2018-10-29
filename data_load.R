library(data.table)

#if file does not exit, download the file and unzip it
if(!file.exists("exdata%2Fdata%2Fhousehold_power_consumption.zip")) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
  file <- unzip(temp)
  unlink(temp)
}
  
power <- read.table(file, header = TRUE, sep = ";")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
twodaysdata <- power[(power$Date == "2007-02-01") | (power$Date == "2007-02-02"), ]
  
#Remove any unknown values in the columns
twodaysdata$Global_active_power <- as.numeric(as.character(twodaysdata$Global_active_power))
twodaysdata$Global_reactive_power <- as.numeric(as.character(twodaysdata$Global_reactive_power))
twodaysdata$Voltage <- as.numeric(as.character(twodaysdata$Voltage))
twodaysdata <- transform(twodaysdata, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
#Remove any unknown values in the columns
twodaysdata$Sub_metering_1 <- as.numeric(as.character(twodaysdata$Sub_metering_1))
twodaysdata$Sub_metering_2 <- as.numeric(as.character(twodaysdata$Sub_metering_2))
twodaysdata$Sub_metering_3 <- as.numeric(as.character(twodaysdata$Sub_metering_3))
  