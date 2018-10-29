plot4 <- function() {
  par(mfrow=c(2,2))
  
  #first row, plot 1
  plot(twodaysdata$timestamp, twodaysdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  #first row, plot 2
  plot(twodaysdata$timestamp, twodaysdata$Voltage, type = "l", xlab = "", ylab = "Voltage")
  
  #second row, plot 1
  plot(twodaysdata$timestamp, twodaysdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(twodaysdata$timestamp, twodaysdata$Sub_metering_2, col = "red")
  lines(twodaysdata$timestamp, twodaysdata$Sub_metering_3, col = "blue")
  #bty - to remove the box around the legend
  #ce - shrinks the text to fit the area
  legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = c(1,1), bty = "n", cex = .5)
  
  
  #second row, plot 2
  plot(twodaysdata$timestamp, twodaysdata$Global_reactive_power, type = "l", 
       xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.copy(png, "plot4.png", width = 480, height = 480)
  dev.off()
}

plot4()