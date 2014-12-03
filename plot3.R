# read the table into epc (Electric Power Consumption)
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
epc <- epc[epc$Date=="2/2/2007" | epc$Date=="1/2/2007",]
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc$Time <- strptime(paste(epc$Date, epc$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

# create the assigned plot as a png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(epc, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(epc, lines(Time, Sub_metering_1, col="black"))
with(epc, lines(Time, Sub_metering_2, col="red"))
with(epc, lines(Time, Sub_metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1, 1, 1), pch = c(NA, NA, NA))
dev.off()