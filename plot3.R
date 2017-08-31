plot3 <- function(){
    #Extracts data for the two days
    data <- read.table( "household_power_consumption.txt" , sep = ";", header = TRUE)
    data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )
    feb <- data[ data$Date == "2007-02-01"| data$Date == "2007-02-02", ]
    
    #Converts time and metering to appropiate types/format
    time <- paste( feb$Date, feb$Time, sep = " ")
    time <- strptime(time, format = "%Y-%m-%d %H:%M:%S" )
    feb$Sub_metering_1<- as.numeric( as.character( feb$Sub_metering_1) )
    feb$Sub_metering_2<- as.numeric( as.character( feb$Sub_metering_2) )
    feb$Sub_metering_3<- as.numeric( as.character( feb$Sub_metering_3) )
    
    #Creates the graph
    lines <- c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
    colors <- c("black", "red", "blue")
    png(filename="plot3.png", width = 480, height = 480)
    plot(time, feb$Sub_metering_1, type = "l", ylab = "Energy sub metering")
    lines(time, feb$Sub_metering_2, col = "red")
    lines(time, feb$Sub_metering_3, col = "blue")
    legend( x = "topright", legend = lines, col = colors, lty = "solid" )
    dev.off()
}