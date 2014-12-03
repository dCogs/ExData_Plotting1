# read the table into epc (Electric Power Consumption)
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
epc <- epc[epc$Date=="2/2/2007" | epc$Date=="1/2/2007",]
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc$DOW <- factor(format(as.Date(epc$Date), "%a"), levels= c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))
epc$Time <- strptime(paste(epc$Date, epc$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

# plot the 4 charts in the assignment. Save as png file.
with (epc,
{
      
  plot(Time, Global_active_power, type="n", xlab="", ylab="Global Active Power")
  lines(Time, Global_active_power)

  plot(Time, Voltage, type="n", xlab="datetime", ylab="Global Active Power")
  lines(Time, Voltage)

  plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(Time, Sub_metering_1, col="black")
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1, 1, 1), pch = c(NA, NA, NA))

  plot(Time, Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(Time, Global_reactive_power)
})

dev.off()