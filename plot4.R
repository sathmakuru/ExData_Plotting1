File                             <- "./household_power_consumption.txt"
data                             <- read.table(File, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsettingdata                   <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
extractday                       <- strptime(paste(subsettingdata$Date,subsettingdata$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
globalActivePower                <- as.numeric(subsettingdata$Global_active_power)
es1                              <- as.numeric(subsettingdata$Sub_metering_1)
es2                              <- as.numeric(subsettingdata$Sub_metering_2)
es3                              <- as.numeric(subsettingdata$Sub_metering_3)
voltage                          <- as.numeric(subsettingdata$Voltage)
globalreactivepower              <- as.numeric(subsettingdata$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#----plot 1-------
plot(extractday,globalActivePower, type="l",xlab="",
                                           ylab="Global Active Power")
#---- plot 2------
plot(extractday,voltage,type="s",xlab = "datetime", ylab = "Voltage")
#-----plot 3--------
plot(extractday,es1, type="s",xlab="",
     ylab="Energy sub metering")
lines(extractday,es2,col="red")
lines(extractday,es3,col="blue")
#---- plotting 4-------
plot(extractday,globalreactivepower,type="l",xlab = "datetime", ylab = "Global_reactive_power")

dev.off()