plot4 <- function(){
    data <- read.table( "household_power_consumption.txt" , sep = ";", header = TRUE)
    data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )
    feb <- data[ data$Date == "2007-02-01"| data$Date == "2007-02-02", ]
    time <- paste( feb$Date, feb$Time, sep = " ")
    time <- strptime(time, format = "%Y-%m-%d %H:%M:%S" )
    feb$Sub_metering_1<- as.numeric( as.character( feb$Sub_metering_1) )
    feb$Sub_metering_2<- as.numeric( as.character( feb$Sub_metering_2) )
    feb$Sub_metering_3<- as.numeric( as.character( feb$Sub_metering_3) )
    lines <- c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
    colors <- c("black", "red", "blue")
    png(filename="plot4.png", width = 480, height = 480)
    par( mfrow = c(2,2) )
    #graph top-left
    plot( time, feb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    #grapgs top-right
    plot( time, feb$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    #graph bottom-left
    plot(time, feb$Sub_metering_1, type = "l", ylab = "Energy sub metering")
    lines(time, feb$Sub_metering_2, col = "red")
    lines(time, feb$Sub_metering_3, col = "blue")
    legend( x = "topright", legend = lines, col = colors, bty = "n", lty = "solid" )
    #graph bottom-right
    plot(time, feb$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    dev.off()
}