#define source data
file <- "./household_power_consumption.txt"
df <- read.table(file, header=T, sep=";", quote="", na.strings = "?", stringsAsFactors=FALSE, dec=".")

#specify dates
subsetDates <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(subsetDates$Date, subsetDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Subset data
GAP <- as.numeric(subsetDates$Global_active_power)
subMeter1 <- as.numeric(subsetDates$Sub_metering_1)
subMeter2 <- as.numeric(subsetDates$Sub_metering_2)
subMeter3 <- as.numeric(subsetDates$Sub_metering_3)

#create output
png("plot3.png", width=480,height=480)
plot(dateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
