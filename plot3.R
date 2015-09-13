File <- "./household_power_consumption.txt"
data <- read.table(File, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsettingdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
extractday<- strptime(paste(subsettingdata$Date,subsettingdata$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
es1 <- as.numeric(subsettingdata$Sub_metering_1)
es2 <- as.numeric(subsettingdata$Sub_metering_2)
es3 <- as.numeric(subsettingdata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(extractday,es1, type="s",xlab="",
     ylab="Energy Sub metering")
lines(extractday,es2,col="red")
lines(extractday,es3,col="blue")
legend("topright",lty = 1,lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

