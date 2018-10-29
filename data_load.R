library(data.table)

#if file does not exit, download the file and unzip it
if(!file.exists("exdata%2Fdata%2Fhousehold_power_consumption.zip")) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
  file <- unzip(temp)
  unlink(temp)
}
  
#Read the data as a data table with header and separator as ';'
power <- read.table(file, header = TRUE, sep = ";")
#Convert the date string as a date variable
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
#Filter the data based on two dates 7/1/07 and 7/2/07 from the date column
twodaysdata <- power[(power$Date == "2007-02-01") | (power$Date == "2007-02-02"), ]
  
#Remove any unknown values in the columns
twodaysdata$Global_active_power <- as.numeric(as.character(twodaysdata$Global_active_power))
twodaysdata$Global_reactive_power <- as.numeric(as.character(twodaysdata$Global_reactive_power))
twodaysdata$Voltage <- as.numeric(as.character(twodaysdata$Voltage))

#Create a new column by appending the date and time
twodaysdata <- transform(twodaysdata, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
#Remove any unknown values in the columns
twodaysdata$Sub_metering_1 <- as.numeric(as.character(twodaysdata$Sub_metering_1))
twodaysdata$Sub_metering_2 <- as.numeric(as.character(twodaysdata$Sub_metering_2))
twodaysdata$Sub_metering_3 <- as.numeric(as.character(twodaysdata$Sub_metering_3))
  