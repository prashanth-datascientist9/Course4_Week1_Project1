plot2 <- function() {
  #type = "l" - represents that the scatter plot to be a line instead of dots
  plot(twodaysdata$timestamp, twodaysdata$Global_active_power, type = "l", 
       xlab = "", ylab = "Global Active Power (kilowatts)")
  
  dev.copy(png, "plot2.png", width = 480, height = 480)
  dev.off()
}

plot2()