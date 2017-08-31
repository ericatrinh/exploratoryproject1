plot2 <- function(){
    #Extracts data for the two days
    data <- read.table( file , sep = ";", header = TRUE)
    data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )
   
    #Converts time and metering to appropiate types/format
    feb <- data[ data$Date == "2007-02-01"| data$Date == "2007-02-02", ]
    time <- paste( feb$Date, feb$Time, sep = " ")
    time <- strptime(time, format = "%Y-%m-%d %H:%M:%S" )
   
     #Creates the graph
    png(filename="plot2.png", width = 480, height = 480)
    plot( time, feb$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
    dev.off()
}