# Coursera - exploratory data analysis project, week 1 (Plots for household power consumption)

###########################################################################################################

# set working directory
        setwd("C:/files/My Files/reference/Online learning/coursera/data sci program/04 Exploratory data analysis/Week 1/Project")


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
                
### Plot 1 #####

        png("plot1.png", width=480, height=480) # open png file device

        # code for plot 1
                hist(power$Global_active_power,
                     main="Global Active Power",
                     xlab="Global Active Power (kilowatts)",
                     ylab="Frequency",
                     col="red")     
        
        dev.off() # close the png file device