#define source data
file <- "household_power_consumption.txt"
df <- read.table(file, header=T, sep=";", quote="", na.strings = "?", stringsAsFactors=FALSE, dec=".")

#specify dates
subsetDates <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(subsetDates$Date, subsetDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Subset data
GAP <- as.numeric(subsetDates$Global_active_power)
GRP <- as.numeric(subsetDates$Global_reactive_power)
VOLT <- as.numeric(subsetDates$Voltage)
subMeter1 <- as.numeric(subsetDates$Sub_metering_1)
subMeter2 <- as.numeric(subsetDates$Sub_metering_2)
subMeter3 <- as.numeric(subsetDates$Sub_metering_3)

#create output
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
