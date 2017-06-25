# Coursera - exploratory data analysis project, week 1 (Plots for household power consumption)

###########################################################################################################

# set working directory
        setwd("C:/files/My Files/reference/Online learning/coursera/data sci program/05 Reproducible research/Week 4/Project")

### Download and the data and open in R

# download the data set into working directory and unzip
if(!file.exists("household_power_consumption.txt")) {
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, destfile="household_power_consumption.zip")  
        unzip("household_power_consumption.zip")
        }
        
# Read data into R        
        data <- "household_power_consumption.txt"        
        data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
        power <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
        
# set up and format variables          
        power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
        power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))
        power$Voltage <- as.numeric(as.character(power$Voltage))
        power <- transform(power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
        power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
        power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))
        
        
###########################################################################################################
        
# Plotting
        
### Plot 4 #####

# make a new variable datetime that combines Date and Time of recordings
        datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
        
        
        png("plot4.png", width=480, height=480) # open png file device

# code for plot 4
                par(mfrow = c(2, 2)) 
        
                with(power,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2))
                
                with(power, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
                
                with(power, plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
                with(power,lines(datetime, Sub_metering_2, type="l", col="red"))
                with(power, lines(datetime, Sub_metering_3, type="l", col="blue"))
                legend("topright", col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,box.lwd=0)
                
                with(power, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
        
        dev.off() # close the png file device


