#define source data
file <- "./household_power_consumption.txt"
df <- read.table(file, header=T, sep=";", quote="", na.strings = "?", stringsAsFactors=FALSE)

#specify dates
dfDates <- subset(df, df$Date=="1/2/2007" | df$Date=="2/2/2007")
dfDateTime <- strptime(paste(dfDates$Date, dfDates$Time), format= "%d/%m/%Y %H:%M:%S")

#create output
png("plot1.png", width=480,height=480)
hist(as.numeric(dfDates[,3]), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
