plot1 <- function(){
    #Extracts data for the two days
    data <- read.table( file , sep = ";", header = TRUE)
    data$Date <- as.Date( data$Date, format = "%d/%m/%Y" )
    feb <- data[ data$Date == "2007-02-01"| data$Date == "2007-02-02", ]
    feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))
    
    #Creates graph
    png(filename="plot1.png", width = 480, height = 480)
    hist( feb$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red" )
    dev.off()
}