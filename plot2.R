File <- "./household_power_consumption.txt"
data <- read.table(File, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsettingdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
extractday<- strptime(paste(subsettingdata$Date,subsettingdata$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsettingdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(extractday,globalActivePower, type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

