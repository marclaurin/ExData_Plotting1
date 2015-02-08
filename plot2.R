#define source data
file <- "./household_power_consumption.txt"
df <- read.table(file, header=T, sep=";", quote="", na.strings = "?", stringsAsFactors=FALSE)

#specify dates
dfDates <- subset(df, df$Date=="1/2/2007" | df$Date=="2/2/2007")
dfDateTime <- strptime(paste(dfDates$Date, dfDates$Time, Header=T, sep=""), format= "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(dfDates$Global_active_power)

#create output
png("plot2.png", width=480,height=480)
plot(dfDateTime, GAP, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(dfDateTime, GAP)
dev.off()
